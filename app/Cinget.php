<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Cinget extends BaseModel
{
    public function commission () {
        return $this->hasMany('App\Commission');
    }

    public function user () {
        return $this->belongsTo('App\User');
    }

    public function getuserNameAttribute() { // 人员账号
        return $this->user->name;
    }
}
