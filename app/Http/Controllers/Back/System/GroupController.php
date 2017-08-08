<?php

namespace App\Http\Controllers\Back\System;

use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;

class GroupController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Group';
        $this->_title = 'MT4组';
        $this->_index = "group";
        $this->_p_index = "system";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'name' => [
                'show' => '组名',
                'search' => "name like CONCAT('%', ?, '%')",
            ],
            'note' => [
                'show' => '描述',
                'search' => "note like CONCAT('%', ?, '%')",
            ],
            'simulate' => [
                'show' => '是否模拟',
                'type' => 'radio',
                'source' => array(0 => '真实', 1 => '模拟')
            ],
            'created_at' => [
                'show' => '创建时间',
            ],
            'updated_at' => [
                'show' => '创建时间',
            ],
        ];
        $this->_fields_show = [
                                'id','name','note','simulate','created_at','updated_at'
                             ];
        $this->_fields_create = [
                             'name','note','simulate'
                          ];
        $this->_fields_edit = [
                           'name','note','simulate'
                        ];
        parent::__construct();
    }
}
