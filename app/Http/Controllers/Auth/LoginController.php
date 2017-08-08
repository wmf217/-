<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Bank;
use App\Group;
use App\User;
use App\Account;
use Illuminate\Support\Facades\Hash;
use DB;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = 'home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //
    // }

    public function index() {
        if (Auth::check()) {
            return redirect()->route($this->redirectTo);
        } // 不知道为啥放构造函数不好用
        return view('auth.login');
    }

    public function register (Request $request) {
        $realg = Group::where('simulate', 0)->get(); //真实组
        $nrealg = Group::where('simulate', 1)->get(); //模拟组
        $banks = Bank::all();
        $agent = $request->agent;
        return view('auth.register')
               ->withRealg($realg)
               ->withNrealg($nrealg)
               ->withBanks($banks)
               ->withAgent($agent);
    }

    public function doRegister (Request $request) {
        DB::transaction(function () use ($request) {
            $user = new User();
            $user->password = $request->password; //支付密码
            $user->fill($request->all());
            $this->removeImage($user, 'idfront', 'id');
            $this->removeImage($user, 'idback', 'id');
            $user->save();
            $account = new Account();
            $account->fill($request->all());
            $this->removeImage($account, 'frontimg', 'account');
            $this->removeImage($account, 'backimg', 'account');
            $user->account()->save($account);
            // Auth::login($user);
        });
        return redirect()->route('wait');
    }

    public function login(Request $request) {
        if (Auth::attempt(['name' => $request->get('name'), 'password' => $request->get('password')], $request->remember)) {
            return $this->jsData('');
        } else {
            return $this->jsError('验证错误，请检查用户名或密码');
        }
    }

    public function logout() {
        Auth::logout();
        return redirect()->route('index');
    }

    public function sim () { //模拟登陆//TODO
        $user = User::find(33);
        Auth::login($user);
        return redirect()->route('home');
    }
}
