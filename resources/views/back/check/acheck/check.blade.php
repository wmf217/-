<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!-- <link rel="stylesheet" href="{{env('APP_URL')}}/js/fuelux/fuelux.css" type="text/css" cache="false" /> -->

<div class="panel-group m-b" id="accordion2">
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"><div class="panel-heading" style="background-color: #F5F5F5;"> 申请资料 </div></a>
    <div id="collapseOne" class="panel-collapse in">
        <div class="wrapper">
          <div>
            <p>账号：{{$apply->userName or '未知'}}</p>
            <p>备注：{{$apply->detail or '无'}}</p>
            <p>申请时间：{{$apply->created_at or '无'}}</p>
          </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo"><div class="panel-heading" style="background-color: #F5F5F5;"> 数据统计 </div></a>
    <div id="collapseTwo" class="panel-collapse collapse">
        <div class="wrapper">
          <div>
            <p>个人交易金额：{{$apply->user->applyInfo()['total'] or '0.00'}}</p>
            <p>推荐客户注册：{{$apply->user->applyInfo()['offline'] or '0'}}</p>
            <p>直推客户总入金量（净值）：{{$apply->user->applyInfo()['offlineNet'] or '0.00'}}</p>
            <p>直接客户总交易量：{{$apply->user->applyInfo()['offlineTotal'] or '0.00'}}</p>
          </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree"><div class="panel-heading" style="background-color: #F5F5F5;"> 审核 </div></a>
    <div id="collapseThree" class="panel-collapse collapse">
        <div class="wrapper">
              <div>
                <p>审核结果：
                <label><input type="radio" class="active_rs" name="status" value="2"> 不通过 </label>
                <label><input type="radio" class="active_rs" name="status" value="1" checked> 通过 </label>
                </p>
                <span id="honor_span">
                <div class="line"></div>
                <p>
                    资质评定：
                    <div class="row col-lg-4">
                    <select style="margin-bottom: 10px;" class="form-control" id="honor" name="honor">
                        @foreach($honors as $honor)
                            <<option value="{{$honor->id}}">{{$honor->name}}</option>
                        @endforeach
                    </select>
                    </div>
                </p>
                </span>
                <span id="reason_span" style="display:none">
                <div class="line"></div>
                <p>驳回原因：<textarea class="form-control" name="reason" id="reason"></textarea></p>
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
const aid = {{$apply->id}}
$(function () {
    $(".active_rs").click(function(){
        let val = $(this).val()
        if (val == 2) {
            $("#honor_span").hide()
            $("#reason_span").show()
        } else {
            $("#reason_span").hide()
            $("#honor_span").show()
        }
    })
    $("#submit").click(function(){
        let val = $("input[name=status]:checked").val()
        let reason = $("#reason").val()
        let honor = $("#honor").val()
        layer.load()
        fetch('/back/acheck/check/' + aid, {
            method: 'put',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            credentials: 'include',
            body: "status=" + val + "&reason=" + reason + "&honor=" + honor
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
