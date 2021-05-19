<?php

namespace App\Http\Controllers;

use App\PreventivoTarea;
use App\Preventivo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class PreventivoTareaController extends Controller
{
    public function create(Request $request)
    {
        $tarea = new PreventivoTarea;

        $tarea->id_preventivo = $request->id;
        $tarea->user = $request->user;
        $tarea->fecha = $request->fecha;
        $tarea->kilometros = $request->kilometros;
        $tarea->detalles = $request->detalles;
        $tarea->cumplimentado = $request->cumplimentado;
        
        $save = $tarea->save();

        $preventivo = \App\Preventivo::find($request->id);
        if ($preventivo->ultimaFecha) $preventivo->ultimaFecha = $request->fecha;
        if ($preventivo->ultimoKms) $preventivo->ultimoKms = $request->kilometros;
        $preventivo->save();

        return parent::response($save,null);
    }
}
