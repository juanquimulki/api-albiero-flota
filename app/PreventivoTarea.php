<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PreventivoTarea extends Model
{
    use SoftDeletes;

    protected $table  = 'preventivo_tareas';
}