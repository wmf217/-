<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>

<link href="{{env('APP_URL')}}/css/login.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery-1.9.0.min.js"></script>
<script src="{{env('APP_URL')}}/js/layer/layer.js"></script>
</head>
<body>
<!-- 代码 开始 -->
<div class="wrap">
	<div class="head"><div class="logo">
        <img src="{{env('APP_URL')}}{{$setting->logo or '/images/default.png'}}" width="254" height="100" />
    </div></div>

	<div class="banner-show" id="js_ban_content">

		<div class="cell bns-01">
			<div class="con">
			</div>
		</div>
		<div class="cell bns-02" style="display:none;">
			<div class="con">
				<a href="" target="_blank" class="banner-link">
				<i>圈子</i></a> </div>
		</div>
		<div class="cell bns-03" style="display:none;">
			<div class="con">
				<a href="" target="_blank" class="banner-link">
				<i>企业云</i></a> </div>
		</div>
	</div>
	<div class="banner-control" id="js_ban_button_box">
		<a href="javascript:;" class="left">左</a>
		<a href="javascript:;" class="right">右</a>
	</div>
<script type="text/javascript">
;(function(){

	var defaultInd = 0;
	var list = $('#js_ban_content').children();
	var count = 0;
	var change = function(newInd, callback){
		if(count) return;
		count = 2;
		$(list[defaultInd]).fadeOut(400, function(){
			count--;
			if(count <= 0){
				if(start.timer) window.clearTimeout(start.timer);
				callback && callback();
			}
		});
		$(list[newInd]).fadeIn(400, function(){
			defaultInd = newInd;
			count--;
			if(count <= 0){
				if(start.timer) window.clearTimeout(start.timer);
				callback && callback();
			}
		});
	}

	var next = function(callback){
		var newInd = defaultInd + 1;
		if(newInd >= list.length){
			newInd = 0;
		}
		change(newInd, callback);
	}

	var start = function(){
		if(start.timer) window.clearTimeout(start.timer);
		start.timer = window.setTimeout(function(){
			next(function(){
				start();
			});
		}, 8000);
	}

	start();

	$('#js_ban_button_box').on('click', 'a', function(){
		var btn = $(this);
		if(btn.hasClass('right')){
			//next
			next(function(){
				start();
			});
		}
		else{
			//prev
			var newInd = defaultInd - 1;
			if(newInd < 0){
				newInd = list.length - 1;
			}
			change(newInd, function(){
				start();
			});
		}
		return false;
	});

})();
</script>

<!-- <script type="text/javascript">
var FancyForm=function(){
	return{
		inputs:".reg-form input",
		setup:function(){
			var a=this;
			this.inputs=$(this.inputs);
			a.inputs.each(function(){
				var c=$(this);
				a.checkVal(c)
			});
			a.inputs.on("keyup blur",function(){
				var c=$(this);
				a.checkVal(c);
			});
		},checkVal:function(a){
			a.val().length>0?a.parent("div").addClass("val"):a.parent("div").removeClass("val")
		}
	}
}();
</script> -->

	<div class="container">
		<div class="register-boy"><img src="{{env('APP_URL')}}/images/con_left.png" alt=""/></div>
		<div class="register-box">
			<div class="reg-slogan">登 录 中 心</div>
			  <div class="reg-form" id="js-form-mobile">

				<div class="cell">
					<!-- <label for="js-mobile_ipt">用户名</label> -->
					<input type="text" name="name" id="js-mobile_ipt" class="text" maxlength="11" placeholder="用户名"/>
				</div>
				<div class="cel2">
					<!-- <label for="js-mobile_pwd_ipt">密码</label> -->
					<input type="password" name="password" id="js-mobile_pwd_ipt" class="text"  placeholder="密码"/>
					<!-- <input type="text" name="password" id="js-mobile_pwd_ipt_txt" class="text" maxlength="20" style="display:none;" />
					<b class="icon-form ifm-view js-view-pwd" title="查看密码" style="display: none">
					查看密码</b> -->
				</div>
				<div class="user-agreement">
					<input type="checkbox" id="js-mail_chk" checked="true" name="remember"/> 记住密码
					<a href="/register" target="_blank" style="float: right; display: block; color:#333; ">没有账号？ <font style="color:#10a9ef;"> 快去注册</font></a>
				</div>
				<!-- !短信验证码 -->
				<!--<div class="cell vcode">-->
					<!--<label for="js-mobile_vcode_ipt">输入验证码</label>-->
					<!--<input type="text" name="code" id="js-mobile_vcode_ipt" class="text" maxlength="6" />-->
					<!--<a href="javascript:;" id="js-get_mobile_vcode" class="button btn-disabled">-->
					<!--免费获取验证码</a> -->
				<!--</div>-->
				<div class="bottom">
					<a id="js-mobile_btn" href="javascript:;" class="button btn-green">
					立即登录</a></div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	// FancyForm.setup();
    $("#js-mobile_btn").click(function(){
        var name = $("input[name='name']").val()
        var password = $("input[name='password']").val()
        var remember = $("input[name='remember']").is(':checked')
        if (name=='') {
            layer.msg('请填写用户名')
            return
        }
        if (password=='') {
            layer.msg('请填写密码')
            return
        }
		layer.load()
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
	             layer.closeAll('loading')
				 if (!data.status) {
	                 layer.msg(data.data)
	             } else {
	                 window.location.href = "/load";
	             }
	         },
	         error:function(e) {
	             console.log(e)
	         }
	    });
    });
});

</script>
<!-- 代码 结束 -->


</body>
</html>
