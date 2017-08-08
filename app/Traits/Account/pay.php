<?php

namespace App\Traits\Account;
use App\Http\Controllers\Pay\RequestHandler;
use App\Http\Controllers\Pay\ResponseHandler;
use App\Http\Controllers\Pay\RSA;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Tool\cRecord;
use Log;
trait pay
{
    public function pay(Request $request) {

        $reqHandler = new RequestHandler ();

        // // 通信对象
        // $httpClient = new HttpClient ();
        // // 应答对象
        // $resHandler = new ClientResponseHandler ();

        // -----------------------------
        // 设置请求参数
        // -----------------------------
        $reqHandler->init ();
        $reqHandler->setKey ( config('tfb.key') );
        $reqHandler->setGateUrl ( config('tfb.cardpayApplyApi') );

        // ----------------------------------------
        // 设置请求参数
        // ----------------------------------------
        $reqHandler->setParameter ( "spid", config('tfb.spid') );
        $reqHandler->setParameter ( "sp_userid", Auth::id() );
        $reqHandler->setParameter ( "spbillno", date("YmdHis",time()).rand(1000,9999));
        $reqHandler->setParameter ( "money",  $request->amount*100);
        $reqHandler->setParameter ( "cur_type", config('tfb.cur_type') );
        $reqHandler->setParameter ( "notify_url", config('tfb.notify_url') );
        $reqHandler->setParameter ( "return_url", config('tfb.return_url') );
        $reqHandler->setParameter ( "errpage_url", config('tfb.errpage_url') );
        $reqHandler->setParameter ( "memo", "in" );
        $reqHandler->setParameter ( "expire_time", config('tfb.expire_time') );
        $reqHandler->setParameter ( "attach", Auth::id()."_".$request->bank );
        $reqHandler->setParameter ( "card_type", "1" );
        $reqHandler->setParameter ( "bank_segment", $request->bank );
        $reqHandler->setParameter ( "user_type", "1" );
        $reqHandler->setParameter ( "channel", config('tfb.channel') );
        $reqHandler->setParameter ( "encode_type", config('tfb.encode_type') );
        $reqHandler->setParameter ( "risk_ctrl", "" );

        // 获取debug信息,建议把请求和debug信息写入日志，方便定位问题
        $reqUrl = $reqHandler->getRequestURL ();
        $debugInfo = $reqHandler->getDebugInfo ();
        // Log::info("调试信息：" . $debugInfo);
        // echo "调试信息：" . $debugInfo."<br>";
        // echo $reqUrl;
        $reqHandler->doSend(htmlspecialchars_decode($reqUrl));
    }

    public function notify () {
        Log::info ( "进入后台回调页面" );
        $resHandler = new ResponseHandler ();
        if ($resHandler->getParameter ( "encode_type" ) == "MD5") {
        	$resHandler->setKey ( config('tfb.key') );
        }
        // 判断签名
        if ($resHandler->isGcSign ()) {
        	if ($resHandler->getParameter ( "pay_type" ) == "1") {
        		// pay_type=1是快捷支付，当前业务不会出现，所以不做处理
        	} elseif ($resHandler->getParameter ( "pay_type" ) == "2") {
        		if ($resHandler->getParameter ( "result" ) == "1") {
        			Log::info ( "借记卡支付后台回调成功" );
                    $attach = explode('_', $resHandler->getParameter ( "attach" ));
                    cRecord::Record($attach[0],$resHandler->getParameter ( "money" )/100,0,'',$resHandler->getParameter ( "spbillno" ),$attach[1]); // 入金申请记录//TODO
        		} else {
        			Log::info ( "借记卡支付后台回调失败" );
        		}
        	} elseif ($resHandler->getParameter ( "pay_type" ) == "3") {
        		if ($resHandler->getParameter ( "result" ) == "1") {
        			Log::info ( "信用卡支付支付后台回调成功" );
        		} else {
        			Log::info ( "信用卡支付后台回调失败" );
        		}
        	} else {
        	}
        } else {
        	Log::info ( "认证签名失败" );
        }
    }
}
