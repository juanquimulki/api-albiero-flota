<?php

namespace App\Http\Controllers;

use App\Preventivo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class PreventivoController extends Controller
{
    public function create(Request $request)
    {
        $preventivo = new Preventivo;

        $preventivo->id_vehiculo = $request->id_vehiculo;
        $preventivo->id_parte = $request->id_parte;
        $preventivo->id_tarea = $request->id_tarea;
        $preventivo->detalles = $request->detalles;
        $preventivo->frecuenciaDias = $request->frecuenciaDias;
        $preventivo->frecuenciaKms = $request->frecuenciaKms;
        $preventivo->ultimaFecha = $request->ultimaFecha;
        $preventivo->ultimoKms = $request->ultimoKms;

        $save = $preventivo->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Preventivo::
            with("vehiculo")
            ->with("parte")
            ->with("tarea")
            ->get();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $preventivo = \App\Preventivo::find($request->id);

        $preventivo->id_vehiculo = $request->id_vehiculo;
        $preventivo->id_parte = $request->id_parte;
        $preventivo->id_tarea = $request->id_tarea;
        $preventivo->detalles = $request->detalles;
        $preventivo->frecuenciaDias = $request->frecuenciaDias;
        $preventivo->frecuenciaKms = $request->frecuenciaKms;
        $preventivo->ultimaFecha = $request->ultimaFecha;
        $preventivo->ultimoKms = $request->ultimoKms;

        $save = $preventivo->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Preventivo::destroy($request->id);
        return parent::response($destroy,null);
    }

    public function agendaFecha(Request $request)
    {
        $results = \App\Preventivo::
            select('preventivo.id','descripcion','alias','patente','parte','tarea','detalles','frecuenciaDias','ultimaFecha')            
            ->selectRaw('concat(descripcion," ","(",alias,")") as descripcion_alias') 
            ->selectRaw('datediff(?,ultimaFecha)-frecuenciaDias as vencimiento',[$request->fecha])
            ->join('vehiculos', 'preventivo.id_vehiculo', '=', 'vehiculos.id')
            ->join('partes', 'preventivo.id_parte', '=', 'partes.id')
            ->join('tareas', 'preventivo.id_tarea', '=', 'tareas.id')
            ->whereRaw("datediff(?,ultimaFecha)>=frecuenciaDias",[$request->fecha])
            ->orderBy('vencimiento','desc')
            ->orderBy('frecuenciaDias','asc')                         
            ->get();
        return parent::response(true,$results);
    }

    public function agendaKilometros(Request $request)
    {
        $results = \App\Preventivo::
            select('preventivo.id','descripcion','alias','patente','parte','tarea','detalles','kilometros','fecha_hora','frecuenciaKms','ultimoKms')            
            ->selectRaw('concat(descripcion," ","(",alias,")") as descripcion_alias') 
            ->selectRaw('kilometros+? as kmsCalculados',[$request->kilometros])
            ->selectRaw('(kilometros+?)-(ultimoKms+frecuenciaKms) as vencimiento',[$request->kilometros])
            ->join('vehiculos', 'preventivo.id_vehiculo', '=', 'vehiculos.id')
            ->join('partes', 'preventivo.id_parte', '=', 'partes.id')
            ->join('tareas', 'preventivo.id_tarea', '=', 'tareas.id')
            ->leftJoin('vw_vehiculos_km', 'vehiculos.id', '=', 'vw_vehiculos_km.id_vehiculo')
            ->whereRaw("(kilometros+?)-(ultimoKms+frecuenciaKms) >= 0",[$request->kilometros])
            ->orderBy('vencimiento','desc')
            ->orderBy('frecuenciaDias','asc')                         
            ->get();
        return parent::response(true,$results);
    }
}
