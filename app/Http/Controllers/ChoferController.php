<?php

namespace App\Http\Controllers;

use App\Chofer;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class ChoferController extends Controller
{
    public function create(Request $request)
    {
        $chofer = new Chofer;

        $chofer->apenom = $request->apenom;
        $chofer->abrev = $request->abrev;
        $save = $chofer->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Chofer::all();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $chofer = \App\Chofer::find($request->id);

        $chofer->apenom = $request->apenom;
        $chofer->abrev = $request->abrev;
        $save = $chofer->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Chofer::destroy($request->id);
        return parent::response($destroy,null);
    }
}
