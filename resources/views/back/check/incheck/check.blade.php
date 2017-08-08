<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!-- <link rel="stylesheet" href="{{env('APP_URL')}}/js/fuelux/fuelux.css" type="text/css" cache="false" /> -->

<div class="panel-group m-b" id="accordion2">
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"><div class="panel-heading" style="background-color: #F5F5F5;"> 申请资料 </div></a>
    <div id="collapseOne" class="panel-collapse in">
        <div class="wrapper">
              <div>
                <p><small class="text-uc text-xs text-muted">入金信息</small></p>
                <p>账号：{{$record->userName or '未知'}}</p>
                <p>入金方式：{{$record->wayZh or '未知'}}</p>
                <p>金额：{{$record->amount or '未知'}}</p>
                <div class="line"></div>
                <p><small class="text-uc text-xs text-muted">银行卡信息</small></p>
                <p>银行：{{$record->bankName or '未知'}}</p>
                <p>账户：{{$account->account_name or '未知'}},{{$record->bankno or '未知'}}</p>
                <p>币种：{{$account->account_currency or '未知'}}</p>
                <p>支行：{{$account->account_city or '未知'}},{{$account->account_branch or '未知'}}</p>
                <div class="line"></div>
                <p><small class="text-uc text-xs text-muted">备注</small></p>
                <p>说明：{{$record->note or '无'}}</p>
              </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo"><div class="panel-heading" style="background-color: #F5F5F5;"> 银行卡照片 </div></a>
    <div id="collapseTwo" class="panel-collapse collapse">
        <div class="well m-t">
          <div class="row">
            <div class="col-xs-6"> <strong>正面:</strong>
              <img src="{{$account->frontimg or '/images/default.png'}}" width="500" height="170"/>
            </div>
            <div class="col-xs-6"> <strong>反面:</strong>
              <img src="{{$account->backimg  or '/images/default.png'}}" width="500" height="170"/>
            </div>
          </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree"><div class="panel-heading" style="background-color: #F5F5F5;"> 审核入金 </div></a>
    <div id="collapseThree" class="panel-collapse collapse">
        <div class="wrapper">
              <div>
                <p>审核结果：
                <label><input type="radio" class="active_rs" name="status" value="2"> 不通过 </label>
                <label><input type="radio" class="active_rs" name="status" value="1" checked> 通过 </label>
                </p>
                <span id="reason" style="display:none">
                <div class="line"></div>
                <p>驳回原因：<textarea class="form-control" name="fail_reason" id="fail_reason"></textarea></p>
                </span>
                <button type="submit" id="submit" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs"><strong>提交</strong></button>
              </div>
        </div>
    </div>
  </div>
</div>

<script src="{{env('APP_URL')}}/js/back/app.v2.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
<script src="{{env('APP_URL')}}/js/layer/layer.js"></script>
<!-- <script src="{{env('APP_URL')}}/js/fuelux/fuelux.js" cache="false"></script> -->
<script>
const rid = {{$record->id}}
$(function () {
    $(".active_rs").click(function(){
        let val = $(this).val()
        if (val == 2) {
            $("#reason").show()
        } else {
            $("#reason").hide()
        }
    })
    $("#submit").click(function(){
        let val = $("input[name=status]:checked").val()
        let reason = $("#fail_reason").val()
        layer.load()
        fetch('/back/incheck/check/' + rid, {
            method: 'put',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            credentials: 'include',
            body: "status=" + val + "&reason=" + reason
        }).then(function(response){
            layer.closeAll('loading')
            return response.json()
        }).then(function(data){
            if (data.status) {
                layer.msg(data.data)
                window.parent.window.history.go(0);
            } else {
                layer.msg(data.data)
            }
        })
    })
})
</script>
