<?php

namespace App\Http\Controllers\Back\System;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;

class SettingController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Setting';
        $this->_title = '全局设置';
        $this->_index = "setting";
        $this->_p_index = "system";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'name' => [
                'show' => '网站名称',
            ],
            'logo' => [
                'show' => 'logo',
                'type' => 'img'
            ],
            'tel' => [
                'show' => '企业电话',
            ],
            'fax' => [
                'show' => '传真',
            ],
            'email' => [
                'show' => '企业邮箱',
            ],
            'url' => [
                'show' => '官方网址',
            ],
            'qq' => [
                'show' => '企业qq',
            ],
            'QRCode' => [
                'show' => '企业二维码',
                'type' => 'img'
            ],
            'Copyright' => [
                'show' => '页面底部',
                'type' => 'textarea'
            ],
            'userBanks' => [
                'show' => '银行卡限制',
            ],
            'volume' => [
                'show' => '单手订单返佣金额',
            ],
            'email_smtp' => [
                'show' => '邮件smtp',
            ],
            'email_port' => [
                'show' => '邮件端口',
            ],
            'email_login' => [
                'show' => '邮件登陆名',
            ],
            'email_password' => [
                'show' => '邮件密码',
            ],
        ];
        $this->_fields_show = [
                           'name','url','qq','tel','email','volume'
                       ];
        $this->_fields_edit = [
                           'name','logo','url','qq','tel','email','QRCode','userBanks','Copyright','volume'
                        ];
        $this->_handle_btn['show']['require'] = false;
        $this->_handle_btn['create']['require'] = false;
        $this->_handle_btn['destroy']['require'] = false;
        parent::__construct();
    }
}
