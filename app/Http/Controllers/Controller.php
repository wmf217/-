<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\View;
use App\Setting;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected $setting;// 全局配置

    public function __construct()
    {
        date_default_timezone_set('Etc/GMT-8');
        $this->setting = Setting::first();
        View::share('setting',$this->setting);
    }

    public function procedure ($sql) {  // 执行存储过程
        $mysqli = mysqli_init();
        $mysqli->real_connect(env('DB_HOST'), env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'));
        $result = $mysqli->query($sql); //第二个参数1代表赢，2代表输，其它代表全部
        $results = [];
        while($field = $result->fetch_object())
        {
            array_push($results,$field);
        }
        return $results;
    }

    public function jsData($data)
    {
        return array('status' => true, 'data' => $data);
    }

    public function jsError($err)
    {
        return array('status' => false, 'data' => $err);
    }

    public function showError($err)
    {
        return view('error', compact('err'));
    }

    public function isDirOrCreate($dir){ // todo 移出
        if(!is_dir($dir)){
            mkdir($dir,0777,true);
        }
    }

    public function paging($query,$orWhere=[],$orderBy=["id","desc"],$where=[]){
        //搜索条件
        if(!empty($where)&&is_array($where)){
            foreach ($where as $k=>$v){
                if(is_array($v)&&count($v)==2){
                    if($v[0]=="is"){
                        if($v[1]=="null"){
                            $query->whereNull($k);
                        }elseif($v[1]=="not null"){
                            $query->whereNotNull($k);
                        }
                    }else{
                        $query->where($k,$v[0],$v[1]);
                    }
                }
            }
        }

        $total = $query->count();
        if($total==0) return $this->emptyPage(0);

        //分页检索条件
        if(!empty($_GET['sSearch'])&&!empty($orWhere)){
            $query->where(function($q) use ($orWhere) {
                $_GET['sSearch'] = trim($_GET['sSearch']);
                foreach ($orWhere as $k=>$v){
                    if(!is_array($v)){
                        //当检索值为中文时，不检索字段为时间类型的项
                        if(stripos($v, "created_at")!==false||stripos($v, "updated_at")!==false){
                            if(hasChineseChar($_GET['sSearch'])){
                                continue;
                            }
                        }
                        $q->orWhere($v,"like","%{$_GET['sSearch']}%");
                    }else{
                        //处理状态信息
                        $search = array_like($_GET['sSearch'], $v);
                        if($search){
                            $tran = array_flip($v);
                            $search = $tran[$search];
                            if(is_numeric($search)){
                                $q->orWhere($k,$search);
                            }else{
                                if($search==="null"){
                                    $q->orWhereNull($k);
                                }elseif ($search==="not null"){
                                    $q->orWhereNotNull($k);
                                }
                            }
                        }
                    }
                }
            });
        }

        //检索后的bug总数
        $filterTotal = $query->count();
        //$this->writeLog($this->getDBQueryLog());
        if($filterTotal==0) return $this->emptyPage($total);
        //起始行
        $start  = empty($_GET['iDisplayStart'])?0:$_GET['iDisplayStart'];
        //行数
        $length = empty($_GET['iDisplayLength'])?10:$_GET['iDisplayLength'];

        if($orderBy){
            $data = $query->skip($start)->take($length)->orderBy($orderBy[0],$orderBy[1])->get();
        }else{
            $data = $query->skip($start)->take($length)->get();
        }
        return [
            "sEcho"=>empty($_GET['sEcho'])?0:$_GET['sEcho'],
            "recordsTotal" =>$total,
            "recordsFiltered" =>$filterTotal,
            "data" =>$data // necessary
        ];
    }

    protected function emptyPage($total){
        return [
            "sEcho"=>empty($_GET['sEcho'])?0:$_GET['sEcho'],
            "recordsTotal" =>$total,
            "recordsFiltered" =>0,
            "data" =>[] // necessary
        ];
    }

    public function removeImage (&$obj, $field, $folder) {
        if($obj->$field&&strpos($obj->$field,"/uploads/temp/")!==false){
            $filename=public_path() .$obj->$field;
            if(file_exists($filename)){
                $imagename = str_replace("/uploads/temp/", "", $obj->$field);
                $this->isDirOrCreate(public_path()."/images/front/".$folder."/".date("Ymd"));
                rename($filename, public_path()."/images/front/".$folder."/".$imagename);
                $obj->$field = "/images/front/".$folder."/".$imagename;
            }
        }
    }
}
