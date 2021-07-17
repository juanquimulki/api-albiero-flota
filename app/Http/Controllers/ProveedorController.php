<?php

namespace App\Http\Controllers;

use App\Proveedor;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class ProveedorController extends Controller
{
    public function create(Request $request)
    {
        $proveedor = new Proveedor;

        $proveedor->razon_social = $request->razon_social;
        $save = $proveedor->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\Proveedor::all();
        return parent::response(true,$results);
    }

    public function update(Request $request)
    {
        $proveedor = \App\Proveedor::find($request->id);

        $proveedor->razon_social = $request->razon_social;
        $save = $proveedor->save();

        return parent::response($save,null);
    }

    public function delete(Request $request)
    {
        $destroy = \App\Proveedor::destroy($request->id);
        return parent::response($destroy,null);
    }
}
