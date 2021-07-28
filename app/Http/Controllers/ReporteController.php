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

    public function garantiaKms(Request $request)
    {
        $results = Vehiculo::whereRaw('(kilometros+?)-kms_venc_gtia >= 0',[$request->kilometros])
                            ->join('vehiculos_tipos', 'vehiculos.id_tipo', '=', 'vehiculos_tipos.id')
                            ->join('choferes', 'vehiculos.id_chofer', '=', 'choferes.id')
                            ->leftJoin('vw_vehiculos_km', 'vehiculos.id', '=', 'vw_vehiculos_km.id_vehiculo')
                            ->select(
                                'vehiculos.id',
                                'descripcion',
                                'alias',
                                'patente',
                                'anio',
                                'kms_venc_gtia',
                                'vehiculos_tipos.tipo',
                                'choferes.apenom',
                                'kilometros',
                                'fecha_hora'
                                )                
                            ->selectRaw('kilometros+? as kmsCalculados',[$request->kilometros])
                            ->selectRaw('(kilometros+?)-kms_venc_gtia as vencimiento',[$request->kilometros])
                            ->orderBy('vencimiento','desc')                                           
                            ->get();
        return parent::response(true,$results);
    }

    public function historial(Request $request)
    {
        if ($request->id_vehiculo > 0) {
            if ($request->cumplimentado == 1) {
                $results = DB::table('vw_historial')
                ->whereRaw('id_vehiculo = ? and fecha BETWEEN ? and ? and cumplimentado = 1',[$request->id_vehiculo,$request->desde,$request->hasta])
                ->get();        
            }
            else {
                $results = DB::table('vw_historial')
                ->whereRaw('id_vehiculo = ?  and fecha BETWEEN ? and ?',[$request->id_vehiculo,$request->desde,$request->hasta])
                ->get();        
            }
        }
        else {
            if ($request->cumplimentado == 1) {
                $results = DB::table('vw_historial')
                ->whereRaw('fecha BETWEEN ? and ? and cumplimentado = 1',[$request->desde,$request->hasta])        
                ->get();        
            }
            else {
                $results = DB::table('vw_historial')
                ->whereRaw('fecha BETWEEN ? and ?',[$request->desde,$request->hasta])        
                ->get();        
            }
        }
        return parent::response(true,$results);
    }

    public function gastos(Request $request)
    {
        if ($request->id_vehiculo > 0) {
            $results = DB::table('vw_tareas_gastos')
            ->whereRaw('id_vehiculo = ?  and fecha BETWEEN ? and ?',[$request->id_vehiculo,$request->desde,$request->hasta])
            ->get();        
        }
        else {
            $results = DB::table('vw_tareas_gastos')
            ->whereRaw('fecha BETWEEN ? and ?',[$request->desde,$request->hasta])        
            ->get();        
        }
        return parent::response(true,$results);
    }
}
