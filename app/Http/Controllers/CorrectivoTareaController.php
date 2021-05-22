<?php

namespace App\Http\Controllers;

use App\CorrectivoTarea;
use App\Correctivo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class CorrectivoTareaController extends Controller
{
    public function create(Request $request)
    {
        $tarea = new CorrectivoTarea;

        $tarea->id_correctivo = $request->id;
        $tarea->user = $request->user;
        $tarea->fecha = $request->fecha;
        $tarea->kilometros = $request->kilometros;
        $tarea->detalles = $request->detalles;
        $tarea->cumplimentado = $request->cumplimentado;
        
        $save = $tarea->save();

        $correctivo = \App\Correctivo::find($request->id);
        $correctivo->cumplimentado = $request->cumplimentado;
        $correctivo->save();

        return parent::response($save,null);
    }
}
