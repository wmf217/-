<?php

namespace App\Http\Controllers\Back\Account;

// use App\User;
use App\Record;
use App\Account;
use App\Http\Controllers\Controller as baseController;
use Illuminate\Support\Facades\Auth;

class AccountController extends baseController
{
    public function pre ($id) { // 查看账户
        $account = Account::findorfail($id);
        return view('back.account.pre', compact('account'));
    }

    public function preRecord ($id) {
        $record = Record::findorfail($id);
        $account = $record->account;
        return view('back.account.pre', compact('account'));
    }

}
