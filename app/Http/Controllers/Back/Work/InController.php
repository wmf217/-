<?php

namespace App\Http\Controllers\Back\Work;

use App\User;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;

class InController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Record';
        $this->_title = '入金';
        $this->_theRaw = "type = 0 and status = 1";
        $this->_index = "in";
        $this->_p_index = "work";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'userName' => [
                'show' => '用户',
                'url' => '/back/user/pre-record/{id}'
            ],
            'amount' => [
                'show' => '金额',
                'search' => "amount like CONCAT('%', ?, '%')",
                'front' => 'red'
            ],
            'bebalance' => [
                'show' => '入金前',
                'front' => 'blue'
            ],
            'gobalance' => [
                'show' => '入金后',
                'front' => 'green'
            ],
            'bankName' => [
                'show' => '银行',
                'url' => '/back/account/pre-record/{id}'
            ],
            'bankno' => [
                'show' => '银行帐号',
                'url' => '/back/account/pre-record/{id}'
            ],
            'payno' => [
                'show' => '单号',
                'search' => "payno like CONCAT('%', ?, '%')",
            ],
            'wayZh' => [
                'show' => '入金类型',
            ],
            'created_at' => [
                'show' => '入金时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'payno','userName','bankName','bankno','wayZh','amount','bebalance','gobalance','created_at'
                             ];
        $this->_fields_detail = [
                             'userName','bankName','bankno','wayZh','amount','bebalance','gobalance','created_at'
                          ];
        $this->_handle_btn['destroy'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = true;
        $this->_handle_btn['show']['show'] = '查看详情';
        parent::__construct();
    }
}
