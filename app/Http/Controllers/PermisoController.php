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
        $sql = "select id_hijo,padre,hijo, not isnull(user) as permiso 
                    from vw_menu_opciones
                    left outer join 
                        (select * from permisos where user = ?) as permisos 
                        on vw_menu_opciones.id_hijo = permisos.id_opcion";
        
        $results = DB::select($sql, [$request->user]);
        return parent::response(true,$results);
    }
}
