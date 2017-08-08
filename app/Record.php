<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;
use Illuminate\Database\Eloquent\SoftDeletes;

class Record extends BaseModel
{
    use SoftDeletes;
    protected $fillable = [
        'account_id', 'bankno', 'amount'
    ];

    public function account()
    {
        return $this->belongsTo('App\Account');
    }

    public function bank()
    {
        return $this->belongsTo('App\Bank', 'bank_id', 'bankno');
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function scopein ($query) { // 入金
        return $query->whereType(0);
    }

    public function scopeout ($query) { // 出金
        return $query->whereType(1);
    }

    public function scopeouter ($query) { // 出金
        return $query->whereType(1);
    }

    public function scopecharge ($query) { // 充值提款
        return $query->whereWay(config('constants.RECORDWAYID')['CHARGE']);
    }

    public function scopecommission ($query) { // 佣金转户
        return $query->whereWay(config('constants.RECORDWAYID')['COMMISSION']);
    }

    public function scopetransfer ($query) { // 账户转账
        return $query->whereWay(config('constants.RECORDWAYID')['TRANSFER']);
    }

    public function getuserNameAttribute() { // 人员账号
        if ($this->user) {
            return $this->user->name;
        } else {
            return '';
        }
    }

    public function getbankNameAttribute() { // 银行名字
        if ($this->account) {
            return $this->account->bank->name;
        }
    }

    public function getbankImgAttribute() { // 银行名字
        if ($this->bank) {
            return $this->bank->img;
        }
    }

    public function getbanknoAttribute() { // 银行卡号
        if ($this->account) {
            return $this->account->account_number;
        }
    }

    public function getwayZhAttribute() { // 金额方式
        return config('constants.RECORDWAY')[$this->way];
    }
}
