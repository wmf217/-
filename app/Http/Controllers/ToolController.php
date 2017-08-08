<?php
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use App\Http\Controllers\Curl\CurlController;
use App\User;
use App\Record;
use App\Translist;
use App\Trader;
use App\Account;
use DB;
use Carbon\Carbon;
use App\Http\Controllers\Curl\Curl;
use App\Http\Controllers\MT4\MT4;

class ToolController extends Controller
{
    public function index(Request $request, $func)
    {
        return $this->$func($request);
    }

    public function randomkeys()
    {
        $length = 6;
        $pattern = '1234567890abcdefghijklmnopqrstuvwxyz
                   ABCDEFGHIJKLOMNOPQRSTUVWXYZ';
        $num = '1234567890';
        $str = 'abcdefghij';
        $key = '';
        $key .= $num{mt_rand(0,9)}; //第一位数字
        for($i=0;$i<$length;$i++)
        {
            $key .= $pattern{mt_rand(0,35)};    //生成php随机数
        }
        $key .= $str{mt_rand(0,9)}; //末尾字符
        echo $key;
    }

    public function wmf () {
        echo date('Y-m-d H:i:s', time());
    }

    public function signin () {// 测试新注册接口
        $mt4 = new MT4 ();
        $user = User::find(34);
        $rs = $mt4->signin($user->password, $user->email, $user->group);
        print_r($rs);
    }

    private function vailable (Request $request) {
        $user = User::whereName($request->name)->first();
        $outAmount = $user->record()->out()->whereStatus(0)->sum('amount');
        $toutAmount = $user->translistOut()->whereStatus(0)->sum('amount');
        $user->vailable = $user->balance - $outAmount - $toutAmount;
        $user->save();
    }

    private function text (Request $request) {
        echo empty('');
    }

    private function day (Request $request) {
        echo Auth::user()->trader()->mix('regdate');
        // echo $str = strtotime("-1 year");
        // echo date('Y-m-d' , $str);
    }

    private function recordday (Request $request) {
        $orders = Auth::user()->record;
        foreach ($orders as $key => $order) {
            $date = $order->created_at->format('Y-m-d');
            // echo $date;
            $order->day = $date;
            $order->save();
        }
    }

    private function history(Request $request){ // 测试历史订单
         $from = '2017-07-17';
         $to ='2017-07-19';
         $mt4 = new MT4();
         $rs = $mt4->history(19870907, 1500280517, strtotime($to));
        //  $rs = json_decode($rs);
         echo "<pre>";
         print_r($rs);
    }

    private function money (Request $request) { // 测试入金接口
        $mt4 = new MT4();
        $rs = $mt4->deposit(159495265, 10000, '');
        $rs = json_decode($rs);
        echo "<pre>";
        print_r($rs);
    }

    private function userinfo(Request $request){// 测试获取用户信息接口
        $mt4 = new MT4();
        $rs = $mt4->userinfo(20484164);
        $rs = json_decode($rs);
        echo "<pre>";
        print_r($rs);
    }

    private function online (Request $request) {
        $mt4 = new MT4();
        $rs = $mt4->online();
        // $rs = json_decode($rs);
        echo "<pre>";
        print_r($rs);
    }

    private function password () {
        $mt4 = new MT4();
        $rs = $mt4->changePwd(20484164, 'abc123');
        print_r($rs);
    }

    private function view (Request $request) {
        return view('test');
    }

}
