<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PreventivoRepuesto extends Model
{
    use SoftDeletes;

    protected $table  = 'preventivo_repuestos';

    public function repuesto() {
        return $this->belongsTo(Repuesto::class, 'id_repuesto', 'id');
    }
}