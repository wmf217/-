<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<link href="{{env('APP_URL')}}/css/jquery.dataTables.min.css" rel="stylesheet">
<section class="vbox">
      <header class="header bg-light bg-gradient">
        <ul class="nav nav-tabs nav-white">
          <li class="active"><a href="#activity" data-toggle="tab">账户资料</a></li>
          <li class=""><a href="#events" data-toggle="tab">出入金</a></li>
          <li class=""><a href="#interaction" data-toggle="tab">订单</a></li>
          <li class=""><a href="#rest" data-toggle="tab">挂单</a></li>
          <!-- <li class=""><a href="#hold" data-toggle="tab">持仓</a></li> -->
        </ul>
      </header>
      <section class="scrollable">
        <div class="tab-content">
          <div class="tab-pane active" id="activity">
              <div class="wrapper">
                        <div class="clearfix m-b">
                          <div class="clear">
                            <div class="h3 m-t-xs m-b-xs">{{$user->firstname}}.{{$user->lastname}}</div>
                            <small class="text-muted"><i class="fa fa-map-marker"></i> {{$user->country}}, {{$user->address}}</small>
                           </div>
                        </div>
                        <div class="panel wrapper panel-success">
                          <div class="row">
                            <div class="col-xs-4"> <a href="#"> <span class="m-b-xs h4 block">{{$user->historyCount}}笔</span> <small class="text-muted">历史交易</small> </a> </div>
                            <div class="col-xs-4"> <a href="#"> <span class="m-b-xs h4 block">{{$user->historyHand}}手</span> <small class="text-muted">成交量</small> </a> </div>
                            <div class="col-xs-4"> <a href="#"> <span class="m-b-xs h4 block">${{$user->historyProfit}}</span> <small class="text-muted">盈利</small> </a> </div>
                          </div>
                        </div>
                        <!-- <div class="btn-group btn-group-justified m-b"> <span class="text"> <i class="fa fa-eye"></i> Follow </span> <span class="text-active"> <i class="fa fa-eye-slash"></i> Following </span> </a> <a class="btn btn-dark btn-rounded" data-loading-text="Connecting"> <i class="fa fa-comment-o"></i> Chat </a> </div> -->
                        <div>
                          <p><small class="text-uc text-xs text-muted">申请资料</small></p>
                          <p>英文名：{{$user->englishname or '未知'}}</p>
                          <p>证&emsp;件：{{$user->idcountry or '未知'}},{{$user->idnum}}</p>
                          <p>联&emsp;系：{{$user->tel or '未知'}},{{$user->email}}</p>
                          <div class="line"></div>
                          <p><small class="text-uc text-xs text-muted">账户信息</small></p>
                          <p>账号：{{$user->name}}&emsp;|&emsp;组：{{$user->group or '无'}}&emsp;|&emsp;代理：@if($user->is_agent)是@else否@endif</p>
                          <p class="m-t m-b">余额: <span class="label bg-danger">${{$user->balance}}</span>&emsp;|&emsp;可用: <span class="label bg-success">${{$user->vailable}}</span></p>
                          <p><small class="text-uc text-xs text-muted">身份证资料</small></p>
                          <p>
                        <!-- <div class="panel-body"> <a href="#" class="thumb pull-left m-r"> <img src="images/avatar.jpg" class="img-circle"> </a>
                          <div class="clear"> <a href="#" class="text-info">@Mike Mcalidek <i class="fa fa-twitter"></i></a> <small class="block text-muted">2,415 followers / 225 tweets</small> <a href="#" class="btn btn-xs btn-success m-t-xs">Follow</a> </div>
                        </div> -->
                            <div class="well m-t">
                              <div class="row">
                                <div class="col-xs-6"> <strong>正面:</strong>
                                  <img src="{{$user->idfront}}" width="500" height="170"/>
                                </div>
                                <div class="col-xs-6"> <strong>反面:</strong>
                                  <img src="{{$user->idback}}" width="500" height="170"/>
                                </div>
                              </div>
                            </div>
                          </p>
                        </div>
              </div>
          </div>
          <div class="tab-pane" id="events">
            <div class="text-center wrapper">
                <table class="table table-striped m-b-none" data-ride="datatables" id="accountTable">
                  <thead>
                    <tr>
                      <th>时间</th>
                      <th>订单</th>
                      <th>类型</th>
                      <th>金额</th>
                      <th>交易后余额</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
            </div>
          </div>
          <div class="tab-pane" id="interaction">
            <div class="text-center wrapper">
                <table class="table table-striped m-b-none" data-ride="datatables" id="historyTable">
                  <thead>
                    <tr>
                      <th>订单</th>
                      <th>交易类型</th>
                      <th>交易产品</th>
                      <th>成交量</th>
                      <th>平仓时间</th>
                      <th>平仓价</th>
                      <th>开仓时间</th>
                      <th>开仓价</th>
                      <th>盈利</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
            </div>
          </div>
          <div class="tab-pane" id="rest">
            <div class="text-center wrapper">
                <table class="table table-striped m-b-none" data-ride="datatables" id="restTable">
                  <thead>
                    <tr>
                      <th>订单</th>
                      <th>交易类型</th>
                      <th>交易产品</th>
                      <th>成交量</th>
                      <th>平仓时间</th>
                      <th>平仓价</th>
                      <th>开仓时间</th>
                      <th>开仓价</th>
                      <th>盈利</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
            </div>
          </div>
        </div>
    </section>
</section>
<script src="{{env('APP_URL')}}/js/back/app.v2.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
<script src="{{env('APP_URL')}}/js/layer/layer.js"></script>
<script src="{{env('APP_URL')}}/js/jquery.dataTables.min.js"></script>
<script>
$(function () {
    initAccount()
    initHistory()
    initRest()
})
function initAccount () {
    $('#accountTable').DataTable($.extend(dataTableSetting(),{
        "sAjaxSource": "/account/api?uid={{$user->id}}",
        "columns": [
            {data: 'created_at'},
            {data: 'payno'},
            {data: 'type', render:function(data,type,row){
                return (data==0)?"入金":"出金";
            }},
            {data: 'amount'},
            {data: 'gobalance'},
            // {data: 'equipmentname'}
        ]
    }));
}

function initHistory () {
    $('#historyTable').DataTable($.extend(dataTableSetting(),{
        "sAjaxSource": "/order/api/api_history?name={{$user->name}}&cmd=-1",
        "columns": [
            {data: 'order'},
            {data: 'flag'},
            {data: 'symbol'},
            {data: 'volume'},
            {data: 'opentime', render:function(data,type,row){
                return formatDate(row.opentime);
            }},
            {data: 'openprice'},
            {data: 'closetime', render:function(data,type,row){
                return formatDate(row.closetime);
            }},
            {data: 'closeprice'},
            {data: 'profit'},
        ]
    }));
}


function initRest () {
    $('#restTable').DataTable($.extend(dataTableSetting(),{
        "sAjaxSource": "/order/api/api_hang?name={{$user->name}}&cmd=-1",
        "columns": [
            {data: 'order'},
            {data: 'flag'},
            {data: 'symbol'},
            {data: 'volume'},
            {data: 'opentime'},
            {data: 'openprice'},
            {data: 'closetime'},
            {data: 'closeprice'},
            {data: 'profit'},
        ]
    }));
}
</script>
