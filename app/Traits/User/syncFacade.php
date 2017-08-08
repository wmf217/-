<?php

namespace App\Traits\User;
use Exception;
use Log;
trait syncFacade //门面，同步方法的混合搭配
{
    public function syncAllFacade () { //同步个人信息
        try {
            $this->syncInfo();
            $this->syncTrader();
        } catch (Exception $e) {
            Log::info('后台同步'.$this->name.'信息错误：'.$e->getMessage());
        }
    }

    public function syncInfoFacade () { //同步个人信息
        try {
            $this->syncInfo();
        } catch (Exception $e) {
            Log::info('MT4获取用户信息错误：'.$e->getMessage());
        }
    }

    public function syncTraderFacade () { // 同步历史订单
        try {
            $this->syncTrader();
        } catch (Exception $e) {
            Log::info('MT4获取用户历史订单错误：'.$e->getMessage());
        }
    }

    public function syncDepositFacade ($amount) {
        try {
            $rs = $this->syncDeposit($amount);
            if ($rs['code'] != 1) throw new Exception($rs['message']);
            if ($rs['data'][0]->ret != 0) throw new Exception('同步接口错误,请稍后重试 ret: '.$rs['data'][0]->ret);
            return array('status' => 1, 'data'=>'');
        } catch (Exception $e) {
            Log::info('MT4出入金错误：'.$e->getMessage());
            return array('status' => 0, 'data' => $e->getMessage());
        }
    }

    public function syncSigninFacade () {
        try {
            $rs = $this->syncSignin();
            if ($rs['code'] != 1) throw new Exception($rs['message']);
            if (!count($rs['data'])) throw new Exception('注册mt4失败无返回值');
            if ($rs['data'][0]->ret != 0) throw new Exception('注册mt4失败'.$rs['data'][0]->ret);
            return array('status' => 1, 'data'=>$rs['data'][0]->login);
        } catch (Exception $e) {
            Log::info('MT4新增用户错误：'.$e->getMessage());
            return array('status' => 0, 'data' => $e->getMessage());
        }
    }

    public function syncPasswordFacade ($password) {
        try {
            $this->syncPassword($password);
        } catch (Exception $e) {
            Log::info('MT4修改密码错误：'.$e->getMessage());
        }
    }
}
