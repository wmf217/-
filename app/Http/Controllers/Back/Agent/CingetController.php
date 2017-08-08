<?php

namespace App\Http\Controllers\Back\Agent;

use App\User;
use App\Cinget;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class CingetController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Cinget';
        $this->_title = '佣金提取';
        $this->_theRaw = "status = 1";
        $this->_index = "cinget";
        $this->_p_index = "agent";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'userName' => [
                'show' => '用户',
                'url' => '/back/user/pre-cinget/{id}'
            ],
            'amount' => [
                'show' => '金额',
                'search' => "amount like CONCAT('%', ?, '%')",
                'front' => 'red'
            ],
            'status' => [
                'show' => '状态',
                'front' => 'green',
                'type' => 'select',
                'source' => config('constants.STATUS')
            ],
            'detail' => [
                'show' => '备注',
            ],
            'created_at' => [
                'show' => '申请时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
            'updated_at' => [
                'show' => '处理时间',
                'search' => "updated_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'userName','amount','status','detail','created_at','updated_at'
                             ];
        $this->_fields_detail = [
                                 'id','userName','amount','status','detail','created_at','updated_at'
                              ];
        $this->_list_buttons = [
                                  '0' => ['require' => true, 'type' => 'iframe', 'name'=>'佣金来源', 'action' => '/back/cinget/resource/{id}']
                                ];
        $this->_handle_btn['destroy'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = true;
        $this->_handle_btn['show']['show'] = '查看详情';
        parent::__construct();
    }
    public function resource($cid) {
        $cinget = Cinget::findorfail($cid);
        $commissions = $cinget->commission;
        return view('back.agent.cinget.resource', compact('cinget', 'commissions'));
    }
}
