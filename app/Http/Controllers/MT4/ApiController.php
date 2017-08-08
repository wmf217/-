<?php

namespace App\Http\Controllers\MT4;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\MT4\MT4;

class ApiController extends Controller
{
    public function index(Request $request,$func)
    {
        return $this->$func($request);
    }

    private function hold (Request $request) { // 当前持单
        $mt4 = new MT4();
        $traders = json_decode($mt4->online());
        if ($traders->code != 1) {
            $message = $traders->message?$info->message:'无';
            return array('status' => 0, 'code' => $traders->code, 'message' => $message);
        }
        return $this->jsData($traders);
    }
}
