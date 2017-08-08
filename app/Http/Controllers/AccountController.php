<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use App\Http\Controllers\Tool\cRecord;
use App\Bank;
use App\User;
use App\Record;
use App\Out;
use App\Translist;
use App\Account;
use DB;
use App\Traits\Account\pay;

class AccountController extends Controller
{
    use pay;
    public function in () {
        Auth::user()->syncInfoFacade();
        $banks = Bank::all();
        return View::make('account.in', compact('banks'));
    }

    public function out () {
        Auth::user()->syncInfoFacade();
        $accounts = Auth::user()->account;
        return View::make('account.out', compact('accounts'));
    }

    public function doOut (Request $Request) {
        if(!Auth::user()->testVa($Request->amount)) {
            return $this->showError('余额不足');
        }
        DB::transaction(function () use ($Request) {
            Auth::user()->goVaOut($Request->amount);
            cRecord::Record(Auth::id(),$Request->amount,1,$Request->account_id,date("YmdHis",time()).rand(1000,9999));
        });
        return redirect()->route('account.out', 1);
    }

    public function inlist ($type = 0, $status = -1) {
        $builder = Auth::user()->record()->whereType($type);
        if ($status != -1) {
            $builder->whereStatus($status);
        }
        if ($type == 0) {
            $note = '入金';
        } else {
            $note = '出金';
        }
        $records = $builder->orderBy('id', 'desc')->paginate(10);
        return View::make('account.list', compact('records', 'type', 'status', 'note'));
    }

    public function pre ($type = 0) { // 0入金
        $mrecords = Auth::user()->record()->whereType($type)->select('month', DB::raw('sum(amount) as sum'), DB::raw('count(amount) as count'))->groupBy('month')->get();
        return View::make('account.pre', compact('mrecords', 'type', 'status'));
    }

    public function transfer () {
        return View::make('account.transfer');
    }

    public function doTransfer (Request $Request) {
        DB::beginTransaction();
        try {
            if(!Auth::user()->testVa($Request->amount)) {
                return $this->showError('可用金不足');
            }
            $Transfer = new Translist;
            $to = User::whereName($Request->name)->first();
            if (!$to) {
                throw new \Exception('你要查找的用户不存在,请返回重试');
                // return $this->showError(');
            } else {
                $Transfer->to = $to->id;
            }
            $Transfer->fill($Request->all());
            $Transfer->from = Auth::id();
            $Transfer->save();
            Auth::user()->goVaOut($Request->amount); // 可用金减少
            DB::commit();
            return redirect()->route('account.translist');
        }
        catch (\Exception $e)
        {
            DB::rollback();
            return $this->showError($e->getMessage());
        }
    }

    public function translist ($status = -1) {
      //todo $builder= new Translist失效
        $builder = Auth::user()->translistOut();
        if ($status != -1) {
            $builder->whereStatus($status);
        }
        $transfers = $builder->orderBy('id', 'desc')->paginate(10);
        return View::make('account.transferlist', compact('transfers', 'status'));
    }

    public function api (Request $request) {
        $builder = Record::select('*');
        if ($request->uid) { //用户
            $builder->where('user_id', $request->uid);
        }
        $orWhere = ['payno'];
        return $this->paging($builder, $orWhere);
    }
}
