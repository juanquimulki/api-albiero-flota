<?php

namespace App\Http\Controllers;

use App\General;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class GeneralController extends Controller
{
    public function create(Request $request)
    {
        $general = new General;

        $general->id_vehiculo = $request->id_vehiculo;
        $general->detalles = $request->detalles;
        $general->fecha = $request->fecha;
        $general->hecho = $request->hecho;
        
        $save = $general->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\General::with("vehiculo")->get();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $general = \App\General::find($request->id);

        $general->id_vehiculo = $request->id_vehiculo;
        $general->detalles = $request->detalles;
        $general->fecha = $request->fecha;
        $general->hecho = $request->hecho;
        
        $save = $general->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\General::destroy($request->id);
        return parent::response($destroy,null);
    }    
}
