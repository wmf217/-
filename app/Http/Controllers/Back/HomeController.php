<?php

namespace App\Http\Controllers\Back;
use App\User;
use App\Record;
use App\Translist;
use App\Cinget;
use App\Trader;
use App\Nav;
use App\Honor;
use App\Object;
use App\AgentApply;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use DB;

class HomeController extends Controller
{
    public function index () {
        $navs = Nav::with('child')->wherePid(0)->orderBy('order', 'asc')->get();
        $index = "index";
        $p_index = "";
        return view('back.index', compact('navs','index','p_index'));
    }

    public function login () {
        return view('back.login');
    }

    public function doLogin (Request $request) {
        if (Auth::attempt(['name' => $request->get('name'), 'password' => $request->get('password')], $request->remember)) {
            if (Auth::user()->role == 0) {
                return redirect()->route("back.index");
            } else {
                return redirect()->route("index");
            }
        } else {
            echo "<script language=\"javascript\">alert('验证错误');history.go(-1)</script>";
        }
    }

    public function home (Request $request, $func) {
        return $this->$func($request);
    }

    private function logout() {
        Auth::logout();
        return redirect()->route('back.login');
    }

    private function help () {
        echo "帮助支持";
    }

    private function setting () {
        echo "系统设置";
    }

    /**
    ** api start
    **/

    private function uncheck () { // 代办
        $userNum = User::uncheck()->count();
        $inNum = Record::in()->whereStatus(0)->count();
        $outNum = Record::outer()->whereStatus(0)->count();
        $tNum = Translist::whereStatus(0)->count();
        $cNum = 0;
        // $cNum = Cinget::whereStatus(0)->count();
        $aNum = 0;
        // $aNum = AgentApply::whereStatus(0)->count();
        $data = ['total' => $userNum+$inNum+$outNum+$tNum+$cNum+$aNum,'user'=>$userNum, 'in'=>$inNum, 'out'=>$outNum, 't'=>$tNum, 'c'=>$cNum, 'a'=>$aNum];
        return $this->jsData($data);
    }

    private function main () { // 首页统计接口
        $uCount = User::active()->count(); //网站用户数
        $inSum = Record::in()->get()->sum('amount');
        $outSum = Record::outer()->get()->sum('amount');
        $netSum = $inSum - $outSum; // 净入金
        // $cSum = Cinget::whereStatus(1)->get()->sum('amount');// 佣金支出
        $oCount = Trader::count();
        $date = date('H:i', time() + 8*60*60);
        $total = array('uCount' => $uCount, 'netSum' => $netSum, 'oCount' => $oCount, 'date' => $date);
        return $this->jsData($total);
    }

    public function week (Request $request) { // 图标统计
        $dates = $this->weekDates($request->from, $request->to);
        $oNum = [];
        $oHand = [];
        $in = [];
        $out = [];
        foreach ($dates as $key => $date) {
            $oNum[] = Trader::whereDate('created_at', $date)->count();
            $oHand[] = Trader::whereDate('created_at', $date)->sum('volume');
            $in[] = Record::whereDate('created_at', $date)->in()->count();
            $out[] = Record::whereDate('created_at', $date)->out()->count();
        }
        $array = array('dates' => $dates, 'oNum' => $oNum, 'oHand' => $oHand, 'in' => $in, 'out' => $out);
        return $this->jsData($array);
    }

    private function weekDates ($from, $to) {
        if (!$from) {
            $from = date('Y-m-d', strtotime( '+'. -7 .' days' ));
        }
        if (!$to) {
            $to = date('Y-m-d');
        }
        $j = (strtotime($to) - strtotime($from)) / 86400 + 1; // 天数
        $start_time = strtotime($from);
        $dates = array();
        for($i=0;$i<$j;$i++){
             $dates[] = date('Y-m-d',$start_time+$i*86400); //每隔一天赋值给数组
        }
        return $dates;
    }

    public function object (Request $request) { // 产品统计
        $builder = Trader::select('symbol', DB::raw('count(*) as count'));
        if ($request->name) {
            $builder->whereLogin($request->name);
        }
        $symbols = $builder->groupBy('symbol')->get();
        $array = array('objects' => $symbols->pluck('symbol'), 'oNum' => $symbols->pluck('count'));
        return $this->jsData($array);
    }

    public function honor () { // 资质
        $honors=Honor::all();
        return $this->jsData($honors);
    }

    public function usere () { // 用户简报
        $builder = Trader::select('login', DB::raw('count(*) as count'));
        $builder->groupBy('login');
        $builder->orderBy('count', 'desc')->take(4);
        $data = $builder->get();
        return $this->jsData($data);
    }

    /**
    ** api end
    **/
}
