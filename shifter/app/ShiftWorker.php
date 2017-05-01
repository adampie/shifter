<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ShiftWorker extends Model
{
    protected $primaryKey = 'id';
    protected $table = 'shiftworkers';

    protected $fillable = [
        'company_id', 'employees_id',
    ];
}
