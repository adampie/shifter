<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Shift extends Model
{
    protected $primaryKey = 'id';
    protected $table = 'shifts';

    protected $fillable = [
        'company_id', 'name', 'start', 'end',
    ];
}
