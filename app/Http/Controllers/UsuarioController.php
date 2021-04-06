<?php

namespace App\Http\Controllers;

use App\Usuario;
use App\Permiso;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;
use Firebase\JWT\JWT;

class UsuarioController extends Controller
{
    public function create(Request $request) {
        $usuario = new Usuario;
        
        $usuario->user = $request->user;
        $usuario->name = $request->name;
        $usuario->pass = md5("1234");
        $save = $usuario->save();        

        if ($save) {
            foreach ($request->permisos as $permiso) {
                \App\Permiso::create([
                    "user" => $request->user,
                    "id_opcion" => $permiso
                ]);
            }
        }

        return parent::response($save, null);
    }

    public function read(Request $request)
    {
        $results = \App\Usuario::all();
        return parent::response(true,$results);
    }

    public function update(Request $request) {
        $usuario = \App\Usuario::find($request->id);

        if ($request->pass) {
            $usuario->pass = md5($request->pass);
        }
        
        $usuario->user = $request->user;
        $usuario->name = $request->name;
        $save = $usuario->save();        

        if ($save) {
            \App\Permiso::where('user', $request->user)->delete();

            foreach ($request->permisos as $permiso) {
                \App\Permiso::create([
                    "user" => $request->user,
                    "id_opcion" => $permiso
                ]);
            }
        }

        return parent::response($save, null);
    }

    public function delete(Request $request) {
        $destroy = \App\Usuario::destroy($request->id);

        if ($destroy) {
            \App\Permiso::where('user', $request->user)->delete();
        }

        return parent::response($destroy, null);
    }

    public function login(Request $request) {
        // if (date("Y-m-d")>=env('APP_EXP')) {
        //     return response()->json(["success"=>false,"code"=>3,"message"=>"Application expired"]);
        // }
        // else {
            $usuario = Usuario::where('user', $request->input('user'))->first();
            if ($usuario) {
                if (md5($request->input('pass')) == $usuario->pass) {
                    $token = $this->getToken($usuario->id,$usuario->user);
                    $menu = app('App\Http\Controllers\MenuController')->getMenu($usuario->user);
                    return response()->json(["success"=>true,"code"=>0,"message"=>"User logged in","name"=>$usuario->name,"token"=>$token,"menu"=>$menu]);
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

    private function getToken($id,$user) {
        $time = time();
        $key = env('APP_KEY'); //'my_secret_key';

        $token = array(
            'iat' => $time, // Tiempo que inició el token
            'exp' => $time + env('TOKEN_EXP'), // Tiempo que expirará el token
            'data' => [ // información del usuario
                'id' => $id,
                'name' => $user
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
