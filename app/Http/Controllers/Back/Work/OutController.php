<?php

namespace App\Http\Controllers\Back\Work;

use App\User;
use App\Http\Controllers\Controller;
use App\Http\Controllers\MixController;
use App\Traits\Tool\Excel;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Record;
use DB;

class OutController extends MixController
{
    use Excel;
    public function __construct()
    {
        $this->_model = 'Record';
        $this->_title = '出金';
        $this->_theRaw = "type = 1 and status = 1";
        $this->_index = "out";
        $this->_p_index = "work";
        $this->_fields_all = [
            'id' => [
                'show' => '序号',
            ],
            'userName' => [
                'show' => '用户',
                'url' => '/back/user/pre-record/{id}'
            ],
            'amount' => [
                'show' => '金额',
                'search' => "amount like CONCAT('%', ?, '%')",
                'front' => 'red'
            ],
            'bebalance' => [
                'show' => '出金前',
            ],
            'gobalance' => [
                'show' => '出金后',
            ],
            'bankName' => [
                'show' => '银行',
                'url' => '/back/account/pre-record/{id}'
            ],
            'bankno' => [
                'show' => '银行帐号',
                'url' => '/back/account/pre-record/{id}'
            ],
            'payno' => [
                'show' => '单号',
                'search' => "payno like CONCAT('%', ?, '%')",
            ],
            'wayZh' => [
                'show' => '出金类型',
            ],
            'is_print' => [
                'show' => '是否处理',
                'type' => 'select',
                'source' => array(0 => '否',1 => '打印'),
                'front' => '#65BD77'
            ],
            'created_at' => [
                'show' => '出金时间',
                'search' => "created_at like CONCAT('%', ?, '%')",
            ],
        ];
        $this->_fields_show = [
                                'payno','userName','bankName','bankno','wayZh','amount','bebalance','gobalance','is_print','created_at'
                             ];
        $this->_fields_detail = [
                             'userName','bankName','bankno','wayZh','amount','bebalance','gobalance','created_at'
                          ];
        $this->_handle_btn['destroy'] = ['require'=>false];
        $this->_handle_btn['edit'] = ['require'=>false];
        $this->_handle_btn['create'] = ['require'=>false];
        $this->_handle_btn['show']['require'] = true;
        $this->_handle_btn['show']['show'] = '查看详情';
        $this->_buttons = [['show'=>'打印代付列表','css'=>'primary','type'=>'iframe','url'=>'/back/out/print-view']];
        parent::__construct();
    }

    public function printView () {
        return view('back.work.out.print'); // 打印筛选界面
    }

    public function printData () {
        $builder = $this->outBuilder();
        $builder->select('records.id as id','payno','records.amount','banks.name','account_number','account_name','account_branch','records.updated_at');
        $orderBy=["records.id","desc"];
        $orWhere = ['id', 'payno', 'amount', 'name', 'account_number', 'account_name', 'account_branch'];
        return $this->paging($builder, $orWhere, $orderBy);
    }

    public function printExcel (Request $request) {
        $builder = $this->outBuilder();
        if ($request->rids) {
            $rids = explode('_', $request->rids);
            $builder->whereIn('records.id', $rids);
        }
        $builder->select('records.id as id','payno','records.amount',DB::raw('1 as a'),DB::raw('0 as b'),'banks.name','account_number','account_name',DB::raw('"" as c'),DB::raw('"下发" as d'));
        $collect = $builder->get();
        $data = $collect->toArray();

        $this->printMark($collect);

        $this->createOrLoad(public_path("excel/out.xlsx"));
        $this->setWriteActiveSheet(0);

        $spid = config('tfb.spid');
        $no = date("YmdHis");
        $count = $collect->count();
        $amount = $collect->sum('amount');

        $this->writeSheet->setCellValue('A2',$spid);
        $this->writeSheet->setCellValue('B2',$no);
        $this->writeSheet->setCellValue('C2',$count);
        $this->writeSheet->setCellValue('D2',$amount);

        $this->writeData($data, 'A', 4);
        $this->write("下发".date("YmdHis").".xls");
    }

    private function printMark($collect) {
        foreach($collect as $v) {
            $v->is_print = 1;
            $v->save();
        }
    }

    private function outBuilder () {
        $builder = Record::where('is_print', 0)->out()->charge()->where('records.status',1);
        $builder->join('accounts', 'records.account_id','=','accounts.id');
        $builder->join('banks', 'accounts.bank_id','=','banks.id');
        return $builder;
    }
}
