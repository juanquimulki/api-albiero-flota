<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CorrectivoTarea extends Model
{
    use SoftDeletes;

    protected $table  = 'correctivo_tareas';
}