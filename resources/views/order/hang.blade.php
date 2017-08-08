@include('part.header')
<!-- <link href="{{env('APP_URL')}}/css/jquery.dataTables.min.css" rel="stylesheet"> -->
<link href="{{env('APP_URL')}}/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="{{env('APP_URL')}}/css/front/history.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="{{env('APP_URL')}}/css/tcal.css" />
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lantiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lan14">挂单历史</span><br/>
            <span class="lanying">hang history</span></td>
          <td width="578" align="right" valign="middle">
              <div class="btn-group">
                @foreach(config('constants.HANGFLAG') as $k => $v)
                <button type="button" class="btn btn-default flag" data-flag="{{$k}}">{{$v}}</button>
                @endforeach
                <button type="button" class="btn btn-default choosebtn flag" data-flag="-1">全部</button>
              </div>
          </td>
        </tr>
      </table>

        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="508" height="343" align="center" valign="top">
            <form id="search" role="form">
                <fieldset>
                <table width="1080" border="0" cellspacing="0" cellpadding="0">

                  <tr>
                    <td width="481" height="43">
                      <div class="col-lg-2"><label class="control-label">产品<label></div>
                      <div class="col-lg-5">
                          <input name="objectname" class="form-control" type="text" id="objectname" />
                      </div>
                    </td>
                    <td width="689" >
                      <div class="col-lg-2"><label class="control-label">盈亏范围<label></div>
                      <div class="col-lg-4">
                          <input name="wlfrom" type="number" class="form-control" type="text" id="wlfrom" class="myfloat"/>
                      </div>
                      <div style="float:left">至</div>
                      <div class="col-lg-4">
                          <input name="wlto" type="number" class="form-control" style="float:left" type="text" id="wlto" class="myfloat"/>
                      </div>
                    </td>
                  </tr>
                </table>
                <table width="1080" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="481" height="43">
                      <div class="col-lg-2"><label class="control-label">开仓<label></div>
                      <div class="col-lg-5">
                          <input name="openfrom" type="text" class="tcal form-control" readonly id="openfrom" />
                      </div>
                      <!-- <div style="float:left">-</div> -->
                      <div class="col-lg-5">
                          <input name="opento" type="text" class="tcal form-control" readonly id="opento" />
                      </div>
                  </td>
                  <td width="689" >
                    <div class="col-lg-2"><label class="control-label">平仓<label></div>
                    <div class="col-lg-4">
                        <input name="closefrom" type="text" class="tcal form-control" readonly id="closefrom" />
                    </div>
                    <div style="float:left">至</div>
                    <div class="col-lg-4">
                        <input name="closeto" type="text" class="tcal form-control" readonly id="closeto" />
                    </div>
                </td>
                </tr>
                </table>
                <button type="button" onclick="refresh(true)" class="btn btn-primary" style="float:left;margin-left:10px;">搜索</button>
                </fieldset>
              </form>
              <table width="1080"  height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="19"></td>
                </tr>
              </table>
              <!--todo table-->
              <table id="table" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="title">订单</th>
                    <th class="title">交易类型</th>
                    <th class="title">成交量</th>
                    <th class="title">开仓</th>
                    <th class="title">平仓</th>
                    <th class="title">止损|止盈</th>
                    <th class="title">盈亏</th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
              </table>
            </td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr></tr>
    <tr>
      <td height="12"></td>
    </tr>
  </table>
</div>
<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="{{env('APP_URL')}}/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="{{env('APP_URL')}}/js/tcal.js"></script>
<script>
var login = {{Auth::user()->name}}
var cmd = -1
$(document).ready(function(){
    //date
    $(".myfloat").on("blur",function(){ $(this).val(parseFloat($(this).val()).toFixed(2));});
    refresh(true);
    // setInterval(refresh,1000*30);
    $(".flag").click(function(){
        cmd = $(this).data('flag')
        $(this).addClass('choosebtn').siblings().removeClass('choosebtn')
        refresh(true)
    })
})
function refresh() {
    var processing = arguments.length <= 0 || arguments[0] === undefined ? false : arguments[0];
    var objectname = $("#objectname").val()
    var wlfrom = $("#wlfrom").val()
    var wlto = $("#wlto").val()
    var openfrom = $("#openfrom").val()
    var opento = $("#opento").val()
    var closefrom = $("#closefrom").val()
    var closeto = $("#closeto").val()
    // table
    $('#table').DataTable($.extend(dataTableSetting(),{
        "sAjaxSource": "/order/api/api_hang?name=" + login
        + '&objectname=' + objectname
        + '&wlfrom=' + wlfrom
        + '&wlto=' + wlto
        + '&openfrom=' + openfrom
        + '&opento=' + opento
        + '&closefrom=' + closefrom
        + '&closeto=' + closeto
        + '&cmd=' + cmd
        ,
        "lengthChange": false,
        "searching": false, //是否开启搜索
        "info": false,
        "processing": processing,
        "destroy": true,
        "columns": [
            {data: 'order'},
            // <span class="label label-success">成功标签</span>
            {'render': function (data, type, row){
                    var str = '<button class="btn btn-default" type="button">' + row.symbol + '</button>'
                    var flagType = row.flag=='买入'?'success':'danger'
                    str += '<button style="margin-left:3px;" class="btn btn-'+flagType+'" type="button">' + row.flag + '</button>'
                    return str
                }
		    },
            {data: 'volume'},
            {'render': function (data, type, row){
                    return '<button class="btn btn-default" type="button">'+formatDate(row.opentime)+'<span class="badge">$'+row.openprice+'</span></button>'
                }
		    },
            {'render': function (data, type, row){
                    return '<button class="btn btn-default" type="button">'+formatDate(row.closetime)+'<span class="badge">$'+row.closeprice+'</span></button>'
                }
		    },
            {'render': function (data, type, row){
                    var loseprice = row.loseprice?row.loseprice:'--'
                    var winprice = row.winprice?row.winprice:'--'
                    return loseprice + '|' + winprice
                }
		    },
            {'render': function (data, type, row){
                    var profiType = row.profit > 0?'lutext12':'hongtext12'
                    return '<span class="'+profiType+'"><strong>'+row.profit+'</strong></span>'
                }
		    }
        ]
    }));
}
</script>
@include('part.footer')
