<?php

namespace App\Http\Controllers;

use App\Chofer;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class ChoferController extends Controller
{
    public function read(Request $request)
    {
        $results = \App\Chofer::all();
        return parent::response(true,$results);
    }
}
