<?php

namespace App\Http\Controllers\Back\Check;

use App\User;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Mail\CheckShipped;
use App\Mail\LoginShipped;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;

class UcheckController extends MixController
{
    public function __construct()
    {
        $this->_model = 'User';
        $this->_title = '账户审核';
        $this->_theRaw = "active = 0";
        $this->_index = "ucheck";
        $this->_p_index = "check";
        $this->_single_btn = true;
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'name' => [
                'show' => '账号',
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
            'agentName' => [
                'show' => '代理',
            ],
            'pssword' => [
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
                                'name','fullname','mt4_group','agentName','englishname','tel',
                                'address','fete'
                             ];
        $this->_fields_detail = [
                                'name','fullname','mt4_group','agentName','englishname','tel',
                                'address','fete','idfront','idback'
                              ];
        $this->_handle_btn['destroy'] = ['require'=>false]; // 取消删除
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_list_buttons = [
            '0' => ['require' => true, 'type' => 'iframe', 'name'=>'用户审核', 'action' => '/back/ucheck/check/{id}']
        ];
        $this->_handle_btn['show']['require'] = false;
        parent::__construct();
    }

    public function check($id) {
        $user = User::findorfail($id);
        $account = $user->account()->first();
        return view('back.check.ucheck.check', compact('user', 'account'));
    }

    public function doCheck(Request $request, $id) {
        $user = User::findorfail($id);
        $user->active = (int) $request->active;
        if ($user->active == 1) {
            $bpwd = $user->password;
            $user->readpwd = $this->randomkeys(6);
            $rs = $user->syncSigninFacade();
            if (!$rs['status']) {
                return $this->jsError($rs['data']);
            }
            $user->name = $rs['data'];
            $user->password = Hash::make($user->password);
            $user->save();
            $shipped = new LoginShipped($rs['data'], $bpwd, $user->readpwd, $user->fullname);
            Mail::to($user->email)->send($shipped);
            return $this->jsData('审核成功');
        } else {
            $shipped = new CheckShipped($request->reason);
            Mail::to($user->email)->send($shipped);
            $user->delete();
            return $this->jsData('驳回成功');
        }
    }

    private function randomkeys($length)
    {
        $pattern = '1234567890abcdefghijklmnopqrstuvwxyz
                   ABCDEFGHIJKLOMNOPQRSTUVWXYZ';
        $num = '1234567890';
        $str = 'abcdefghij';
        $key = '';
        $key .= $num{mt_rand(0,9)}; //第一位数字
        for($i=0;$i<$length;$i++)
        {
            $key .= $pattern{mt_rand(0,35)};    //生成php随机数
        }
        $key .= $str{mt_rand(0,9)}; //末尾字符
        return $key;
    }

}
