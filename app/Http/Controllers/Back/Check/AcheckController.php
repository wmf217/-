<?php

namespace App\Http\Controllers\Back\Check;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Back\Check\Check;
use App\AgentApply;
use App\Honor;
use DB;

class AcheckController extends MixController
{
    public function __construct()
    {
        $this->_model = 'AgentApply';
        $this->_title = '代理审批';
        $this->_theRaw = "status = 0";
        $this->_index = "acheck";
        $this->_p_index = "check";
        $this->_single_btn = true;
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'userName' => [
                'show' => '用户',
                'url' => '/back/user/pre-agentapply/{id}'
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
                                'id','userName','detail','created_at'
                             ];
        $this->_handle_btn['destroy'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = false;
        $this->_list_buttons = [
            '0' => ['require' => true, 'type' => 'iframe', 'name'=>'审核', 'action' => '/back/acheck/check/{id}']
        ];
        // $this->_handle_btn['show']['show'] = '查看详情';
        parent::__construct();
    }

    public function check ($aid) {
        $apply = AgentApply::findorfail($aid);
        $honors = Honor::all();
        return view('back.check.acheck.check', compact('apply', 'honors'));
    }

    public function doCheck(Request $request, $id) {
        DB::beginTransaction();
        try {
            $agent = AgentApply::findorfail($id);
            $agent->status = (int) $request->status;
            if ($agent->status == config('constants.STATUSID')['SUCCESS']) {
                $agent->save();
                $agent->user()->update(['honor_id' => $request->honor, 'is_agent' => 1]);
            } else {
                $agent->reason = $request->reason;
                $agent->save();
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
