<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\User\dayReport;
use App\Traits\User\sync;
use App\Traits\User\syncFacade;
use App\Traits\User\Deposit;
use DB;

class User extends Authenticatable
{
    use Notifiable, SoftDeletes, dayReport, sync, syncFacade, Deposit;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
         'name', 'tel', 'email', 'idnum', 'agent_id',
         'id_type', 'firstname', 'lastname', 'englishname', 'country', 'idcountry', 'fete', 'address', 'idfront', 'idback',
         'active', 'is_agent', 'honor_id', 'userBanks','group'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function order () // 订单
    {
        return $this->hasMany('App\Order');
    }

    public function agent () {
        return $this->hasOne('App\User', 'id', 'agent_id');
    }

    public function honor () {
        return $this->belongsTo('App\Honor');
    }


    public function trader () // 订单
    {
        return $this->hasMany('App\Trader', 'login', 'name');
    }

    public function record ()  // 出入金记录
    {
        return $this->hasMany('App\Record');
    }

    public function translistOut () { // 专户转出记录
        return $this->hasMany('App\Translist', 'from');
    }

    public function translistIn () { // 专户转入记录
        return $this->hasMany('App\Translist', 'to');
    }

    public function agent_apply () // 代理申请记录
    {
        return $this->hasMany('App\AgentApply');
    }

    public function account () // 代理申请记录
    {
        return $this->hasMany('App\Account');
    }

    public function fromCommission () { // 我发出的佣金
        return $this->hasMany('App\Commission', 'form');
    }

    public function toCommission () { // 我收到的佣金
        return $this->hasMany('App\Commission', 'to');
    }

    public function cinget () { // 佣金提取记录
        return $this->hasMany('App\Cinget');
    }

    public function orderTotal () {  // 订单总手数
        $rs = DB::select("SELECT SUM(orders.hand) as total from orders where user_id = ".$this->id);
        if(!count($rs)) return 0;
        return $rs[0]->total;
    }

    public function orderNum () { // 订单数量
        $rs = DB::select("SELECT count(*) as count from orders where user_id = ".$this->id);
        if(!count($rs)) return 0;
        return $rs[0]->count;
    }

    public function offlineNum () {  // 下线数量
        $rs = DB::select("SELECT count(*) as count from users where agent_id = ".$this->id);
        if(!count($rs)) return 0;
        return $rs[0]->count;
    }

    public function offlinePre () { // 下线统计
        $builder = DB::table('users')->leftJoin('traders', 'traders.login', '=', 'users.name');
        $builder->select('users.name', 'users.id', 'users.balance', 'users.netvalue', 'users.is_agent', DB::raw('count(traders.id) as ordercount'), DB::raw('SUM(traders.volume) as orderhand'), DB::raw('SUM(traders.volume) as ordernum'));
        $builder->where('users.agent_id', $this->id);
        $builder->groupBy('users.id');
        // $rs = DB::select('select *, count(orders.id) as ordercount, SUM(orders.hand) as ordercount from `users` left join `orders` on `orders`.`user_id` = `users`.`id` where `users`.`agent_id` = ? group by `users`.`id`',[$this->id]);
        return $builder->get();
    }

    public function getagentNameAttribute() { // 代理名字
        if ($this->agent_id) {
            $builder = DB::table('users')->whereId($this->agent_id);
            $agent = $builder->first();
            if ($agent) {
                return $agent->name;
            }
        }
        return '';
    }

    public function getinGoldAttribute() { // 入金
        return $this->record()->in()->sum('amount');
    }

    public function getoutGoldAttribute() { // 出金
        return $this->record()->out()->sum('amount');
    }

    public function gethistoryHandAttribute() { // 历史手数
        return $this->trader()->history()->sum('volume');
    }

    public function gethistoryProfitAttribute() { // 历史盈利
        return $this->trader()->history()->sum('profit');
    }

    public function gethistoryCountAttribute() { // 历史单数
        return $this->trader()->history()->count('*');
    }

    public function getfullnameAttribute() { // 全名
        return $this->firstname;
    }

    // public function getisAgentAttribute() { // 历史单数
    //     return $this->is_agent;
    // }
    public function scopeactive ($query) { // 生效用户
        return $query->whereActive(1);
    }

    public function scopeuncheck ($query) { // 待审核用户
        return $query->whereActive(0);
    }

    public function applyInfo () { // 申请代理资质
        $info = [];
        $info['total'] = $this->orderTotal();
        $info['offline'] = $this->offlineNum();
        $info['offlineNet'] = 0.00;
        $info['offlineTotal'] = 0.00;
        return $info;
    }
}
