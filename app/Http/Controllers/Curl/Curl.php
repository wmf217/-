<?php
namespace App\Http\Controllers\Curl;
use App\Http\Controllers\Controller;
class Curl extends Controller{
    /**curl get方法**/
    public function curlGet($url){
       $useragent="Content-Type: application/json";
       $ch = curl_init();
       curl_setopt($ch, CURLOPT_URL, $url);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
       $output = curl_exec($ch);
       curl_close($ch);
       // showPrint($output);
       return  $output;
   }


    /**curl post方法**/
   public function curlRequest($url,$post_data,$method='POST'){
       $handle = curl_init();
       curl_setopt($handle, CURLOPT_CUSTOMREQUEST, $method);
       curl_setopt($handle, CURLOPT_POSTFIELDS, json_encode($post_data));
       curl_setopt_array($handle, array(
       CURLOPT_URL => $url,
       CURLOPT_RETURNTRANSFER => true,
       CURLOPT_FOLLOWLOCATION => true,
       CURLOPT_MAXREDIRS => 10,
       CURLOPT_HTTPHEADER => array("content-type:application/json"),
    //    CURLOPT_HEADER => false,
       CURLOPT_SSL_VERIFYPEER => false,
       CURLOPT_ENCODING => '',
       CURLOPT_HTTPAUTH => CURLAUTH_BASIC
       ));
       $response = curl_exec($handle);
       curl_close($handle);
       return  $response;
   }

}
