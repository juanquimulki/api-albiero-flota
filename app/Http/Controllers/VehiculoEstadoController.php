<?php

namespace App\Http\Controllers;

use App\VehiculoEstado;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class VehiculoEstadoController extends Controller
{
    public function read(Request $request)
    {
        $results = \App\VehiculoEstado::all();
        return parent::response(true,$results);
    }
}
