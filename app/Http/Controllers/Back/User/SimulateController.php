<?php

namespace App\Http\Controllers\Back\User;

use App\User;
use App\Record;
use App\Translist;
use App\Cinget;
use App\AgentApply;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;

class SimulateController extends MixController
{
    public function __construct()
    {
        $this->_model = 'User';
        $this->_title = '模拟账户';
        $this->_theRaw = "active = 1 and simulate = 1";
        $this->_index = "user";
        $this->_p_index = "simulate";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'name' => [
                'show' => '账号',
                'search' => "name like CONCAT('%', ?, '%')",
            ],
            'group' => [
                'show' => '组',
                'search' => "group like CONCAT('%', ?, '%')",
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
            'firstname' => [
                'show' => '姓氏'
            ],
            'lastname' => [
                'show' => '名称'
            ],
        ];
        $this->_fields_show = [
                                'name','group',
                                'historyCount','historyHand',
                                'historyProfit','balance'
                             ];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_list_buttons = [
            // '0' => ['require' => true, 'type' => 'form', 'name'=>'禁用', 'action' => 'active=0'],
            '1' => ['require' => true, 'type' => 'url', 'name'=>'用户系统', 'action' => '/back/user/reversal/{id}'],
        ];
        parent::__construct();
    }

}
