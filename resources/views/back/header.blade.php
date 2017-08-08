<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>后台管理</title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- <link href="{{env('APP_URL')}}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet"> -->
<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<link href="{{env('APP_URL')}}/css/fileinput.css" rel="stylesheet">
</head>
<body>
<section class="vbox">
<header class="bg-dark dk header navbar navbar-fixed-top-xs">
  <div class="navbar-header aside-md"> <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav"> <i class="fa fa-bars"></i> </a> <a href="#" class="navbar-brand" data-toggle="fullscreen"><!--<img src="{{env('APP_URL')}}/images/logo.jpg" class="m-r-sm">-->{{$setting->name}}</a> <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user"> <i class="fa fa-cog"></i> </a> </div>
  <ul class="nav navbar-nav hidden-xs">
    <!-- <li class="dropdown"> <a href="#" class="dropdown-toggle dker" data-toggle="dropdown"> <i class="fa fa-building-o"></i> <span class="font-bold">用户</span> </a>
      <section class="dropdown-menu aside-xl on animated fadeInLeft no-borders lt">
        <div class="wrapper lter m-t-n-xs"> <a href="#" class="thumb pull-left m-r"> <img src="{{env('APP_URL')}}/images/avatar.jpg" class="img-circle"> </a>
          <div class="clear"> <a href="#"><span class="text-white font-bold">@Mike Mcalidek</a></span> <small class="block">Art Director</small> <a href="#" class="btn btn-xs btn-success m-t-xs">Back</a> </div>
        </div>
        <div class="row m-l-none m-r-none m-b-n-xs text-center">
          <div class="col-xs-4">
            <div class="padder-v"> <span class="m-b-xs h4 block text-white">245</span> <small class="text-muted">Followers</small> </div>
          </div>
          <div class="col-xs-4 dk">
            <div class="padder-v"> <span class="m-b-xs h4 block text-white">55</span> <small class="text-muted">Likes</small> </div>
          </div>
          <div class="col-xs-4">
            <div class="padder-v"> <span class="m-b-xs h4 block text-white">2,035</span> <small class="text-muted">Photos</small> </div>
          </div>
        </div>
      </section>
    </li> -->
    <li>
      <div class="m-t m-l"> <a href="javascript:history.go(-1)" class="dropdown-toggle btn btn-xs btn-primary" title="返回"><i class="fa fa-reply"></i></a> </div>
    </li>
  </ul>
  <ul class="nav navbar-nav navbar-right hidden-xs nav-user">
    <li class="hidden-xs"> <a href="#" class="dropdown-toggle dk" data-toggle="dropdown"> <i class="fa fa-bell"></i> <span class="badge badge-sm up bg-danger m-l-n-sm count">0</span> </a>
      <section class="dropdown-menu aside-xl">
        <section class="panel bg-white">
          <header class="panel-heading b-light bg-light"> <strong>您有 <span class="count">0</span> 条业务未审核</strong> </header>
          <div class="list-group list-group-alt animated fadeInRight">
          </div>
          <footer class="panel-footer text-sm"></footer>
        </section>
      </section>
    </li>
    @if (isset($fields_show))
    <li class="dropdown hidden-xs"> <a href="#" class="dropdown-toggle dker" data-toggle="dropdown"><i class="fa fa-fw fa-search"></i></a>
      <section class="dropdown-menu aside-xl animated fadeInUp">
        <section class="panel bg-white" style="padding:5px;padding-bottom: 0px;">
          <form role="form" action="{{action($controller . '@index',[$matrix_id])}}">
            @foreach ($fields_show as $field => $field_info)
              @if (isset($field_info['search']))
              <div class="form-group">
                <input type="text" name="{{$field}}" class="form-control" placeholder="按{{$field_info['show']}}搜索">
              </div>
                @endif
             @endforeach
             <div class="form-group">
                <button style="margin-left: 119px;" type="submit" class="btn btn-info">搜索</button>
             </div>
          </form>
        </section>
      </section>
    </li>
    @endif
    <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> {{Auth::user()->name}} <b class="caret"></b> </a>
      <ul class="dropdown-menu animated fadeInRight">
        <span class="arrow top"></span>
        <li> <a href="/back/mix/0/setting/1/edit">系统设置</a> </li>
        <li> <a href="/back/home/help">帮助</a> </li>
        <li class="divider"></li>
        <li> <a href="/back/home/logout">退出</a> </li>
      </ul>
    </li>
  </ul>
</header>
