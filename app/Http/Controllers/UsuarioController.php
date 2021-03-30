<?php

namespace App\Http\Controllers;

use App\Usuario;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use Firebase\JWT\JWT;

class UsuarioController extends Controller
{
    public function login(Request $request) {
        // if (date("Y-m-d")>=env('APP_EXP')) {
        //     return response()->json(["success"=>false,"code"=>3,"message"=>"Application expired"]);
        // }
        // else {
            $usuario = Usuario::where('user', $request->input('user'))->first();
            if ($usuario) {
                if (md5($request->input('pass')) == $usuario->pass) {
                    $token = $this->getToken();
                    return response()->json(["success"=>true,"code"=>0,"message"=>"User logged in","name"=>$usuario->nombre,"token"=>$token]);
                }
                else {
                    return response()->json(["success"=>false,"code"=>2,"message"=>"Incorrect password"]);
                }
            }
            else {
                return response()->json(["success"=>false,"code"=>1,"message"=>"User not exists"]);
            }
        //}
    }

    private function getToken() {
        $time = time();
        $key = env('APP_KEY'); //'my_secret_key';

        $token = array(
            'iat' => $time, // Tiempo que inició el token
            'exp' => $time + env('TOKEN_EXP'), // Tiempo que expirará el token
            'data' => [ // información del usuario
                'id' => 1,
                'name' => 'Juanqui'
            ]
        );
        
        $jwt = JWT::encode($token, $key);
        return $jwt;
    }

    public function clave(Request $request) {
        $usuario = Usuario::where('user', $request->input('user'))->first();
        if ($usuario->pass == md5($request->pass)) {
            if ($request->nueva == $request->confirmacion) {
                $usuario->pass = md5($request->nueva);
                $usuario->save();
                return response()->json(["success"=>true,"code"=>0,"message"=>"Password changed"]);
            }
            else {
                return response()->json(["success"=>false,"code"=>2,"message"=>"No coincidence"]);
            }
        }
        else {
            return response()->json(["success"=>false,"code"=>1,"message"=>"Incorrect password"]);
        }        
    }
}
