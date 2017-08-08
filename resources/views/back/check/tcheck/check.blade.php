<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!-- <link rel="stylesheet" href="{{env('APP_URL')}}/js/fuelux/fuelux.css" type="text/css" cache="false" /> -->

<div class="panel-group m-b" id="accordion2">
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"><div class="panel-heading" style="background-color: #F5F5F5;"> 申请资料 </div></a>
    <div id="collapseOne" class="panel-collapse in">
        <div class="wrapper">
              <div>
                <i class="fa fa-money fa fa-3x"></i>
                <h4>${{$t->amount or '未知'}}</h4>
                <div class="line"></div>
                <p><small class="text-uc text-xs text-muted">转出人信息</small></p>
                <p>全称：{{$t->fromUser->fullname or '未知'}}</p>
                <p>账号：{{$t->fromUsername or '未知'}}</p>
                <p>余额：{{$t->fromUser->balance or '未知'}}</p>
                <p>可用值：{{$t->fromUser->vailable or '未知'}}</p>
                <p>组：{{$t->fromUser->group or '未知'}}</p>
                <div class="line"></div>
                <p><small class="text-uc text-xs text-muted">转出人信息</small></p>
                <p>全称：{{$t->toUser->fullname or '未知'}}</p>
                <p>账号：{{$t->toUsername or '未知'}}</p>
                <p>组：{{$t->toUser->group or '未知'}}</p>
              </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree"><div class="panel-heading" style="background-color: #F5F5F5;"> 确认结果 </div></a>
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
const tid = {{$t->id}}
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
        fetch('/back/tcheck/check/' + tid, {
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
