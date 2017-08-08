<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;
class Object extends BaseModel
{
    public function order()
    {
        return $this->hasMany('App\Order');
    }
}
