<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Correctivo extends Model
{
    use SoftDeletes;

    protected $table  = 'correctivo';

    public function vehiculo() {
        return $this->belongsTo(Vehiculo::class, 'id_vehiculo', 'id');
    }

    public function parte() {
        return $this->belongsTo(Parte::class, 'id_parte', 'id');
    }

    public function tarea() {
        return $this->belongsTo(Tarea::class, 'id_tarea', 'id');
    }
}