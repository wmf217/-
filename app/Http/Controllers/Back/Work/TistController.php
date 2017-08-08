<?php

namespace App\Http\Controllers\Back\Work;

use App\User;
use App\Translist;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class TistController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Translist';
        $this->_title = '转户列表';
        $this->_theRaw = "status != 0";
        $this->_index = "tist";
        $this->_p_index = "work";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'fromUsername' => [
                'show' => '转出用户',
                'url' => '/back/user/pre-tfrom/{id}'
            ],
            'toUsername' => [
                'show' => '转入用户',
                'url' => '/back/user/pre-tto/{id}'
            ],
            'amount' => [
                'show' => '金额',
                'search' => "amount like CONCAT('%', ?, '%')",
            ],
            'status' => [
                'show' => '状态',
                'type' => 'select',
                'source' => config('constants.STATUS')
            ],
            'reason' => [
                'show' => '备注',
            ],
            'created_at' => [
                'show' => '申请时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'id', 'fromUsername','toUsername', 'amount','status', 'reason', 'created_at',
                             ];
        $this->_fields_edit = [
                             'amount','status', 'reason'
                          ];
        // $this->_handle_btn['destroy'] = ['require'=>true];
        // $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = false;
        // $this->_handle_btn['show']['show'] = '查看详情';
        parent::__construct();
    }

}
