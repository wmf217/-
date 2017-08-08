<?php

namespace App\Http\Controllers\Back\Agent;

use App\User;
use App\Cinget;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class HonorController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Honor';
        $this->_title = '代理资质';
        $this->_index = "honor";
        $this->_p_index = "agent";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'name' => [
                'show' => '资质名称',
                'search' => "name like CONCAT('%', ?, '%')",
            ],
            'rebate' => [
                'show' => '返佣比例',
                'type' => 'progress'
            ],
            'created_at' => [
                'show' => '创建时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
            'updated_at' => [
                'show' => '修改时间',
                'search' => "updated_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'name','rebate'
                             ];
        $this->_fields_edit = [
                                 'name','rebate'
                              ];
        $this->_fields_create = [
                               'name','rebate'
                            ];
        $this->_handle_btn['show']['require'] = false;
        parent::__construct();
    }
}
