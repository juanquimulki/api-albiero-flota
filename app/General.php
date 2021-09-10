<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class General extends Model
{
    use SoftDeletes;

    protected $table  = 'general';

    public function vehiculo() {
        return $this->belongsTo(Vehiculo::class, 'id_vehiculo', 'id');
    }
}