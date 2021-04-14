<?php

namespace App\Http\Controllers;

use App\VehiculoTipo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class VehiculoTipoController extends Controller
{
    public function read(Request $request)
    {
        $results = \App\VehiculoTipo::all();
        return parent::response(true,$results);
    }
}
