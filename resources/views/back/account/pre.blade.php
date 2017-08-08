<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!-- <link rel="stylesheet" href="{{env('APP_URL')}}/js/fuelux/fuelux.css" type="text/css" cache="false" /> -->

<section class="vbox">
    <div class="wrapper">
          <div>
            <p><small class="text-uc text-xs text-muted">银行卡信息</small></p>
            <p>账户：{{$account->account_name or '未知'}},{{$record->bankno or '未知'}}</p>
            <p>币种：{{$account->account_currency or '未知'}}</p>
            <p>开户城市：{{$account->account_city or '未知'}}</p>
            <p>支行：{{$account->account_branch or '未知'}}</p>
          </div>
    </div>
    <div class="well m-t">
      <div class="row">
        <div class="col-xs-6"> <strong>正面:</strong>
          <img src="{{$account->frontimg}}" width="500" height="170"/>
        </div>
        <div class="col-xs-6"> <strong>反面:</strong>
          <img src="{{$account->backimg}}" width="500" height="170"/>
        </div>
      </div>
    </div>
</section>

<script src="{{env('APP_URL')}}/js/back/app.v2.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
