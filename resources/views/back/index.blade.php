@include('back.header')
  <section>
    <section class="hbox stretch">
    <!-- .aside -->
      @include('back.aside')
      <!-- /.aside -->
      <section id="content">
          <section class="vbox">
          <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
              <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
              <li class="active">监控台</li>
            </ul>
            <div class="m-b-md">
              <h3 class="m-b-none">数据监控</h3>
              <small>欢迎回来, Noteman</small> </div>
            <section class="panel panel-default">
              <div class="row m-l-none m-r-none bg-light lter">
                <div class="col-sm-6 col-md-3 padder-v b-r b-light lt">
                    <span class="fa-stack fa-2x pull-left m-r-sm">
                        <i class="fa fa-circle fa-stack-2x text-warning"></i>
                        <i class="fa fa-male fa-stack-1x text-white"></i>
                    <span class="easypiechart pos-abt" data-percent="0" data-line-width="4" data-track-Color="#fff" data-scale-Color="false" data-size="50" data-line-cap='butt' data-animate="2000" data-target="#uCount" data-update="3000"></span>
                   </span>
                   <a class="clear" href="#"> <span class="h3 block m-t-xs">
                        <strong id="uCount">0</strong></span> <small class="text-muted text-uc">用户总数</small>
                    </a>
                </div>
                <div class="col-sm-6 col-md-3 padder-v b-r b-light">
                    <span class="fa-stack fa-2x pull-left m-r-sm"> <i class="fa fa-circle fa-stack-2x text-info"></i> <i class="fa fa-cny fa-stack-1x text-white"></i> </span> <a class="clear" href="#"> <span class="h3 block m-t-xs"><strong id="netSum">0</strong></span> <small class="text-muted text-uc">净入金总量</small> </a> </div>
                <div class="col-sm-6 col-md-3 padder-v b-r b-light"> <span class="fa-stack fa-2x pull-left m-r-sm"> <i class="fa fa-circle fa-stack-2x text-danger"></i>
                    <i class="fa fa-money fa-stack-1x text-white"></i>
                    <span class="easypiechart pos-abt" data-percent="0" data-line-width="4" data-track-Color="#f5f5f5" data-scale-Color="false" data-size="50" data-line-cap='butt' data-animate="3000" data-target="#oCount" data-update="5000"></span> </span>
                    <a class="clear" href="#"> <span class="h3 block m-t-xs">
                        <strong id="oCount">0</strong></span> <small class="text-muted text-uc">订单总数</small> </a> </div>
                <div class="col-sm-6 col-md-3 padder-v b-r b-light lt"> <span class="fa-stack fa-2x pull-left m-r-sm"> <i class="fa fa-circle fa-stack-2x icon-muted"></i> <i class="fa fa-clock-o fa-stack-1x text-white"></i> </span> <a class="clear" href="#"> <span class="h3 block m-t-xs">
                    <strong id="date">00:00</strong></span>
                    <small class="text-muted text-uc">更新时间</small> </a>
                </div>
              </div>
            </section>
            <div class="row">
              <div class="col-md-8">
                <section class="panel panel-default">
                  <header class="panel-heading font-bold">
                      <a href="/back/reportc/index"><span class="label bg-primary pull-right">查询</span></a>
                      近一周数据
                  </header>
                  <div class="panel-body">
                    <div id="week" style="height:300px;"></div>
                  </div>
                  <footer class="panel-footer bg-white no-padder">
                    <div class="row text-center no-gutter">
                    </div>
                  </footer>
                </section>
              </div>
              <div class="col-md-4">
                <section class="panel panel-default">
                  <header class="panel-heading font-bold">产品总计</header>
                  <div class="panel-body">
                    <div id="objects" style="height:300px;"></div>
                  </div>
                  <footer class="panel-footer bg-white no-padder">
                    <div class="row text-center no-gutter">
                    </div>
                  </footer>
                </section>
              </div>
            </div>
            <div class="row">
              <div class="col-md-8">
                <h4 class="m-t-none">代办事务</h4>
                <ul class="list-group gutter list-group-lg list-group-sp sortable" id="todo">
                </ul>
              </div>
              <div class="col-md-4">
                <section class="panel b-light">
                  <header class="panel-heading bg-primary dker no-border">
                      <a href="/back/mix/0/user"><span class="label bg-danger pull-right">查看</span></a>
                      <strong>用户排名</strong>
                  </header>
                  <div class="bg-primary m-l-n-xxs m-r-n-xxs">
                      <table class="table m-b-none text-primary">
                    <thead>
                      <tr>
                        <th class="text-warning">排名</th>
                        <th class="text-warning">用户</th>
                        <th class="text-warning">订单量</th>
                      </tr>
                    </thead>
                    <tbody id="honor">
                    </tbody>
                  </table>
                  </div>
                </section>
              </div>
            </div>
          </section>
        </section>
      </section>
<!-- <script src="{{env('APP_URL')}}/js/jquery-1.9.0.min.js"></script> -->
@include('back.footer')
<script src="{{env('APP_URL')}}/js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
<script src="{{env('APP_URL')}}/js/echarts.common.min.js"></script>
<script src="{{env('APP_URL')}}/js/back/index.js"></script>
<script>
$(document).ready(function(){
    data()
})
</script>
