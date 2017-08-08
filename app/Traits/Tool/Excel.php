<?php
namespace App\Traits\Tool;
require  base_path("vendor/phpexcel/PHPExcel.php");

trait Excel {
    //excel对象
    public $xls;
    //当前输入sheet
    public $writeSheet;
    //file 路径
    public $file;

    /**
     * 设置当前写入sheet
     * @param int $index    sheet页码
     */
    public function setWriteActiveSheet($index, $isCreate = false){
        if($isCreate){
            $this->xls->createSheet();
        }
        $this->xls->setActiveSheetIndex($index);
        $this->writeSheet = $this->xls->getActiveSheet();
    }

    /**
     * 将excel发送给请求方
     * @param int $index    sheet页码
     */
    public function write($outputFileName){
        // 实例化Excel写入类
        if(!empty($this->file)&&substr($this->file, strrpos($this->file, '.')+1)=="xlsx"){
            // 设置以Excel5格式(Excel2007工作簿)
            $objWriter = \PHPExcel_IOFactory::createWriter($this->xls,'Excel2007');
        }else{
            // 设置以Excel5格式(Excel97-2003工作簿)
            $objWriter = \PHPExcel_IOFactory::createWriter($this->xls,'Excel5');
        }
        // 清空输出内容
        ob_clean();
        ob_start();
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header('Content-Disposition:attachment;filename="' .$outputFileName. '"');//输出模板名称
        header("Content-Transfer-Encoding: binary");
        header("Last-Modified:".gmdate("D, d M Y H:i:s")." GMT");
        header('Pragma: public');
        header('Expires: 60');
        header('Cache-Control: public');
        $objWriter->save('php://output');
    }

    /**
     * 创建或加载excel文件
     * @param string $source  加载文件地址
     */
    public function createOrLoad($source=null){

        if(empty($source)){

            // 创建excel
            $this->xls = new \PHPExcel();

        }else{

            // 加载excel
            if(substr($source, strrpos($source, '.')+1)=="xls"){
                $reader = \PHPExcel_IOFactory::createReader('Excel5');      //设置以Excel5格式(Excel97-2003工作簿)Excel2007
            }else{
                $reader = \PHPExcel_IOFactory::createReader('Excel2007');   //设置以Excel5格式(Excel2007工作簿)
            }

            if (!file_exists($source)) {
                throwError("$source is not exists.\n");
            }

            $this->file = $source;
            $this->xls = $reader->load($source); // 文件名称

        }
    }

    //写入循环数据
    public function writeData($data,$horizontal,$vertical){
        foreach($data as $key => $val){
            $Myvertical=$vertical+$key;
            $num=0;
            foreach ($val as $v) {
                $Myhorizontal=chr(ord($horizontal)+$num);
                $num++;
                $v = strip_tags($v);
                $this->writeSheet->setCellValue($Myhorizontal.$Myvertical,$v);
                //加边框
                // $this->writeSheet->getStyle($Myhorizontal.$Myvertical)->applyFromArray($this->styleArray);
            }
        }
    }
}
