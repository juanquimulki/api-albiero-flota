<?php

namespace App\Http\Controllers;

use App\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class LogController extends Controller
{
    public function create(Request $request)
    {
        $log = new Log;

        $log->user = $request->user;
        $log->operation = $request->operation;
        $log->date = date("Y-m-d H:i:s"); //$request->date;
        $save = $log->save();

        return parent::response($save,null);
    }
}
