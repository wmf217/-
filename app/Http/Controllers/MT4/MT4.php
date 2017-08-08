<?php

namespace App\Http\Controllers\MT4;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Curl\Curl;

class MT4 extends Controller
{
    protected $curl;
    protected $token = "yang320623";
    public function __construct() {
        $this->curl = new Curl ();
    }
    public function online () {  // 获取持仓订单
        if (!env('MT4_OPEN')) {
            return array('status' => 0);
        }
        $datas = [];
        $post_data =array(
              "item" => config('mt4.online.item'),
              "token" => $this->token,
              "data" => $datas
        );
     //    $post_data = json_encode($post_data);
        $rs = $this->curl->curlRequest(env('MT4_URL').config('mt4.online.url'),$post_data);
        return $rs;
    }

    public function userinfo($login){ // 用户信息
        if (!env('MT4_OPEN')) {
            return array('status' => 0);
        }
         $datas = [];
         $datas[] = array('login' => $login);
         $post_data =array(
               "item" => config('mt4.userinfo.item'),
               "token" => $this->token,
               "data" => $datas
         );
         $rs = $this->curl->curlRequest(env('MT4_URL').config('mt4.userinfo.url'),$post_data);
         return $rs;
    }

    public function deposit ($login, $amount, $comment) { // 出入金
        if (!env('MT4_OPEN')) {
            return array('status' => 0);
        }
        $datas = [];
        $datas[] = array('login' => $login, 'amount' => $amount, 'comment' => $comment);
        $post_data =array(
              "item" => config('mt4.deposit.item'),
              "token" => $this->token,
              "data" => $datas
        );
        $rs = $this->curl->curlRequest(env('MT4_URL').config('mt4.deposit.url'),$post_data);
        return $rs;
    }

    public function history ($login, $begin, $to) { // 历史订单
        if (!env('MT4_OPEN')) {
            return array('status' => 0);
        }
         $datas[] = array('login' => $login, 'begin' => $begin, 'to' => $to);
         $post_data =array(
               "item" => config('mt4.history.item'),
               "token" => $this->token,
               "data" => $datas
         );
         $rs = $this->curl->curlRequest(env('MT4_URL').config('mt4.history.url'),$post_data);
         return $rs;
    }

    public function signin ($password, $readpwd, $email, $group) { // 历史订单
        if (!env('MT4_OPEN')) {
            return array('status' => 0);
        }
         $login = (int) date("His",time()).rand(1000,9999);
         $datas[] = array(
             'login' => $login,
             'name' => $login,
             'email' => $email,
             'group' => $group,
             'password' => $password,
             'passwordinvestor' => $readpwd,
             'leverage' => 0
         );
         $post_data =array(
               "item" => config('mt4.signin.item'),
               "token" => $this->token,
               "data" => $datas
         );
         $rs = $this->curl->curlRequest(env('MT4_URL').config('mt4.signin.url'),$post_data);
         return $rs;
    }

    public function changePwd ($login, $password) {
        if (!env('MT4_OPEN')) {
            return array('status' => 0);
        }
        $datas = [];
        $datas[] = array('login' => (int) $login, 'pwd' => $password);
        $post_data =array(
              "item" => config('mt4.password.item'),
              "token" => $this->token,
              "data" => $datas
        );
        $rs = $this->curl->curlRequest(env('MT4_URL').config('mt4.password.url'),$post_data);
        return $rs;
    }
}
