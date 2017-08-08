@include('back.header')
<link href="{{env('APP_URL')}}/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" />
<section id="content">
   <section class="hbox stretch">
    <!-- .aside -->
      @include('back.aside')
      <!-- /.aside -->
      <section class="panel panel-default">
          <header class="panel-heading"> <span class="label bg-danger pull-right">4 left</span> Tasks </header>
          <table class="table table-striped m-b-none text-sm">
            <thead>
              <tr>
                <th>Progress</th>
                <th>Item</th>
                <th width="70"></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><div class="progress progress-sm progress-striped active m-t-xs m-b-none">
                    <div class="progress-bar progress-bar-success" data-toggle="tooltip" data-original-title="80%" style="width: 80%"></div>
                  </div></td>
                <td>App prototype design</td>
                <td class="text-right"><div class="btn-group"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
                    <ul class="dropdown-menu pull-right">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                    </ul>
                  </div></td>
              </tr>
              <tr>
                <td><div class="progress progress-xs m-t-xs m-b-none">
                    <div class="progress-bar progress-bar-info" data-toggle="tooltip" data-original-title="40%" style="width: 40%"></div>
                  </div></td>
                <td>Design documents</td>
                <td class="text-right"><div class="btn-group"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
                    <ul class="dropdown-menu pull-right">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                    </ul>
                  </div></td>
              </tr>
              <tr>
                <td><div class="progress progress-xs m-t-xs m-b-none">
                    <div class="progress-bar progress-bar-warning" data-toggle="tooltip" data-original-title="20%" style="width: 20%"></div>
                  </div></td>
                <td>UI toolkit</td>
                <td class="text-right"><div class="btn-group"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
                    <ul class="dropdown-menu pull-right">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                    </ul>
                  </div></td>
              </tr>
              <tr>
                <td><div class="progress progress-xs m-t-xs m-b-none">
                    <div class="progress-bar progress-bar-danger" data-toggle="tooltip" data-original-title="15%" style="width: 15%"></div>
                  </div></td>
                <td>Testing</td>
                <td class="text-right"><div class="btn-group"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-pencil"></i></a>
                    <ul class="dropdown-menu pull-right">
                      <li><a href="#">Action</a></li>
                      <li><a href="#">Another action</a></li>
                      <li><a href="#">Something else here</a></li>
                      <li class="divider"></li>
                      <li><a href="#">Separated link</a></li>
                    </ul>
                  </div></td>
              </tr>
            </tbody>
          </table>
        </section>
        <a href="#" id="username" data-type="text" data-title="用户名">用户名</a>
   </section>
 </section>
 @include('back.footer')
 <script src="{{env('APP_URL')}}/bootstrap3-editable/js/bootstrap-editable.js"></script>
 <script>
 $(function () {
     $('#username').editable();
 });
 </script>
