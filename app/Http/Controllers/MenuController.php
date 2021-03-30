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
        $results = DB::table('vw_menu_opciones')->get();
        
        $padre = "";
        $primero = true;
        $menu = array();
        foreach ($results as $item) {
            if ($item->padre != $padre) {
                if (!$primero) {
                    $menu[] = array("id"=>$id_padre, "label"=>$padre,"options"=>$options);
                }
                $id_padre = $item->id_padre;
                $padre = $item->padre;
                $options = array();
                $primero = false;
            }
            $options[] = array("id"=>$item->id_hijo, "label"=>$item->hijo,"link"=>$item->link);
        }

        $menu[] = array("id"=>$id_padre, "label"=>$padre,"options"=>$options);

        return response()->json($menu,200);
    }
}
