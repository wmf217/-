<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\View;
use App\User;
use App\AgentApply;
use App\Cinget;
use App\Commission;
use DB;

class AgentController extends Controller
{
    public function apply () {
        $info = Auth::user()->applyInfo();
        $is_wait = Auth::user()->agent_apply()->whereStatus(0)->count();
        return View::make('agent.apply', compact('info', 'is_wait'));
    }
    public function doApply () {
        $applys = new AgentApply();
        $applys->status = 0;
        $applys->user_id = Auth::id();
        $applys->save();
        return redirect()->route('agent.applylist');
    }
    public function offline () {
        $users =  Auth::user()->offlinePre();
        return View::make('agent.offline', compact('users'));
    }

    public function offlineData ($id) {
        $offlines =  User::find($id)->offlinePre();
        return $offlines->toJson();
    }

    public function applylist ($status = -1) {
        $builder = Auth::user()->agent_apply();
        if ($status != -1) {
            $builder->where('agent_applys.status', $status);
        }
        $applys = $builder->get();
        return View::make('agent.applylist', compact('applys', 'status'));
    }
    public function space () {
        return View::make('agent.space');
    }
    public function ciontransfer () {
        $builder = Auth::user()->toCommission()->notApply();
        $builder->leftJoin('users', 'users.id', '=', 'commissions.from');
        $builder->leftJoin('traders', 'traders.id', '=', 'commissions.trader_id');
        $builder->select('commissions.id as id', 'users.name as username', 'traders.order', 'traders.cmd', 'traders.volume', 'commissions.created_at', 'commissions.amount');
        $commissions = $builder->get();
        return View::make('agent.ciontransfer', compact('commissions'));
    }
    public function doCiontransfer (Request $request) {
        // print_r($request->cin);
        // die;
        DB::transaction(function () use ($request) {
            $cinapply =  new Cinget;
            $cinapply->detail = $request->detail;
            Auth::user()->cinget()->save($cinapply);
            $amount = 0;
            foreach ($request->cin as $id) {
                $commission = Commission::whereId($id);
                $commission->update(['cinget_id' => $cinapply->id]);
                $amount += $commission->first()->amount;
            }
            $cinapply->amount = $amount;
            $cinapply->save();
        });
        return redirect()->route('agent.cionlist');
    }
    public function cionlist (Request $request, $status = -1) {
        $input = $request->all();
        $builder = Auth::user()->cinget();
        if ($status != -1) {
            $builder->where('status', $status);
        }
        $builder->orderBy('id', 'desc');
        $applys = $builder->paginate(5);
        return View::make('agent.cionlist', compact('applys', 'input', 'status'));
    }
    public function cionpre () {
        $builder = Auth::user()->toCommission();
        $builder->groupBy('month');
        $builder->select('month', DB::raw('count(*) as count'), DB::raw('sum(amount) as amount'));
        $commissions = $builder->get();
        return View::make('agent.cionpre', compact('commissions'));
    }
    public function ciondetail (Request $request, $status = -1) {
        $builder = Auth::user()->toCommission();
        $builder->leftJoin('traders', 'traders.id', 'commissions.trader_id');
        $builder->leftjoin('users', 'commissions.from', 'users.id');
        $builder->select('commissions.id as id','traders.order as orderno', 'users.name as username', 'traders.cmd as flag', 'traders.volume', 'commissions.created_at', 'commissions.amount', 'commissions.status');
        if ($status != -1) {
            $builder->where('status', $status);
        }
        $commissions = $this->search($request, $builder)->orderBy('id', 'desc')->paginate(10);
        return View::make('agent.ciondetail', compact('commissions', 'status'));
    }

    private function search (Request $request, &$builder) {
        if ($request->from&&$request->from!='NaN') {
            $builder->where('commissions.created_at', '>', date('Y-m-d H:i:s', strtotime($request->from)));
        }
        if ($request->to&&$request->to!='NaN') {
            $builder->where('commissions.created_at', '<', date('Y-m-d H:i:s', strtotime($request->to)));
        }
        if ($request->username) {
            // echo strtotime($request->openfrom);
            $builder->where('users.name', 'like', '%'.$request->username.'%');
        }
        return $builder;
    }
}
