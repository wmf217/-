<?php

namespace App\Http\Controllers\Back\System;

use App\User;
use App\Nav;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;

class NavController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Nav';
        $this->_title = '导航';
        $this->_index = "nav";
        $this->_p_index = "system";
        $this->_order = ['order', 'asc'];
        $ps = Nav::select('name', 'id')->top()->get()->pluck('name', 'id')->toArray();
        $ps[0] = '顶级';
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'order' => [
                'show' => '排序',
            ],
            'show' => [
                'show' => '是否可见',
                'type' => 'radio',
                'source' => array(0 => '不可见', 1 => '可见')
            ],
            'name' => [
                'show' => '名称',
                'search' => "name like CONCAT('%', ?, '%')",
            ],
            'pid' => [
                'show' => '父级',
                'type' => 'select',
                'source' => $ps
            ],
            'index' => [
                'show' => '索引',
            ],
            'class' => [
                'show' => '颜色类',
            ],
            'icon' => [
                'show' => '图标类',
            ],
            'url' => [
                'show' => '链接'
            ],
            'order' => [
                'show' => '排序'
            ],
            'created_at' => [
                'show' => '创建时间',
            ],
        ];
        $this->_fields_show = [
                                'name','pid','index','class','icon','order','show'
                             ];
        $this->_fields_create = [
                             'name','pid','index','icon','class','url','order','show'
                          ];
        $this->_fields_edit = [
                           'name','pid','index','icon','class','url','order','show'
                        ];
        parent::__construct();
    }
}
