<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Trader extends BaseModel
{
    protected $fillable = [
        'login', 'order', 'cmd', 'openprice', 'closeprice',
         'opentime', 'closetime', 'profit', 'symbol', 'comment', 'volume'
    ];

    protected $appends = ['flag'];

    public function user()
    {
        return $this->belongsTo('App\User', 'name', 'login');
    }

    public function scopehistory ($query) { //历史订单
        return $query->where('closetime', '!=', 0);
    }

    public function scopehold ($query) { // 持仓订单
        return $query->where('closetime', '=', 0);
    }

    public function scopehang ($query) { // 挂单
        return $query->whereIn('cmd', [2,3,4,5]);
    }

    public function scopesell ($query) { // 卖
        return $query->where('cmd', 1);
    }

    public function scopebuy ($query) { // 买
        return $query->where('cmd', 0);
    }

    public function getflagAttribute() { // 订单类型
        switch ($this->cmd) {
            case '0':
            return '买入';
            break;
            case '1':
            return '卖出';
            break;
            case '2':
            return '买入限价';
            break;
            case '3':
            return '卖出限价';
            break;
            case '4':
            return '买入止损';
            break;
            case '5':
            return '卖出止损';
            break;
            default:
            return '非订单类型';
            break;
        }
    }
}
