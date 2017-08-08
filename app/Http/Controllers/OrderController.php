<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use App\User;
use App\Traits\Api\order as orderApi;
use App\Order;
use DB;

class OrderController extends Controller
{
    use orderApi; // api
    
    public function hold () { //持仓单
        return View::make('order.hold');
    }

    public function holdhang () { //持仓挂单
        return View::make('order.holdhang');
    }

    public function history (Request $request, $flag = -1) {
        return View::make('order.history');
    }

    public function hang (Request $request, $flag = -1) {
        return View::make('order.hang');
    }

    public function win () {
        $obs = $this->procedure('call objectpre('.Auth::user()->name.',1)'); // 1是盈利产品
        return View::make('order.win', compact('obs'));
    }

    public function lose () {
        $obs = $this->procedure('call objectpre('.Auth::user()->name.',2)'); // 2是亏损产品
        return View::make('order.lose', compact('obs'));
    }

    public function charge () {
        return View::make('order.charge');
    }
}
