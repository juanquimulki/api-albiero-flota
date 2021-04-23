<?php

namespace App\Http\Controllers;

use App\CombustibleTipo;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class CombustibleTipoController extends Controller
{
    public function read(Request $request)
    {
        $results = \App\CombustibleTipo::all();
        return parent::response(true,$results);
    }
}
