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

        $save = $preventivo->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Preventivo::destroy($request->id);
        return parent::response($destroy,null);
    }
}
