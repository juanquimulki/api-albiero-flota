<?php

namespace App\Exceptions;

use Illuminate\Validation\ValidationException;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Laravel\Lumen\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Illuminate\Http\Exception\HttpResponseException;
use Illuminate\Http\Response;
use Firebase\JWT\JWT;
use Firebase\JWT\ExpiredException;
use Firebase\JWT\BeforeValidException;
use Firebase\JWT\SignatureInvalidException;
use Throwable;
use Exception;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that should not be reported.
     *
     * @var array
     */
    protected $dontReport = [
        AuthorizationException::class,
        HttpException::class,
        ModelNotFoundException::class,
        ValidationException::class,
    ];

    /**
     * Report or log an exception.
     *
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param  \Throwable  $exception
     * @return void
     *
     * @throws \Exception
     */
    public function report(Throwable $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Throwable  $exception
     * @return \Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     *
     * @throws \Throwable
     */
    public function render($request, Throwable $e)
    {
        if (env('APP_DEBUG')) {
          return parent::render($request, $e);
        }

        $status = Response::HTTP_INTERNAL_SERVER_ERROR;
        $code = 0;
        $description = "";

        //ERRORES DE HTTP
        if ($e instanceof HttpResponseException) {
        } elseif ($e instanceof MethodNotAllowedHttpException) {
          $status = Response::HTTP_METHOD_NOT_ALLOWED;
          $e = new MethodNotAllowedHttpException([], 'HTTP_METHOD_NOT_ALLOWED', $e);
        } elseif ($e instanceof NotFoundHttpException) {
          $status = Response::HTTP_NOT_FOUND;
          $e = new NotFoundHttpException('HTTP_NOT_FOUND', $e);
        } elseif ($e instanceof AuthorizationException) {
          $status = Response::HTTP_FORBIDDEN;
          $e = new AuthorizationException('HTTP_FORBIDDEN', $status);
        } elseif ($e instanceof \Dotenv\Exception\ValidationException && $e->getResponse()) {
          $status = Response::HTTP_BAD_REQUEST;
          $e = new \Dotenv\Exception\ValidationException('HTTP_BAD_REQUEST', $status, $e);
  
        //ERROR DE PDO (BASE DE DATOS)
        } elseif ($e instanceof \PDOException) {
          $code = $e->errorInfo[1];
          $description = $e->errorInfo[2];
          $e = new \PDOException("HTTP_INTERNAL_SERVER_ERROR");
        
        //ERROR DE JWT
        } elseif ($e instanceof ExpiredException) {
          $code = 1;
          $status = Response::HTTP_UNAUTHORIZED;
          $description = $e->getMessage();
          $e = new ExpiredException("HTTP_UNAUTHORIZED");
        } elseif ($e instanceof BeforeValidException) {
          $code = 2;
          $status = Response::HTTP_UNAUTHORIZED;
          $description = $e->getMessage();
          $e = new BeforeValidException("HTTP_UNAUTHORIZED");
        } elseif ($e instanceof SignatureInvalidException) {
          $code = 3;
          $status = Response::HTTP_UNAUTHORIZED;
          $description = $e->getMessage();
          $e = new SignatureInvalidException("HTTP_UNAUTHORIZED");
        } elseif ($e instanceof \DomainException) {
          $code = 4;
          $status = Response::HTTP_UNAUTHORIZED;
          $description = $e->getMessage();
          $e = new \DomainException("HTTP_UNAUTHORIZED");
        
        //ERROR GENÉRICO
        } elseif ($e) {
          $e = new HttpException($status, 'HTTP_INTERNAL_SERVER_ERROR');
        }

        return response()->json([
          'success' => false,
          'status' => $status,
          'message' => $e->getMessage(),
          'code' => $code,
          'description' => $description
        ], $status);
    }
}
