<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CorrectivoFactura extends Model
{
    use SoftDeletes;

    protected $table  = 'correctivo_facturas';

    public function proveedor() {
        return $this->belongsTo(Proveedor::class, 'id_proveedor', 'id');
    }
}