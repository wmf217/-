<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Honor extends BaseModel
{
    protected $fillable = [
        'name', 'rebate'
    ];
}
