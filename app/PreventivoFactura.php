<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PreventivoFactura extends Model
{
    use SoftDeletes;

    protected $table  = 'preventivo_facturas';
}