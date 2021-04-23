<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kilometraje extends Model
{
    protected $table  = 'kilometraje';

    public function vehiculo() {
        return $this->belongsTo(Vehiculo::class, 'id_vehiculo', 'id');
    }    
}