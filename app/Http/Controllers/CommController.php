<?php
namespace App\Http\Controllers;
use App\Trader;
use App\User;
use App\Commission;
use App\Setting;
class CommController extends Controller { // 佣金计算
    public function count() {
        $traders = Trader::whereCount(0)->get();
        $setting = Setting::first();
        foreach ($traders as $trader) {
            $user = User::whereName($trader->login)->first();
            $this->countOne($user->id,$user, $trader->id, $setting->volume*$trader->volume*100); //todo
            $trader->count = 1;
            $trader->save();
        }
    }

    private function countOne ($from, $user, $tid, $amount) {
        $agent = $user->agent;
        if ($agent) {
            $honor = $agent->honor;
            $give = 0;
            if ($honor) {
                $rebate = $honor->rebate;
                $give = $amount*$rebate;
                $commission = new Commission();
                $commission->from = $from;
                $commission->to = $agent->id;
                $commission->order_id = $tid;
                $commission->amount = $give;
                $commission->month = date("Y-m");
                $commission->save();
            }
            $left = $amount - $give;
            $this->countOne($from, $agent, $tid, $left);
        } else {
            return;
        }
    }
}
