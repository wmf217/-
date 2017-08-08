<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!-- <link rel="stylesheet" href="{{env('APP_URL')}}/js/fuelux/fuelux.css" type="text/css" cache="false" /> -->

<div class="panel-group m-b" id="accordion2">
  <div class="panel panel-default">
    <div class="panel-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"> 申请资料 </a> </div>
    <div id="collapseOne" class="panel-collapse in">
        <div class="wrapper">
          <div>
            <p>账号：{{$cinget->userName or '未知'}}</p>
            <p>备注：{{$cinget->detail or '无'}}</p>
            <p>申请时间：{{$cinget->created_at or '无'}}</p>
          </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo"> 佣金来源 </a> </div>
    <div id="collapseTwo" class="panel-collapse collapse">
        <section class="panel panel-default">
          <section class="panel-body slim-scroll" data-height="230px">
              @foreach($commissions as $commission)
                <article class="media">
                  <div class="media-body">
                    <div class="pull-right media-xs text-center text-muted"> <strong class="h4">12:18</strong><br>
                      <small class="label bg-light">pm</small>
                     </div>
                    <a href="#" class="h4"><i class="fa fa-user"></i>{{$commission->fromName}}</a> <small class="block"><a href="#" class="">order: {{$commission->order->orderno}}</a> <span class="label label-success">{{$commission->order->object->body_name_english}}</span></small>
                    <small class="block m-t-sm">开仓价：{{$commission->order->openprice}}，平仓价：{{$commission->order->closeprice}}，盈利：{{$commission->order->profit}}</small>
                   </div>
                </article>
                <div class="line pull-in"></div>
              @endforeach
          </section>
        </section>
    </div>
  </div>
</div>

<script src="{{env('APP_URL')}}/js/back/app.v2.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
<!-- <script src="{{env('APP_URL')}}/js/fuelux/fuelux.js" cache="false"></script> -->
