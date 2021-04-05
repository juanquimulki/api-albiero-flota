<?php

namespace App\Http\Controllers;

use App\Menu;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    public function read(Request $request)
    {
        $results = app('App\Http\Controllers\PermisoController')->getPermisos($request->user);

        $menu = "";
        $primero = true;
        $result = array();
        foreach ($results as $item) {
            if ($item->permiso) {
                if ($item->menu != $menu) {
                    if (!$primero) {
                        $result[] = array("id"=>$id_menu, "label"=>$menu,"options"=>$options);
                    }
                    $id_menu = $item->id_menu;
                    $menu = $item->menu;
                    $options = array();
                    $primero = false;
                }
                $options[] = array("id"=>$item->id_opcion, "label"=>$item->opcion,"link"=>$item->link);
            }
        }

        $result[] = array("id"=>$id_menu, "label"=>$menu,"options"=>$options);

        return parent::response(true,$result);
    }
}
