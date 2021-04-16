<?php

namespace App\Http\Controllers;

use App\Vehiculo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class VehiculoController extends Controller
{
    public function create(Request $request)
    {
        $vehiculo = new Vehiculo;

        $vehiculo->id_tipo = $request->id_tipo;
        $vehiculo->descripcion = $request->descripcion;
        $vehiculo->alias = $request->alias;
        $vehiculo->patente = strtoupper($request->patente);
        $vehiculo->anio = $request->anio;
        $vehiculo->id_chofer = $request->id_chofer;
        $vehiculo->fecha_venc_gtia = $request->fecha_venc_gtia;
        $save = $vehiculo->save();

        return parent::response($save,null);
    }
    
    public function read(Request $request)
    {
        $results = \App\Vehiculo::with("tipo")->with("chofer")->get();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $vehiculo = \App\Vehiculo::find($request->id);

        $vehiculo->id_tipo = $request->id_tipo;
        $vehiculo->descripcion = $request->descripcion;
        $vehiculo->alias = $request->alias;
        $vehiculo->patente = strtoupper($request->patente);
        $vehiculo->anio = $request->anio;
        $vehiculo->id_chofer = $request->id_chofer;
        $vehiculo->fecha_venc_gtia = $request->fecha_venc_gtia;
        $save = $vehiculo->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Vehiculo::destroy($request->id);
        return parent::response($destroy,null);
    }    
}
