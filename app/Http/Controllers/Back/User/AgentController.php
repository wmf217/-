<?php

namespace App\Http\Controllers\Back\User;

use App\User;
use App\Record;
use App\Honor;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;

class AgentController extends MixController
{
    public function __construct()
    {
        $this->_model = 'User';
        $this->_title = '真实账户';
        $this->_theRaw = "active = 1 and is_agent = 1";
        $this->_index = "agent";
        $this->_p_index = "user";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'name' => [
                'show' => '账号',
                'url' => '/back/user/pre/{id}',
                'search' => "name like CONCAT('%', ?, '%')",
            ],
            'fullname' => [
                'show' => '全名',
                'search' => "lastname like CONCAT('%', ?, '%')",
            ],
            'mt4_group' => [
                'show' => '组',
                'search' => "mt4_group like CONCAT('%', ?, '%')",
            ],
            'inGold' => [
                'before' => '$',
                'show' => '入金',
            ],
            'outGold' => [
                'before' => '$',
                'show' => '出金',
            ],
            'historyCount' => [
                'show' => '历史交易',
                'after' => '笔'
            ],
            'historyHand' => [
                'show' => '成交量',
                'after' => '手'
            ],
            'historyProfit' => [
                'before' => '$',
                'show' => '盈利',
            ],
            'balance' => [
                'show' => '余额',
                'front' => 'red'
            ],
            'vailable' => [
                'show' => '可用值',
                'front' => 'green'
            ],
            'agentName' => [
                'show' => '代理',
                'url' => '/back/user/pre-agent/{id}',
            ],
            'honor_id' => [
                'show' => '资质',
                'type' => 'select',
                'source' => Honor::select('name', 'id')->get()->pluck('name', 'id')->toArray()
            ],
            'password' => [
                'show' => '密码',
            ],
            'agent_id' => [
                'show' => '代理编号'
            ],
            'active' => [
                'show' => '是否激活',
                'type' => 'radio',
                'source' => array(0 => '禁用', 1 => '激活')
            ],
            'tel' => [
                'show' => '手机',
            ],
            'firstname' => [
                'show' => '姓氏'
            ],
            'lastname' => [
                'show' => '名称'
            ],
            'englishname' => [
                'show' => '英文名'
            ],
            'fete' => [
                'show' => '性别'
            ],
            'address' => [
                'show' => '地址'
            ],
            'idfront' => [
                'show' => '身份证正面',
                'type' => 'img'
            ],
            'idback' => [
                'show' => '身份证反面',
                'type' => 'img'
            ]
        ];
        $this->_fields_show = [
                                'name','fullname','mt4_group','agentName','honor_id','inGold','outGold',
                                'historyCount','historyHand',
                                'historyProfit','balance','vailable'
                             ];
        $this->_fields_create = [
                                'firstname','lastname','englishname','password','tel',
                                'address','honor_id','agent_id','active','idfront','idback'
                                ];
        $this->_fields_edit = [
                                'firstname','lastname','englishname','password','tel',
                                'address','honor_id','agent_id','idfront','idback'
                              ];
        $this->_fields_detail = [
                              'firstname','lastname','englishname','password','tel',
                              'address','honor_id','agent_id','idfront','idback'
                            ];
        $this->_handle_btn['destroy'] = ['require'=>false]; // 取消删除
        $this->_handle_btn['create']['show'] = '开户';
        $this->_list_buttons = [
            '0' => ['require' => true, 'type' => 'form', 'name'=>'禁用', 'action' => 'active=0'],
            '1' => ['require' => true, 'type' => 'url', 'name'=>'用户系统', 'action' => '/back/user/reversal/{id}'],
            // '3' => ['require' => true, 'type' => 'form', 'name'=>'设为代理', 'action' => 'is_agent=1'],
        ];
        $this->_handle_btn['show']['require'] = true;
        $this->_handle_btn['show']['show'] = '基本信息';
        $this->_magnifying = ['type'=>'iframe','show'=>'账户详情','require'=>true,'url'=>'/back/user/pre/{id}'];
        parent::__construct();
    }

    public function beforestore(&$model){
        if (Input::get('password')) {
            $model->password = Hash::make(Input::get('password'));
        }
        $this->removeImage($model, 'idfront', 'id');
        $this->removeImage($model, 'idback', 'id');
        return $this->jsData('');
    }

    public function beforeupdate(&$model){
        if (Input::get('password') != $model->password) {
            $model->password = Hash::make(Input::get('password'));
        }
        $this->removeImage($model, 'idfront', 'id');
        $this->removeImage($model, 'idback', 'id');
        return $this->jsData('');
    }
    // public function show($matrix_id, $id){
    //     echo $id;
    // }
    public function reversal ($id) { // 用户系统
        $user = User::findorfail($id);
        Auth::login($user);
        return redirect()->route('home');
    }

    public function pre ($id) { // 用户系统
        $user = User::findorfail($id);
        return view('back.user.pre', compact('user'));
    }

    public function preRecord ($id) { // recordID用户系统
        $Record = Record::findorfail($id);
        $user = $Record->user;
        return view('back.user.pre', compact('user'));
    }

    public function preAgent ($id) { // agentID用户系统
        $now = User::find($id);
        $user = User::find($now->agent_id);
        return view('back.user.pre', compact('user'));
    }

}
