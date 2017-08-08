<?php

namespace App;
use DB;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Nav extends BaseModel
{
    protected $fillable = [
        'name', 'pid', 'url', 'index', 'class', 'icon', 'pname', 'order', 'show'
    ];

    public function child ()
    {
        return $this->hasMany('App\Nav', 'pid');
    }

    public function parent ()
    {
        return $this->belongsTo('App\Nav', 'pid');
    }

    public function getpnameAttribute () {
        if ($this->pid != 0) {
            return $this->parent()->first()->name;
        } else {
            return '顶级';
        }
    }

    public function setpnameAttribute ($name) {
        $p = DB::table('navs')->whereName($name)->first();
        if ($p) {
            $this->pid = $p->id;
        }
    }

    public function scopetop ($query) {
        return $query->wherePid(0);
    }
}
