<?php

namespace App\Traits\Api;
use Illuminate\Http\Request;
use App\Trader;
use App\User;
use Log;
use App\Http\Controllers\MT4\MT4;
use Exception;

trait order
{
    /**
    ** api start
    **/
    public function api (Request $request, $column) {
        return $this->$column($request);
    }

    public function api_history (Request $request) {
        $user = User::whereName($request->name)->first();
        $user->syncTraderFacade();
        $builder = Trader::history();
        if ($request->name) { //用户
            $builder->where('login', $request->name);
        }
        $builder = $this->search($request, $builder);
        $orderBy=["traders.id","desc"];
        $orWhere = ['order', 'symbol', 'opentime', 'openprice', 'closetime', 'closeprice', 'profit', 'volume'];
        return $this->paging($builder, $orWhere, $orderBy);
    }

    public function api_hang (Request $request) {
        $user = User::whereName($request->name)->first();
        $user->syncTraderFacade();
        $builder = Trader::history()->hang();
        if ($request->name) { //用户
            $builder->where('login', $request->name);
        }
        $builder = $this->search($request, $builder);
        $orderBy=["traders.id","desc"];
        $orWhere = ['order', 'symbol', 'opentime', 'openprice', 'closetime', 'closeprice', 'profit', 'volume'];
        return $this->paging($builder, $orWhere, $orderBy);
    }

    public function api_hold (Request $request) { //user request->flag:hang挂单，nohang普通
        try {
            $mt4 = new MT4();
            $rs = json_decode($mt4->online());
            if (!is_object($rs)) {
                Log::info('MT4获取用户持仓单错误');
                throw new Exception('MT4持仓单错误');
            }
            if ($rs->code != 1) {
                Log::info('MT4获取用户持仓单错误,code:'.$rs->code);
                throw new Exception($rs->message);
            }
            $data = [];
            foreach ($rs->data as $k => $v) {
                if ($this->searchHold($request, $v, $request->flag)) {
                    $data[] = $v;
                }
            }
            $total = count($data);
            return [
                "sEcho"=>empty($_GET['sEcho'])?0:$_GET['sEcho'],
                "recordsTotal" =>$total,
                "recordsFiltered" =>$total,
                "data" =>$data // necessary
            ];
        } catch (\Exception $e){
            return [
                "sEcho"=>"",
                "recordsTotal" => 0,
                "recordsFiltered" => 0,
                "data" =>[] // necessary
            ];;
        }
    }

    private function searchHold (Request $request, $v, $flag) { //持仓订单的搜索条件flag 是否是挂单
        if ($flag == 'nohang') {
            if (!in_array($v->cmd, [0,1])) return false;
        } elseif ($flag == 'hang') {
            if (!in_array($v->cmd, [2,3,4,5])) return false;
        }
        if ($request->name) {
            if ($request->name != $v->login) return false;
        }
        if ($request->cmd != -1) {
            if ($request->cmd != $v->cmd) return false;
        }
        if ($request->wlfrom!==null) {
            if ($request->wlfrom >= $v->profit) return false;
        }
        if ($request->wlto!==null) {
            if ($request->wlto <= $v->profit) return false;
        }
        if ($request->openfrom) {
            if (strtotime($request->openfrom) > $v->opentime) return false;
        }
        if ($request->opento) {
            if (strtotime($request->opento) < $v->opentime) return false;
        }
        if ($request->objectname) {
            if (!strpos($v->symbol, $request->objectname)) return false;
        }
        return true;
    }

    private function search (Request $request, &$builder) { // 历史订单的搜索条件
        if ($request->cmd != -1) {
            $builder->where('cmd', '=', $request->cmd);
        }
        if ($request->wlfrom!==null) {
            $builder->where('profit', '>=', $request->wlfrom);
        }
        if ($request->wlto!==null) {
            $builder->where('profit', '<=', $request->wlto);
        }
        if ($request->openfrom) {
            // echo strtotime($request->openfrom);
            $builder->where('opentime', '>', strtotime($request->openfrom));
        }
        if ($request->opento) {
            $builder->where('opentime', '<', strtotime($request->opento));
        }
        if ($request->closefrom) {
            $builder->where('closetime', '>', strtotime($request->closefrom));
        }
        if ($request->closeto) {
            $builder->where('closetime', '<', strtotime($request->closeto));
        }
        if ($request->objectname) {
            $builder->where('symbol', 'like', '%'.$request->objectname.'%');
        }
        return $builder;
    }

    /**
    ** api start
    **/
}
