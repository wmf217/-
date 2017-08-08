<?php
namespace App\Http\Controllers;
use Illuminate\Support\Facades\Input;
class CommonController extends Controller{
    /**
     * 下载文件并重命名
     */
    public function down(){
        $filename = \Input::get("filename");
        $url      = \Input::get("url");
        $file     = public_path($url);

        if(!file_exists($file)){
            return $this->showError("文件不存在");
        }

        if(empty($filename)){
            $filename = pathinfo($file,PATHINFO_BASENAME);
        }else{
            //如果文件名不含后缀，补充后缀
            $ext  = pathinfo($file,PATHINFO_EXTENSION);
            if(!strpos($filename,$ext)){
                $filename = $filename.".".$ext;
            }
        }

        ob_start();
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:attachment;filename="' .$filename. '"');//输出模板名称
        header("Content-Transfer-Encoding: binary");
        header("Last-Modified:".gmdate("D, d M Y H:i:s")." GMT");
        header("Accept-Length:".filesize($file));
        header('Pragma: public');
        header('Expires: 60');
        header('Cache-Control: public');
        @readfile($file);//读取文件到输出缓存
    }

    public function uploadImage(){ // 通用
        return $this->image('uploadimg');
    }
    private function image ($name) {
        if (Input::hasFile($name))
        {
            $file=Input::file($name);
            $size = $file ->getSize();
            $entension = $file -> getClientOriginalExtension(); //上传文件的后缀
            if(!($entension == 'png' || $entension == 'jpg' || $entension == 'jpeg' || $entension == 'bmp' || $entension == 'gif')){
                return ["error"=>"上传格式不正确"];
            }
            if($size>10000000){//200kb
                return ["error"=>"上传文件太大"];
            }
            $clientName = $file -> getClientOriginalName();
            $dateDir = date('Ymd', time());
            $version_dir = public_path().'/uploads/temp/'.$dateDir;
            // return $version_dir;
            $this->isDirOrCreate($version_dir);
            $newName = md5(date('ymdhis').$clientName).".".$entension;
            $dateDir = date('Ymd', time());
            $path = $file -> move($version_dir,$newName);
            return    ['path'=>'/uploads/temp/'.$dateDir.'/'.$newName];
        } else {
            return ["error"=>"没有上传文件"];
        }
    }
}
