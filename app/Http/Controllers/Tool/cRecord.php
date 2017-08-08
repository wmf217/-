<?php

namespace App\Http\Controllers\Tool;

use App\User;
use App\Record;
use App\Account;
use App\Http\Controllers\Controller as BaseController;
use Illuminate\Http\Request;
use Carbon\Carbon;
use DB;

class cRecord extends BaseController
{
    static function gpRecord ($uid, $amount, $type, $way) { // 转户/佣金审核后的记录
        $record = new Record;
        $user = User::find($uid);
        $record->type = $type;
        $record->user_id = $uid;
        $record->amount = $amount;
        $record->gobalance = $user->balance;
        $record->way = $way;
        $record->status = config('constants.RECORDSTATUSID')['SUCCESS'];
        $record->payno = date("YmdHis",time()).rand(1000,9999);
        if ($type) {  // 出金
            $record->bebalance = (float) $user->balance + (float) $amount;
        } else {  // 入金
            $record->bebalance = (float) $user->balance - (float) $amount;
        }
        $record->day = Carbon::now()->format('Y-m-d');
        $record->month = Carbon::now()->format('Y-m');
        $record->save();
    }

    static function Record ($uid, $amount, $type, $aid, $payno, $bankno = '') { //出入金的申请
        $record = new Record;
        $user = User::find($uid);
        $record->type = $type;
        $record->user_id = $uid;
        $record->amount = $amount;
        $record->bebalance = $user->balance;
        $record->way =  config('constants.RECORDWAYID')['CHARGE'];
        $record->status = config('constants.RECORDSTATUSID')['WAIT'];
        $record->account_id = $aid;
        if ($bankno) {
            $record->bank_id = $bankno;
        } else {
            if ($aid) {
                $acc = Account::find($aid);
                $record->bank_id = $acc->bank->bankno;
            }
        }
        $record->payno = $payno;
        if ($type) {  // 出金
            $record->gobalance = (float) $user->balance - (float) $amount;
        } else {  // 入金
            $record->gobalance = (float) $user->balance + (float) $amount;
        }
        $record->day = Carbon::now()->format('Y-m-d');
        $record->month = Carbon::now()->format('Y-m');
        $record->save();
    }
}
