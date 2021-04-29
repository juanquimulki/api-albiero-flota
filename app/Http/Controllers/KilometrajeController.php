<?php

namespace App\Http\Controllers;

use App\Kilometraje;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class KilometrajeController extends Controller
{
    public function create(Request $request)
    {
        $kilometraje = new Kilometraje;

        $kilometraje->id_vehiculo = $request->id_vehiculo;
        $kilometraje->fecha_hora = $request->fecha_hora;
        $kilometraje->kilometros = $request->kilometros;
        $save = $kilometraje->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Kilometraje::with("vehiculo")->orderBy("id","desc")->get();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $kilometraje = \App\Kilometraje::find($request->id);

        $kilometraje->id_vehiculo = $request->id_vehiculo;
        $kilometraje->fecha_hora = $request->fecha_hora;
        $kilometraje->kilometros = $request->kilometros;
        $save = $kilometraje->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Kilometraje::destroy($request->id);
        return parent::response($destroy,null);
    }    

    public function vehiculo(Request $request)
    {
        $result = DB::table('vw_vehiculos_km')->where("id_vehiculo","=",$request->id_vehiculo)->get();
        return parent::response(true,$result);
    }    
}
