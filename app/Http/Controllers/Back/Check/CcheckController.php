<?php

namespace App\Http\Controllers\Back\Check;

use App\User;
use App\Cinget;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Back\Check\Check;
use DB;

class CcheckController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Cinget';
        $this->_title = '佣金转户';
        $this->_theRaw = "status = 0";
        $this->_index = "ccheck";
        $this->_p_index = "check";
        $this->_single_btn = true;
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'userName' => [
                'show' => '用户',
                'url' => '/back/user/pre-cinget/{id}'
            ],
            'amount' => [
                'show' => '金额',
                'search' => "amount like CONCAT('%', ?, '%')",
                'front' => 'red'
            ],
            'detail' => [
                'show' => '备注',
            ],
            'created_at' => [
                'show' => '申请时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'id','userName','amount','detail','created_at'
                             ];
        $this->_handle_btn['destroy'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = false;
        $this->_list_buttons = [
            '0' => ['require' => true, 'type' => 'iframe', 'name'=>'审核', 'action' => '/back/ccheck/check/{id}']
        ];
        // $this->_handle_btn['show']['show'] = '查看详情';
        parent::__construct();
    }

    public function check ($cid) {
        $cinget = Cinget::findorfail($cid);
        $commissions = $cinget->commission;
        return view('back.check.ccheck.check', compact('cinget', 'commissions'));
    }

    public function doCheck(Request $request, $id) {
        DB::beginTransaction();
        try {
            $cinget = Cinget::findorfail($id);
            $cinget->status = (int) $request->status;
            if ($cinget->status == config('constants.STATUSID')['SUCCESS']) {
                $rs = $cinget->user->goIn($cinget->amount);
                if ($rs['status']) {
                    $cinget->save();
                    $cinget->commission()->update(['status' => config('constants.STATUSID')['SUCCESS']]);
                    Check::gpRecord($cinget->user_id, $cinget->amount, 0, config('constants.RECORDWAYID')['COMMISSION']);
                    //TODO
                } else {
                    return $this->jsError($rs['data']);
                }
            } else {
                $cinget->reason = $request->reason;
                $cinget->save();
                $cinget->commission()->update(['cinget_id' => 0]);
            }
        } catch (\Exception $e)
        {
            DB::rollback();
            return $this->jsError($e->getMessage());
        }
        DB::commit();
        return $this->jsData('审核成功');
    }

}
