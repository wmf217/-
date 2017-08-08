<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Order extends BaseModel
{
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function object()
    {
        return $this->belongsTo('App\Object');
    }

    public function scopehistory ($query) { //历史订单
        return $query->whereNotNull('closetime'); // todo
    }

    public function scopehold ($query) { // 持仓订单
        return $query->whereNull('closetime'); //todo
    }

    public function scopehang ($query) { // 挂单
        return $query->whereFlag(1); //tocancel
    }

    public function scoperest ($query) { // 历史挂单
        return $query->where('restflag', '!=', 0);
    }
}
