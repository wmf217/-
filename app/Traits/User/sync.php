<?php

namespace App\Traits\User;
use App\Http\Controllers\MT4\MT4;
use App\Trader;
use DB;
use Illuminate\Support\Facades\Hash;
trait sync
{
    private function syncInfo () { //同步个人信息
        // DB::beginTransaction();
        // try {
            $mt4 = new MT4();
            $info = json_decode($mt4->userinfo($this->name));
            if ($info->code != 1) {
                $message = $info->message?$info->message:'无';
                return array('status' => 0, 'code' => $info->code, 'message' => $message);
            }
            if (!count($info->data)) {
                return array('status' => 0, 'code' => $info->code, 'message' => '数据为空');
            }
            $data = $info->data['0'];
            $this->group = $data->group;
            $this->country = $data->country;
            $this->address = $data->city;
            $this->tel = $data->phone;
            $this->email = $data->email;
            $this->leverage = $data->leverage;
            /*** 金额start ***/
            $this->syncBalance($data->balance);
            /*** 金额end ***/
            $this->credit = $data->credit;
            $this->save();
            return array('status' => 1);
        //     DB::commit();
        //     return array('status' => 1, 'data' => '');
        // } catch (\Exception $e){
        //     DB::rollback();
        //     return array('status' => 0, 'data' => $e->getMessage());
        // }
    }

    private function syncTrader() { // 同步历史订单
        $mt4 = new MT4();
        $trader = $this->trader()->orderBy('regdate', 'desc')->first();
        if ($trader) {
            $from = $trader->regdate;
        } else {
            $from = strtotime('-3 month'); // 首次从三月前开始获取
        }
        $to = strtotime('now');
        $traders = json_decode($mt4->history($this->name, $from, $to));
        if ($traders->code != 1) {
            $message = $traders->message?$info->message:'无';
            return array('status' => 0, 'code' => $traders->code, 'message' => $message);
        }
        // print_r($traders->data);
        // die;
        foreach ($traders->data as $key => $v) {
            $trader = new Trader();
            // $trader->fill($v);
            $trader->login = $v->login;
            $trader->order = $v->order;
            $trader->cmd = $v->cmd;
            $trader->openprice = $v->openprice;
            $trader->closeprice = $v->closeprice;
            $trader->opentime = $v->opentime;
            $trader->closetime = $v->closetime;
            $trader->profit = $v->profit;
            $trader->symbol = $v->symbol;
            $trader->comment = $v->comment;
            $trader->volume = $v->volume;
            $trader->created_at = date('Y-m-d H:i:s', $v->opentime); //按开始时间算
            $trader->regdate = $to;
            $trader->save();
        }
        return array('status' => 1);
    }

    private function syncDeposit ($amount) { // $amount 有正负之分
        $mt4 = new MT4();
        $info = json_decode($mt4->deposit($this->name, $amount, ''));
        $message = $info->message?$info->message:'无';
        return array('code' => $info->code, 'data' => $info->data, 'message' => $message);
    }

    private function syncSignin () {
        $mt4 = new MT4();
        $info = json_decode($mt4->signin($this->password,$this->readpwd, $this->email, $this->group));
        $message = $info->message?$info->message:'无';
        return array('code' => $info->code, 'data' => $info->data, 'message' => $message);
    }

    private function syncPassword ($password) {
        $mt4 = new MT4();
        $info = json_decode($mt4->changePwd($this->name, $password));
        $this->password = Hash::make($password);
        $this->save();
    }

    private function syncBalance ($balance) { // 同步金钱的方式,同步用户信息的子方法
        $this->vailable = $this->vailable + ($balance - $this->balance);
        $this->balance = $balance;
    }
}
