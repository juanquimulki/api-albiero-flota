<?php

namespace App\Http\Controllers;

use App\PreventivoFactura;
use App\Preventivo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class PreventivoFacturaController extends Controller
{
    public function create(Request $request)
    {
        $factura = new PreventivoFactura;

        $factura->id_tarea = $request->id_tarea;
        $factura->numero = $request->numero;
        $factura->fecha = $request->fecha;
        $factura->id_proveedor = $request->id_proveedor;
        $factura->monto = $request->monto;
        
        $save = $factura->save();

        return parent::response($save,null);
    }

    public function read(Request $request)
    {
        $results = \App\PreventivoFactura
            ::where("id_tarea","=",$request->id_tarea)
            ->with("proveedor")
            ->orderBy("id","asc")->get();
        return parent::response(true,$results);
    } 
    
    public function update(Request $request)
    {
        $factura = \App\PreventivoFactura::find($request->id);

        $factura->numero = $request->numero;
        $factura->fecha = $request->fecha;
        $factura->id_proveedor = $request->id_proveedor;
        $factura->monto = $request->monto;
        $save = $factura->save();

        return parent::response($save,null);
    }
    
    public function delete(Request $request)
    {
        $destroy = \App\PreventivoFactura::destroy($request->id);
        return parent::response($destroy,null);
    }    
}
