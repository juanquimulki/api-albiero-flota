<?php

namespace App\Http\Controllers;

use App\Vehiculo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class VehiculoController extends Controller
{
    public function read(Request $request)
    {
        $results = \App\Vehiculo::all();
        return parent::response(true,$results);
    }
}
