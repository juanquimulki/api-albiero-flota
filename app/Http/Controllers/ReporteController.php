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
        // $results = Vehiculo::where('fecha_venc_gtia','<=',date("Y-m-d"))
        //                     ->with("tipo")
        //                     ->with("chofer")
        //                     ->get();

        $results = Vehiculo::where('fecha_venc_gtia','<=',$request->fecha)
                            // ->with("tipo")
                            // ->with("chofer")
                            ->join('vehiculos_tipos', 'vehiculos.id_tipo', '=', 'vehiculos_tipos.id')
                            ->join('choferes', 'vehiculos.id_chofer', '=', 'choferes.id')
                            ->select(
                                'vehiculos.id',
                                'descripcion',
                                'alias',
                                'patente',
                                'anio',
                                'fecha_venc_gtia',
                                'vehiculos_tipos.tipo',
                                'choferes.apenom'
                                )                
                            ->selectRaw('datediff(?,fecha_venc_gtia) as vencimiento',[$request->fecha]) 
                            ->orderBy('vencimiento','desc')                                           
                            ->get();
        return parent::response(true,$results);
    }
}
