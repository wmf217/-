<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>后台管理</title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="{{env('APP_URL')}}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<link rel="stylesheet" href="{{env('APP_URL')}}/css/app.v2.css" type="text/css" />
<style>
    .form { width: 550px; margin: 10% auto 0; }
</style>
</head>
<body>
    <section class="vbox">
       <div class="row">
            <div class="form">
                <section class="panel panel-default">
                    <header class="panel-heading font-bold">登录</header>
                    <div class="panel-body">
                        <form role="form" action="/mix/dologin" method="post">
                            <div class="form-group">
                                <label>用户名</label>
                                <input type="text" name="name" class="form-control" placeholder="Enter username">
                            </div>
                            <div class="form-group">
                                <label>密码</label>
                                <input type="password" name="password" class="form-control" placeholder="Password">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> remember me </label>
                            </div>
                            <button type="submit" class="btn btn-sm btn-default">Submit</button>
                        </form>
                    </div>
                </section>
           </div>
       </div>
    </section>
</body>
</html>
<script src="{{env('APP_URL')}}/js/app.v2.js"></script>
<script src="{{env('APP_URL')}}/js/ztree/js/jquery.ztree.core.js"></script>
