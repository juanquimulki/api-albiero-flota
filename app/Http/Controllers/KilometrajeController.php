<?php

namespace App\Http\Controllers;

use App\Kilometraje;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class KilometrajeController extends Controller
{
    public function read(Request $request)
    {
        $results = \App\Kilometraje::with("vehiculo")->get();
        return parent::response(true,$results);
    }
}
