<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <meta name="viewport" content="width=device-width" />
    <title>用户登陆</title>
    <link href="{{env('APP_URL')}}/css/front/login/Login.css" rel="stylesheet" />
	<link href="{{env('APP_URL')}}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="{{env('APP_URL')}}/css/front/login/style.css" rel="stylesheet" />
	<meta charset="utf-8"/>
    <style>
        body {
            background-image: url('{{env('APP_URL')}}/images/banner.png');
        }
        .df {
           background-image: url('{{env('APP_URL')}}/images/con_right.png');

        }
    </style>
</head>
<body style="margin:auto;align-content:center;">

    <div style="width:100%;">
		<div style="width:100%;background-color:#ffffff;">
          	<img style="margin-left:8%;" src="{{env('APP_URL')}}{{$setting->logo or '/images/default.png'}}" width="254" height="100" />
        </div>
        <div style="margin-top:5%;width:auto;" class="main">
            <img src="{{env('APP_URL')}}/images/con_left.png" style="float:left;margin-left:20%;width:21.5%;" />
            <br />
            <div style="text-align: center;background-size:100%;background-image:url({{env('APP_URL')}}/images/con_right.png);background-repeat: no-repeat;width:25%;height:300px;margin-right:16%;">
                <br />
                <h4 style="font-family:微软雅黑;">登录中心</h4>
                <input name="name" placeholder="用户名" class="form-control" style="margin-top:5%;height:40px;width:75%;margin-left: 14%;" />
                <input name="password" type="password" placeholder="密码" class="form-control" style="margin-top:5%;height:40px;width:75%;margin-bottom:1%;margin-left: 14%;" />
                <h5><input type="checkbox" name="remember" style="margin-right:5px;">记住密码&nbsp;&nbsp;&nbsp;&nbsp;<a href="/register" style="color:#000000">没有账号？<font style="color:#0094ff">注册新账户</font></a></h5>
                <button id="js-mobile_btn" class="btn btn-primary" style="margin-top:7%;width:55%;height:40px;">立即登录</button>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery-1.9.0.min.js"></script>
<script src="{{env('APP_URL')}}/js/layer/layer.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var browser = BrowserType();
    if (browser == 'IE8'||browser == 'IE7') {
        layer_alert('本网站兼容性要求ie8以上版本,为了您的使用体验,建议使用谷歌,火狐等浏览器');
    }
	// FancyForm.setup();
    $("#js-mobile_btn").click(function(){
        var name = $("input[name='name']").val();
        var password = $("input[name='password']").val();
        var remember = $("input[name='remember']").is(':checked');
        if (name=='') {
            layer.msg('请填写用户名');
            return
        }
        if (password=='') {
            layer.msg('请填写密码');
            return
        }
		layer.load();
        // fetch('/login', {
        //     method: 'post',
        //     headers: {
        //         "Content-Type": "application/x-www-form-urlencoded"
        //     },
        //     credentials: 'include',
        //     body: "name=" + name + "&password=" + password + "&remember=" + remember
        // }).then(function(response){
		// 	layer.closeAll('loading')
        //     return response.json()
        // }).then(function(data){
        //     if (!data.status) {
        //         layer.msg(data.data)
        //     } else {
        //         window.location.href = "/load";
        //     }
        // })
		$.ajax({
	         type:'post',
	         url:'/login',
	         data:{ name: name, password: password, remember:remember },
	         cache:false,
	         dataType:'json',
	         success:function(data){
	             layer.closeAll('loading');
				 if (!data.status) {
	                 layer.msg(data.data);
	             } else {
                     if (browser == 'IE8'||browser == 'IE7') {
                 		window.location.href = "/home";
                        return;
                 	 }
	                 window.location.href = "/load";
	             }
	         },
	         error:function(e) {
	             console.log(e);
	         }
	    });
    });
});
</script>
</html>
