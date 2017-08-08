<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Bank;
use Carbon\Carbon;
use App\Account;
use DB;

class UserController extends Controller
{
    // public function __construct()
    // {
    //     parent::__construct();
    // }

    public function show () {
        Auth::user()->syncInfoFacade();
        return View::make('user.info');
    }

    public function store (Request $request) {
		try{
            DB::beginTransaction();
			$id = $request->get('id');
			$user = new User;
			if ($id) {
				$user = $user->find($id);
			}
            if ($request->get('password')) { // 修改了密码
                $user->syncPasswordFacade($request->get('password'));
            }
			$user->fill($request->all());
			$user->save();
            DB::commit();
			return redirect()->route('user.info');
        }catch (\Exception $e) {
            DB::rollback();
			echo $e->getMessage();
        }
	}

    public function phone () {
        $user = Auth::user();
        return View::make('user.phone', compact('user'));
    }

    public function password () {
        $user = Auth::user();
        return View::make('user.password', compact('user'));
    }

    public function heaver () {
        $user = Auth::user();
        return View::make('user.heaver', compact('user'));
    }

    public function email () {
        $user = Auth::user();
        return View::make('user.email', compact('user'));
    }

    public function report (Request $request) {
        $user = Auth::user();
        $from = $request->get('from', date('Y-m-01'));
        $to = $request->get('to', date('Y-m-d'));
        // 默认一个月
        $dates = $this->dateArray($from, $to);
        return View::make('user.report', compact('dates','user'));
    }

    private function dateArray ($from, $to) {
        $j = (strtotime($to) - strtotime($from)) / 86400 + 1; // 天数
        $start_time = strtotime($from);
        $dates = array();
        for($i=0;$i<$j;$i++){
             $dates[] = date('Y-m-d',$start_time+$i*86400); //每隔一天赋值给数组
        }
        return $dates;
    }

    public function bank () {
        $banks = Bank::all();
        return View::make('user.bank', compact('banks'));
    }

    public function doBank (Request $request) {
        if (Auth::user()->account()->count() > (int) $this->setting->userBanks) {
            return $this->showError('银行卡数量过多，请删除后新增');
        }
        $account = new Account;
        $account->fill($request->all());
        $account->user_id = Auth::user()->id;
        $this->removeImage($account, 'frontimg', 'account');
        $this->removeImage($account, 'backimg', 'account');
        $account->save();
        return redirect()->route('user.banks');
    }

    public function banks () {
        return View::make('user.banks');
    }

    public function delBank ($id) {
        DB::transaction(function () use ($id) {
            $account = Account::find($id);
            $rs = $account->delete();
        });
        return $this->jsData('删除成功');
    }
}
