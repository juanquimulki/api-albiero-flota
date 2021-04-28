<?php

namespace App\Http\Controllers;

use App\Tarea;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class TareaController extends Controller
{
    public function create(Request $request)
    {
        $tarea = new Tarea;

        $tarea->tarea = $request->tarea;
        $save = $tarea->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Tarea::orderBy("id","desc")->get();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $tarea = \App\Tarea::find($request->id);

        $tarea->tarea = $request->tarea;
        $save = $tarea->save();
        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Tarea::destroy($request->id);
        return parent::response($destroy,null);
    }    
}
