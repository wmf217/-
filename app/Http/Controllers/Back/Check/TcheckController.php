<?php

namespace App\Http\Controllers\Back\Check;

use App\User;
use App\Translist;
use App\Record;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Http\Controllers\Tool\cRecord;
use DB;

class TcheckController extends MixController
{
    public function __construct()
    {
        $this->_model = 'Translist';
        $this->_title = '转账审核';
        $this->_theRaw = "status = 0";
        $this->_index = "tcheck";
        $this->_p_index = "check";
        $this->_single_btn = true;
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'fromUsername' => [
                'show' => '转出用户',
                'url' => '/back/user/pre-tfrom/{id}'
            ],
            'toUsername' => [
                'show' => '转入用户',
                'url' => '/back/user/pre-tto/{id}'
            ],
            'amount' => [
                'show' => '金额',
            ],
            'created_at' => [
                'show' => '申请时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'id', 'fromUsername','toUsername', 'amount', 'created_at',
                             ];
        $this->_handle_btn['destroy'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = false;
        $this->_list_buttons = [
            '0' => ['require' => true, 'type' => 'iframe', 'name'=>'审核', 'action' => '/back/tcheck/check/{id}']
        ];
        // $this->_handle_btn['show']['show'] = '查看详情';
        parent::__construct();
    }

    public function check ($id) {
        $t = Translist::findorfail($id);
        return view('back.check.tcheck.check', compact('t'));
    }

    public function doCheck(Request $request, $id) {
        DB::beginTransaction();
        try {
            $translist = Translist::findorfail($id);
            if (!User::find($translist->from)->testOut($translist->amount)) {
                throw new \Exception('信息错误,转出者账余额不足');
            }
            $translist->status = (int) $request->status;
            if ($translist->status == 1) {
                $translist->amount = (float) $translist->amount;
                $from = User::find($translist->from); //转出者
                $to = User::find($translist->to); //转入者
                $rs = $from->goOut($translist->amount); //一个出金
                if (!$rs['status']) {
                    throw new \Exception('转户出金失败：'.$rs['data']);
                }
                $rs = $to->goIn($translist->amount); //一个入金
                if (!$rs['status']) {
                    $return = $from->goIn($translist->amount);
                    if (!$return['status']) Log::info("严重错误，转账过程失败，付款方已出金，收款方未入金，订单：".$translist->id);
                    throw new \Exception('转户入金失败：'.$rs['data']);
                }
                $translist->save(); //已通过
                cRecord::gpRecord($translist->from, $translist->amount, 1, config('constants.RECORDWAYID')['TRANSFER']);// 记录出金
                cRecord::gpRecord($translist->to, $translist->amount, 0, config('constants.RECORDWAYID')['TRANSFER']);// 记录入金
            } else {
                $translist->reason = $request->reason;
                User::find($translist->from)->returnVal($translist->amount);
                $translist->save();
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
