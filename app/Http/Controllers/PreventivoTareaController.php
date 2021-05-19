<?php

namespace App\Http\Controllers;

use App\PreventivoTarea;
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

        return parent::response($save,null);
    }
}
