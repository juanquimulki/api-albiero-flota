<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vehiculo extends Model
{
    use SoftDeletes;

    protected $table  = 'vehiculos';
    protected $appends = ['dias_venc_gtia','descripcion_alias'];

    public function getDiasVencGtiaAttribute()
    {
        $hoy = date("Y-m-d");

        $origin = date_create($hoy);
        $target = date_create($this->fecha_venc_gtia);
        $interval = date_diff($origin, $target);

        return $interval->days;
    }    

    public function getDescripcionAliasAttribute()
    {
        return $this->descripcion . " (".$this->alias.")";
    }    

    public function tipo() {
        return $this->belongsTo(VehiculoTipo::class, 'id_tipo', 'id');
    }

    public function chofer() {
        return $this->belongsTo(Chofer::class, 'id_chofer', 'id');
    }
}