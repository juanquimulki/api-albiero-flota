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

        $factura->id_preventivo = $request->id_preventivo;
        $factura->numero = $request->numero;
        $factura->id_proveedor = $request->id_proveedor;
        $factura->monto = $request->monto;
        
        $save = $factura->save();

        return parent::response($save,null);
    }
}
