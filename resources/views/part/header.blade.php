<!DOCTYPE html PUBLIC "-/W3C/DTD XHTML 1.0 Transitional/EN" "http:/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http:/www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="shortcut icon" type="image/ico" href="/images/favicon.ico">
<link href="{{env('APP_URL')}}/css/css.css" rel="stylesheet" type="text/css" />
<link href="{{env('APP_URL')}}/css/style.css" rel="stylesheet" type="text/css" />
<link href="{{env('APP_URL')}}/css/bootstrap.min.css" rel="stylesheet">
<!-- <script src="{{env('APP_URL')}}/js/common/bluebird.js"></script> -->
<!-- <script src="{{env('APP_URL')}}/js/common/fetch-detector.js"></script> -->
<!-- <script src="{{env('APP_URL')}}/js/common/es6-promise.js"></script>
<script src="{{env('APP_URL')}}/js/common/fetch.js"></script> -->
<style type="text/css">
</style>
</head>

<body>
<div class="logo">
<div class="logoleft"><img src="{{env('APP_URL')}}{{$setting->logo or '/images/default.png'}}" width="216" height="90" />
</div>

<div class="logoright">
  <div class="logozi_2">
     <a style="color:#FFF;" href="{{$setting->url or '#'}}">返回官网</a>
  </div>
 </div>
<!-- <div class="logozi_2"><a href="{{env('APP_URL')}}" style="color:#FFF;">繁 體</a>
</div>
<div class="logozi_3"><a href="{{env('APP_URL')}}" style="color:#FFF;">English</a>
</div> -->




</div>
<div class="daohang">
<div class="mun1">
<div class="mun dingjicaidan">
<nav class="nav">
  <ul class="nav_menu">
    @if(!Auth::user()->simulate)
    <li class="nav_menu-item"><a href="javascript:void(0)"><div class="tu1"><img src="{{env('APP_URL')}}/images/h4.png" width="30" height="28" /></div>账户管理</a>
    <ul class="nav_submenu">
        <li class="nav_submenu-item dao"> 常用</li>
            <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/user/info"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b1.png" width="25" height="28" /></div>账户信息</a></li>
        <!-- <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b2.png" width="25" height="28" /></div>账户统计</a></li> -->
           <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/user/report" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b3.png" width="25" height="28" /></div>交易报表</a></li>
           <li class="nav_submenu-item dao"> 银行卡</li>
           <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/user/bank" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b19.png" width="25" height="28" /></div>添加银行卡</a></li>
           <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/user/banks" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b26.png" width="25" height="28" /></div>银行卡信息</a></li>
           <li class="nav_submenu-item dao"> 资料更改</li>
           <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/user/password"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b7.png" width="25" height="28" /></div>更改密码</a></li>
           <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/user/phone"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b5.png" width="25" height="28" /></div>更换手机</a></li>
               <!-- <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/user/email"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b6.png" width="25" height="28" /></div>更换电邮</a></li> -->
      </ul>

    </li>
    @endif
    @if(!Auth::user()->simulate)
    <li class="nav_menu-item"><a href="javascript:void(0)"><div class="tu1"><img src="{{env('APP_URL')}}/images/h3.png" width="30" height="28" /></div>出入金管理</a>
      <ul class="nav_submenu">
        <li class="nav_submenu-item dao"> 入金相关</li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/in" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b9.png" width="25" height="28" /></div>账户入金</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/list" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b10.png" width="25" height="28" /></div>入金记录</a></li>
         <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/pre" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b11.png" width="25" height="28" /></div>入金统计</a></li>
        <li class="nav_submenu-item dao">出金相关</li>
         <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/out" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b12.png" width="25" height="28" /></div>账户出金</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/list/1" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b13.png" width="25" height="28" /></div>出金记录</a></li>
         <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/pre/1" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b14.png" width="25" height="28" /></div>出金统计</a></li>
        <li class="nav_submenu-item dao">转账相关</li>
         <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/transfer" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b15.png" width="25" height="28" /></div>账户转账</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/account/translist" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b16.png" width="25" height="28" /></div>转账统计</a></li>
      </ul>
    </li>
    @endif
    <li class="nav_menu-item"><a href="javascript:void(0)"><div class="tu1"><img src="{{env('APP_URL')}}/images/h2.png" width="30" height="28" /></div>交易管理</a>
      <ul class="nav_submenu">
        <li class="nav_submenu-item dao">当前持仓</li>
        <!-- <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/hold" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b17.png" width="25" height="28" /></div>全部</a></li> -->
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/hold" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b18.png" width="25" height="28" /></div>订单</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/holdhang" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b19.png" width="25" height="28" /></div>挂单</a></li>
        <li class="nav_submenu-item dao">历史交易</li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/history"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b20.png" width="25" height="28" /></div>订单</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/hang"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b22.png" width="25" height="28" /></div>挂单</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/win"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b23.png" width="25" height="28" /></div>盈利产品</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/lose"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b24.png" width="25" height="28" /></div>亏损产品</a></li>
        <!-- <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/order/charge"><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b25.png" width="25" height="28" /></div>手续费</a></li> -->
      </ul>
    </li>
    <!-- <li class="nav_menu-item"><a href="javascript:void(0)" ><div class="tu1"><img src="{{env('APP_URL')}}/images/h2.png" width="30" height="28" /></div>代理专区</a>
     <ul class="nav_submenu">
         @if(!Auth::user()->is_agent)
        <li class="nav_submenu-item dao">代理申请</li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/apply" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b26.png" width="25" height="28" /></div>申请代理</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/applylist" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b27.png" width="25" height="28" /></div>申请记录</a></li>
        @else
        <li class="nav_submenu-item dao">账户相关</li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/offline" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b26.png" width="25" height="28" /></div>下线账户</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/space" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b28.png" width="25" height="28" /></div>仓位总结</a></li>
        <li class="nav_submenu-item dao">账户佣金</li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/ciontransfer" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b29.png" width="25" height="28" /></div>佣金转户</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/cionlist" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b30.png" width="25" height="28" /></div>转户记录</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/cionpre" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b32.png" width="25" height="28" /></div>佣金统计</a></li>
        <li class="nav_submenu-item"> <a href="{{env('APP_URL')}}/agent/ciondetail" ><div class="bxiaotu"><img src="{{env('APP_URL')}}/images/b33.png" width="25" height="28" /></div>佣金明细</a></li>
        @endif
      </ul>

    </li> -->

  </ul>
