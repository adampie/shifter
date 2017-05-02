<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $primaryKey = 'id';
    protected $table = 'employees';

    protected $fillable = [
        'company_id', 'firstname', 'lastname',
    ];

    protected $hidden = [
      'created_at', 'updated_at'
    ];
}
