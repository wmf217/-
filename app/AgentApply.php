<?php

namespace App;
use Illuminate\Database\Eloquent\Model as BaseModel;

class AgentApply extends BaseModel
{
    protected $table = 'agent_applys';

    protected $fillable = [
        'user_id', 'status', 'reason'
    ];

    public function user () {
        return $this->belongsTo('App\User');
    }

    public function getuserNameAttribute() { // 人员账号
        return $this->user->name;
    }
}
