<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Group extends BaseModel
{
    protected $fillable = [
        'name', 'note', 'simulate'
    ];
}