</nav>

<script src="{{env('APP_URL')}}/js/jquery-1.9.0.min.js"></script>
<!-- <script src="{{env('APP_URL')}}/js/bootstrap.min.js"></script> -->
<script src="{{env('APP_URL')}}/js/common.js"></script>

</div>
</div>
<div class="clear">
</div>
<div class="daok">
<div class="dao_1"><span onclick="javascript:window.location.href='{{env('APP_URL')}}/home'"><div class="hdiv"><img class="himg" src="{{env('APP_URL')}}/images/tt1.jpg"/></div></span>
  <div class="dao_text">系统主页</div>
</div>
<div class="dao_1"><span @if(Auth::user()->simulate) onlick="javascript:void(0)" @else onclick="javascript:window.location.href='{{env('APP_URL')}}/account/in'" @endif><div class="hdiv"><img class="himg" @if(Auth::user()->simulate) src="{{env('APP_URL')}}/images/tt2_gay.jpg" @else src="{{env('APP_URL')}}/images/tt2.jpg" @endif/></div></span>
  <div class="dao_text">账户入金</div>
</div>
<div class="dao_1"><span @if(Auth::user()->simulate)onlick="javascript:void(0)" @else onclick="javascript:window.location.href='{{env('APP_URL')}}/account/out'" @endif><div class="hdiv"><img class="himg" @if(Auth::user()->simulate) src="{{env('APP_URL')}}/images/tt3_gay.jpg" @else src="{{env('APP_URL')}}/images/tt3.jpg" @endif/></div></span>
  <div class="dao_text">账户出金</div>
</div>
<div class="dao_1"><span onclick="javascript:window.location.href='{{env('APP_URL')}}/order/hold'"><div class="hdiv"><img class="himg" src="{{env('APP_URL')}}/images/tt4.jpg"/></div></span>
  <div class="dao_text">持仓定单</div>
</div>
<div class="dao_1"><span onclick="javascript:window.location.href='{{env('APP_URL')}}/order/history'"><div class="hdiv"><img class="himg" src="{{env('APP_URL')}}/images/tt5.jpg"/></div></span>
  <div class="dao_text">历史交易</div>
</div>
<div class="dao_1"><span @if(Auth::user()->simulate)onlick="javascript:void(0)" @else onclick="javascript:window.location.href='{{env('APP_URL')}}/user/info'" @endif><div class="hdiv"><img class="himg" @if(Auth::user()->simulate) src="{{env('APP_URL')}}/images/tt6_gay.jpg" @else src="{{env('APP_URL')}}/images/tt6.jpg" @endif/></div></span>
  <div class="dao_text">账户信息</div>
</div>
<div class="dao_1"><span onclick="javascript:window.location.href='{{env('APP_URL')}}/order/win'"><div class="hdiv"><img class="himg" src="{{env('APP_URL')}}/images/tt7.jpg"/></div></span>
  <div class="dao_text">盈利产品</div>
</div>
<div class="dao_1"><span onclick="javascript:window.location.href='{{env('APP_URL')}}/logout'"><div class="hdiv"><img class="himg" src="{{env('APP_URL')}}/images/tt8.jpg"/></div></span>
  <div class="dao_text">退出系统</div>
</div>
</div>


</div>
