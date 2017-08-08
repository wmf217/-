<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!-- <link rel="stylesheet" href="{{env('APP_URL')}}/js/fuelux/fuelux.css" type="text/css" cache="false" /> -->

<div class="panel-group m-b" id="accordion2">
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"><div class="panel-heading" style="background-color: #F5F5F5;"> 申请资料 </div></a>
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
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo"><div class="panel-heading" style="background-color: #F5F5F5;"> 佣金来源 </div></a>
    <div id="collapseTwo" class="panel-collapse collapse">
        <section class="panel panel-default">
          <section class="panel-body slim-scroll" data-height="230px">
              @foreach($commissions as $commission)
                <article class="media">
                  <div class="media-body">
                    <div class="pull-right media-xs text-center text-muted"> <strong class="h4">12:18</strong><br>
                      <small class="label bg-light">pm</small>
                     </div>
                    <a href="#" class="h4"><i class="fa fa-user"></i>{{$commission->fromName}}</a> <small class="block"><a href="#" class="">order: {{$commission->trader->order}}</a> <span class="label label-success">{{$commission->trader->symbol}}</span></small>
                    <small class="block m-t-sm">开仓价：{{$commission->trader->openprice}}，平仓价：{{$commission->trader->closeprice}}，盈利：{{$commission->trader->profit}}</small>
                   </div>
                </article>
                <div class="line pull-in"></div>
              @endforeach
          </section>
        </section>
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
const cid = {{$cinget->id}}
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
        fetch('/back/ccheck/check/' + cid, {
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
