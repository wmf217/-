<?php

namespace App\Http\Controllers\Back\Check;

use App\User;
use App\Record;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\InShipped;
use Illuminate\Http\Request;

class IncheckController extends MixController
{
    public function __construct()
    {
        $this->_model = 'record';
        $this->_title = '入金审核';
        $this->_theRaw = "type = 0 and status = 0";
        $this->_index = "incheck";
        $this->_p_index = "check";
        $this->_single_btn = true;
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'userName' => [
                'show' => '用户',
                'url' => '/back/user/pre-record/{id}'
            ],
            'amount' => [
                'show' => 'CNY',
                'search' => "amount like CONCAT('%', ?, '%')",
                'front' => 'red'
            ],
            'bebalance' => [
                'show' => '申请前',
                'front' => 'blue'
            ],
            'bankName' => [
                'show' => '银行',
                'url' => '/back/account/pre-record/{id}'
            ],
            'bankno' => [
                'show' => '银行卡',
                'search' => "bankno like CONCAT('%', ?, '%')",
                'url' => '/back/account/pre-record/{id}'
            ],
            'payno' => [
                'show' => '单号',
                'search' => "payno like CONCAT('%', ?, '%')",
            ],
            'wayZh' => [
                'show' => '入金类型',
            ],
            'created_at' => [
                'show' => '申请时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'payno','userName','bankName','bankno','wayZh','amount','bebalance','created_at'
                             ];
        $this->_handle_btn['destroy'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = false;
        $this->_list_buttons = [
            '0' => ['require' => true, 'type' => 'iframe', 'name'=>'入金审核', 'action' => '/back/incheck/check/{id}']
        ];
        // $this->_handle_btn['show']['show'] = '查看详情';
        parent::__construct();
    }

    public function check ($rid) {
        $record = Record::findorfail($rid);
        $account = $record->account;
        return view('back.check.incheck.check', compact('record', 'account'));
    }

    public function doCheck(Request $request, $id) {
        $record = Record::findorfail($id);
        $record->status = (int) $request->status;
        if ($record->status == 1) {
            $rs = $record->user->goIn($record->amount);
            if ($rs['status']) {
                $record->save();
                $shipped = new InShipped($record->payno,'成功');
                Mail::to($record->user->email)->send($shipped);
                return $this->jsData('审核成功');
            } else {
                return $this->jsError($rs['data']);
            }
        } else {
            $record->reason = $request->reason;
            $record->save();
            $shipped = new InShipped($record->payno,'失败',$record->reason);
            Mail::to($record->user->email)->send($shipped);
            return $this->jsData('驳回成功');
        }
    }

}
