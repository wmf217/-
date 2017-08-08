<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Bank extends BaseModel
{
    protected $fillable = [
        'bankno', 'name', 'cername', 'img'
    ];
}
