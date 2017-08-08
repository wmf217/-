<?php

namespace App\Http\Controllers\Back\System;

use App\User;
use App\Nav;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;

class BankController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Bank';
        $this->_title = '银行';
        $this->_index = "bank";
        $this->_p_index = "system";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'bankno' => [
                'show' => '银行编号',
                'search' => "bankno like CONCAT('%', ?, '%')",
            ],
            'name' => [
                'show' => '名字',
                'search' => "name like CONCAT('%', ?, '%')",
            ],
            'cername' => [
                'show' => '简称',
                'search' => "cername like CONCAT('%', ?, '%')",
            ],
            'img' => [
                'show' => '图片',
                'type' => 'img'
            ],
            'created_at' => [
                'show' => '创建时间',
            ],
            'updated_at' => [
                'show' => '创建时间',
            ],
        ];
        $this->_fields_show = [
                                'name','bankno','cername','created_at'
                             ];
        $this->_fields_create = [
                             'name','bankno','cername','img'
                          ];
        $this->_fields_edit = [
                           'name','bankno','cername','img'
                        ];
        $this->_fields_detail = [
                           'id','name','bankno','cername','img','created_at','updated_at'
                        ];
        $this->_handle_btn['show']['require'] = true;
        parent::__construct();
    }

    public function beforestore(&$model){
        $this->removeImage($model, 'img', 'bank');
        return $this->jsData('');
    }

    public function beforeupdate(&$model){
        $this->removeImage($model, 'img', 'bank');
        return $this->jsData('');
    }
}
