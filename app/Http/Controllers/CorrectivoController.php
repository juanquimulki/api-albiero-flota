<?php

namespace App\Http\Controllers;

use App\Correctivo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class CorrectivoController extends Controller
{
    public function create(Request $request)
    {
        $correctivo = new Correctivo;

        $correctivo->id_vehiculo = $request->id_vehiculo;
        $correctivo->id_parte = $request->id_parte;
        $correctivo->id_tarea = $request->id_tarea;
        $correctivo->detalles = $request->detalles;
        $correctivo->fecha = $request->fecha;
        $correctivo->kilometros = $request->kilometros;

        $save = $correctivo->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Correctivo::
            with("vehiculo")
            ->with("parte")
            ->with("tarea")
            ->get();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $correctivo = \App\Correctivo::find($request->id);

        $correctivo->id_vehiculo = $request->id_vehiculo;
        $correctivo->id_parte = $request->id_parte;
        $correctivo->id_tarea = $request->id_tarea;
        $correctivo->detalles = $request->detalles;
        $correctivo->fecha = $request->fecha;
        $correctivo->kilometros = $request->kilometros;

        $save = $correctivo->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Correctivo::destroy($request->id);
        return parent::response($destroy,null);
    }

    public function agenda(Request $request)
    {
        $results = \App\Correctivo::
            select('correctivo.id','descripcion','alias','parte','tarea','detalles','fecha','correctivo.kilometros')            
            ->selectRaw('concat(descripcion," ","(",alias,")") as descripcion_alias') 
            ->selectRaw('datediff(?,fecha) as vencimientoDias',[date("Y-m-d")])
            ->selectRaw('vw_vehiculos_km.kilometros-correctivo.kilometros as vencimientoKms')
            ->join('vehiculos', 'correctivo.id_vehiculo', '=', 'vehiculos.id')
            ->join('partes', 'correctivo.id_parte', '=', 'partes.id')
            ->join('tareas', 'correctivo.id_tarea', '=', 'tareas.id')
            ->leftJoin('vw_vehiculos_km', 'vehiculos.id', '=', 'vw_vehiculos_km.id_vehiculo')
            ->orderBy('vencimientoDias','desc')
            ->get();

        return parent::response(true,$results);
    }    
}
