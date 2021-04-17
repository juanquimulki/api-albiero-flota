<?php

namespace App\Http\Controllers;

use App\Vehiculo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class ReporteController extends Controller
{
    public function garantiaFecha(Request $request)
    {
        $results = Vehiculo::where('fecha_venc_gtia','<=',date("Y-m-d"))
                            ->with("tipo")
                            ->with("chofer")
                            ->get();
        return parent::response(true,$results);
    }
}
