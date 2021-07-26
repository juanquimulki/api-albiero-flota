<?php

namespace App\Http\Controllers;

use App\PreventivoRepuesto;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class PreventivoRepuestoController extends Controller
{
    public function create(Request $request)
    {
        $repuesto = new PreventivoRepuesto;

        $repuesto->id_tarea = $request->id_tarea;
        $repuesto->id_repuesto = $request->id_repuesto;
        
        $save = $repuesto->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\PreventivoRepuesto
            ::where("id_tarea","=",$request->id_tarea)
            ->with("repuesto")
            ->orderBy("id","asc")->get();
        return parent::response(true,$results);
    } 
    
    public function update(Request $request)
    {
        $repuesto = \App\PreventivoRepuesto::find($request->id);

        $repuesto->id_tarea = $request->id_tarea;
        $repuesto->id_repuesto = $request->id_repuesto;
        
        $save = $repuesto->save();

        return parent::response($save,null);
    }
    
    public function delete(Request $request)
    {
        $destroy = \App\PreventivoRepuesto::destroy($request->id);
        return parent::response($destroy,null);
    }    
}
