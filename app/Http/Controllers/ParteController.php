<?php

namespace App\Http\Controllers;

use App\Parte;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class ParteController extends Controller
{
    public function create(Request $request)
    {
        $parte = new Parte;

        $parte->parte = $request->parte;
        $save = $parte->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Parte::orderBy("id","desc")->get();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $parte = \App\Parte::find($request->id);

        $parte->parte = $request->parte;
        $save = $parte->save();
        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Parte::destroy($request->id);
        return parent::response($destroy,null);
    }    
}
