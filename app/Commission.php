<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Commission extends BaseModel
{
    protected $fillable = [
        'from', 'to', 'order_id', 'value'
    ];
    public function scopeisApply ($query) { // 挂单
        return $query->where('cinget_id', '!=', '0'); //tocancel
    }

    public function scopenotApply ($query) { // 挂单
        return $query->where('cinget_id', '=', '0'); //tocancel
    }

    public function fromUser() {
        return $this->belongsTo('App\User', 'from');
    }

    public function toUser() {
        return $this->belongsTo('App\User', 'to');
    }

    public function trader() {
        return $this->belongsTo('App\Trader');
    }

    public function getfromNameAttribute() { // 人员账号
        return $this->fromUser->name;
    }

    public function gettoNameAttribute() { // 人员账号
        return $this->toUser->name;
    }


}
