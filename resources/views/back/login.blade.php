<!DOCTYPE html>
<html lang="en" class="bg-dark">
<head>
<meta charset="utf-8" />
<title>MT4 | admin</title>
<meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!--[if lt IE 9]> <script src="js/ie/html5shiv.js" cache="false"></script> <script src="js/ie/respond.min.js" cache="false"></script> <script src="js/ie/excanvas.js" cache="false"></script> <![endif]-->
</head>
<body>
<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
  <div class="container aside-xxl"> <a class="navbar-brand block" href="index.html">MT4.admin</a>
    <section class="panel panel-default bg-white m-t-lg">
      <header class="panel-heading text-center"> <strong>login</strong> </header>
      <form action="/back/login" method="post" class="panel-body wrapper-lg">
        <div class="form-group">
          <label class="control-label">name</label>
          <input name="name" placeholder="admin" class="form-control input-lg">
        </div>
        <div class="form-group">
          <label class="control-label">Password</label>
          <input type="password" name="password" id="inputPassword" placeholder="Password" class="form-control input-lg">
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="remember">
             记住我</label>
        </div>
        <button type="submit" class="btn btn-primary">登陆</button>
      </form>
    </section>
  </div>
</section>
<!-- footer -->
<footer id="footer">
  <div class="text-center padder">
    <p> <small>Web app framework base on Bootstrap<br>
      &copy; 2013</small> </p>
  </div>
</footer>
<!-- / footer --> <script src="{{env('APP_URL')}}/js/back/app.v2.js"></script> <!-- Bootstrap --> <!-- App -->
</body>
</html>
