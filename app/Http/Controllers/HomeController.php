<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use App\Http\Controllers\OrderController;
use App\User;
use App\Mail\SendShipped;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\MT4\MT4;

class HomeController extends Controller
{
    public function index() {
        $user = User::find(Auth::id());
        $user->syncInfoFacade();
        $order = new OrderController();
        return View::make('index', compact('user'));
    }

    public function sendCode (Request $Request) {
        try {
            $code = rand(100000,999999);
            $shipped = new SendShipped($code);
            // $count = User::where('email', $Request->email)->count();
            // if ($count != 0) return $this->jsError('该邮箱已注册,请更换邮箱');
            Mail::to($Request->email)->send($shipped);
            return $this->jsData($code);
        } catch (\Exception $e) {
            return $this->jsError($e->getMessage());
        }
    }

    public function load () {
        return view('load');
    }

    public function sync () {
        Auth::user()->syncAllFacade();
        return $this->jsData('');
    }

    public function wait () {
        return view('wait');
    }

    public function historyPre() { // 历史订单预览数据
        $user = Auth::user();
        $user->syncTraderFacade();
        $orderHistory = [];
        $builder = $user->trader()->history();
        $orderHistory['count'] = $builder->count();
        $orderHistory['hand'] = $builder->sum('volume');
        $orderHistory['profit'] = round($builder->sum('profit'), 2);
        $orderHistory['openprice'] = $user->record()->in()->sum('amount');
        $orderHistory['closeprice'] = $user->record()->out()->sum('amount');
        $orderHistory['hang'] = $builder->history()->hang()->count();
        $orderHistory['credit'] = $user->credit;
        return $orderHistory;
    }

    public function holdPre() { // 持仓订单预览数据
        $mt4 = new MT4();
        $rs = json_decode($mt4->online());
        $collect = collect([]);
        if (is_object($rs)&&$rs->code == 1) {
            $collect = collect($rs->data)->where('login', Auth::user()->name);
        }
        $orderHold['count'] = $collect->count();
        $orderHold['hand'] = $collect->sum('volume');
        $orderHold['profit'] = $collect->sum('profit');
        $orderHold['orders'] = $collect->take(4);
        return $orderHold;
    }

}
