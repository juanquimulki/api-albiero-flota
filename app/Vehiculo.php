<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vehiculo extends Model
{
    use SoftDeletes;

    protected $table  = 'vehiculos';

    public function tipo() {
        return $this->belongsTo(VehiculoTipo::class, 'id_tipo', 'id');
    }

    public function chofer() {
        return $this->belongsTo(Chofer::class, 'id_chofer', 'id');
    }
}