<?php

namespace App\Http\Controllers;

use App\Repuesto;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class RepuestoController extends Controller
{
    public function create(Request $request)
    {
        $repuesto = new Repuesto;

        $repuesto->descripcion = $request->descripcion;
        $save = $repuesto->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Repuesto::all();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $repuesto = \App\Repuesto::find($request->id);

        $repuesto->descripcion = $request->descripcion;
        $save = $repuesto->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Repuesto::destroy($request->id);
        return parent::response($destroy,null);
    }
}
