<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<!-- <link rel="stylesheet" href="{{env('APP_URL')}}/js/fuelux/fuelux.css" type="text/css" cache="false" /> -->

<div class="panel-group m-b" id="accordion2">
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne"><div class="panel-heading" style="background-color: #F5F5F5;"> 申请资料 </div></a>
    <div id="collapseOne" class="panel-collapse in">
        <div class="wrapper">
                  <div class="clearfix m-b">
                    <div class="clear">
                      <div class="h3 m-t-xs m-b-xs">{{$user->firstname}}.{{$user->lastname}}</div>
                      <small class="text-muted"><i class="fa fa-map-marker"></i> {{$user->country}}, {{$user->address}}</small>
                     </div>
                  </div>
                  <!-- <div class="btn-group btn-group-justified m-b"> <span class="text"> <i class="fa fa-eye"></i> Follow </span> <span class="text-active"> <i class="fa fa-eye-slash"></i> Following </span> </a> <a class="btn btn-dark btn-rounded" data-loading-text="Connecting"> <i class="fa fa-comment-o"></i> Chat </div></a> -->
                  <div>
                    <p>英文名：{{$user->englishname or '未知'}}</p>
                    <div class="line"></div>
                    <p>证&emsp;件：{{$user->idcountry or '未知'}},{{$user->idnum or '未知'}}</p>
                    <div class="line"></div>
                    <p>手&emsp;机：{{$user->tel or '未知'}}</p>
                    <div class="line"></div>
                    <p>邮&emsp;箱：{{$user->email or '未知'}}</p>
                    <div class="line"></div>
                    <p>生&emsp;日：{{$user->fete or '未知'}}</p>
                    <div class="line"></div>
                    <p>性&emsp;别：{{$user->sex or '未知'}}</p>
                  </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo"><div class="panel-heading" style="background-color: #F5F5F5;"> 银行卡和证件 </div></a>
    <div id="collapseTwo" class="panel-collapse collapse">
        <table class="table table-striped m-b-none text-sm">
          <thead>
            <tr>
              <th>开户行</th>
              <th>支行</th>
              <th>户名</th>
              <th>账号</th>
              <th>开户城市</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{{$account->bankName or '未知'}}</td>
              <td>{{$account->account_branch or '未知'}}</td>
              <td>{{$account->account_name or '未知'}}</td>
              <td>{{$account->account_number or '未知'}}</td>
              <td><i class="fa fa-map-marker"></i>{{$account->account_city or '未知'}}</td>
            </tr>
          </tbody>
        </table>
        <div class="well m-t">
          <div class="row">
            <div class="col-xs-6"> <strong>身份证正面:</strong>
              <img src="{{$user->idfront or '/images/default.png'}}" width="600" height="200"/>
            </div>
            <div class="col-xs-6"> <strong>身份证反面:</strong>
              <img src="{{$user->idback or '/images/default.png'}}" width="600" height="200"/>
            </div>
          </div>
          <div class="row">
            <div class="col-xs-6"> <strong>银行卡正面:</strong>
              <img src="{{$account->frontimg or '/images/default.png'}}" width="600" height="200"/>
            </div>
            <div class="col-xs-6"> <strong>银行卡反面:</strong>
              <img src="{{$account->backimg or '/images/default.png'}}" width="600" height="200"/>
            </div>
          </div>
        </div>
    </div>
  </div>
  <div class="panel panel-default">
    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree"><div class="panel-heading" style="background-color: #F5F5F5;"> 审核账户 </div></a>
    <div id="collapseThree" class="panel-collapse collapse">
        <div class="wrapper">
              <div>
                <p>审核结果：
                <label><input type="radio" class="active_rs" name="active" value="0"> 不通过 </label>
                <label><input type="radio" class="active_rs" name="active" value="1" checked> 通过 </label>
                </p>
                <div class="line"></div>
                <p>账&emsp;号：{{$user->name or '未知'}}</p>
                <div class="line"></div>
                <p>MT4组：{{$user->group or '未知'}}</p>
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
const uid = {{$user->id}}
$(function () {
    $(".active_rs").click(function(){
        let val = $(this).val()
        if (val == 0) {
            $("#reason").show()
        } else {
            $("#reason").hide()
        }
    })
    $("#submit").click(function(){
        let val = $("input[name=active]:checked").val()
        let reason = $("#fail_reason").val()
        layer.load()
        fetch('/back/ucheck/check/' + uid, {
            method: 'put',
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            credentials: 'include',
            body: "active=" + val + "&reason=" + reason
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
