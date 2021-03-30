<?php

namespace App\Http\Controllers;

use App\Menu as MenuModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function read(Request $request)
    {
        $results = MenuModel::all();
        return response()->json($results,200);
    }
}
