<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Account extends BaseModel
{
    protected $fillable = [
        'account_number', 'user_id', 'bank_id', 'account_city', 'account_branch', 'account_name',  'frontimg', 'backimg'
    ];

    public function bank () // 代理申请记录
    {
        return $this->belongsTo('App\Bank');
    }

    public function scopeActive ($query) { // 持仓订单
        return $query->whereStatus(1);
    }

    public function getbankNameAttribute() { // 历史单数
        return $this->bank->name;
    }
}
