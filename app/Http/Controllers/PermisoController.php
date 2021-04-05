<?php

namespace App\Http\Controllers;

use App\Permiso;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Response;
use Illuminate\Http\Request;

class PermisoController extends Controller
{
    public function read(Request $request)
    {
        $results = $this->getPermisos($request->user);
        return parent::response(true,$results);
    }

    public function getPermisos($user) {
        $sql = "select id_menu,vw_menu_opciones.id_opcion,menu,opcion,link, not isnull(user) as permiso 
                    from vw_menu_opciones
                    left outer join 
                        (select * from permisos where user = ?) as permisos 
                        on vw_menu_opciones.id_opcion = permisos.id_opcion";

        return DB::select($sql, [$user]);
    }
}
