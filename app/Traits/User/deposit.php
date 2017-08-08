<?php

namespace App\Traits\User;
use App\Http\Controllers\MT4\MT4;
trait Deposit
{
    public function testVa ($amount) { // 检查出金是否合格(提交)
        $this->syncInfoFacade();
        return $this->vailable >= $amount;
    }

    public function testOut ($amount) { // 检查出金是否合格(审核)
        $this->syncInfoFacade();
        return $this->balance >= $amount;
    }

    public function goIn ($amount) { // 入金
        $rs = $this->syncDepositFacade((float) $amount);
        if ($rs['status']) {
            $this->balance = $this->balance + $amount;
            $this->vailable = $this->vailable + $amount;
            $this->netvalue = $this->netvalue + $amount;
            $this->save();
        }
        return $rs;
    }

    public function goOut ($amount) { // 减少余额(审核)
        if ($this->testOut($amount)) {
            $rs = $this->syncDepositFacade(0 - (float) $amount);
            if ($rs['status']) {
                $this->balance = $this->balance - $amount;
                $this->netvalue = $this->netvalue - $amount;
                $this->save();
            }
            return $rs;
        } else {
            return array('status' => false, 'data' => '余额不足');
        }
    }

    public function goVaOut ($amount) { // 减少可用金(提交)
        if ($this->testOut($amount)) {
            $this->vailable = $this->vailable - $amount;
            $this->save();
            // $this->vailable = $this->vailable - $amount;
        }
    }

    public function returnVal ($amount) { // 返回可用金审核不通过
        $this->vailable = $this->vailable + $amount;
        $this->save();
    }
}
