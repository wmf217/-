@include('part.header')
<div class="zhong"><table width="1100" background="images/zhanghu.jpg"  height="154"border="0" align="center" cellpadding="0" cellspacing="1">
  <tr>
    <td align="center" valign="top"><table width="1100" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="142" height="119"><img src="images/in1.jpg" width="115" height="99" /></td>
        <td width="167" align="center"><span class="text16">账户信息</span><br />
          <span class="juying">Account Information</span></td>
        <td width="209" align="left" class="text12">组：{{$user->group}}<br />
          {{$user->name}}</td>
        <td width="290" align="left" class="text12">余额:<span class="hong">${{$user->balance or ' ---'}}</span><br />
          可用金:<span class="lu">${{$user->vailable}}</span></td>
        <td width="292" align="left" class="text12">地址:<span class="lan">{{$user->address or ' ---'}}</span><br />
          信用:<strong>{{$user->credit}}</strong></td>
        </tr>
    </table></td>
  </tr>
</table>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="12"></td>
    </tr>
  </table>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="545" height="384" valign="top" background="images/q1.jpg"><table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="174" align="center"><a href="{{env('APP_URL')}}/order/history"><img src="images/in2.jpg" width="177" height="174" /></a></td>
        </tr>
      </table>
        <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="72" align="left" class="text12">交易<strong> <span class="ohc"></span> </strong>笔　<strong><span class="ohh">0</span> </strong>手　挂单 <strong><span id="ohhg">0</span> 笔</strong><br />
            交易盈亏<span class="hong"> $<span id="ohp">0</span></span></td>
          </tr>
      </table>
        <table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="167" height="34" align="center" class="baitext">入金</td>
            <td width="179" align="left" class="baitext"><strong>$<span id="ohop">0</span></strong></td>
            <td width="194" align="left" class="baitext"> 元</td>
          </tr>
      </table>
        <table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="167" height="34" align="center" class="baitext">出金</td>
            <td width="179" align="left" class="baitext"><strong>$<span id="ohcp">0</span></strong></td>
            <td width="194" align="left" class="baitext"> 元</td>
          </tr>
      </table>
        <table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="167" height="34" align="center" class="baitext">信用 </td>
            <td width="179" align="left" class="baitext"><strong><span id="ohct">0</span></strong></td>
            <td width="194" align="left" class="baitext"> 笔</td>
          </tr>
      </table>
        <table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="167" height="34" align="center" class="baitext">交易</td>
            <td width="179" align="left" class="baitext"><strong><span class="ohc"></span></strong></td>
            <td width="194" align="left" class="baitext"> 笔</td>
          </tr>
      </table></td>
      <td width="10"></td>
      <td width="545" align="center" valign="top" background="images/q2.jpg"><table width="540" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="174" align="center"><a href="{{env('APP_URL')}}/order/hold"><img src="images/in3.jpg" width="171" height="171" /></a></td>
        </tr>
      </table>
        <table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="72" align="left" class="text12">交易中 <strong><span id="odc">0</span></strong> 笔　<strong><span id="odh">0</span> </strong>手　盈亏 <span class="hong">$<span id="odp">0</span></span><br />
            </td>
          </tr>
      </table>
        <!-- hold -->
        <span id="odos"></span>
       </td>
    </tr>
  </table>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="12"></td>
    </tr>
  </table>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="545" height="384" valign="top" >
        <table width="545" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="35" align="left" class="biao14" background="images/biao2.jpg">TC 技术分析</td>
          </tr>
        </table>
        <table width="545" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="35" align="left" valign="top" background="images/biao2.jpg" ><table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
              <tr>
                <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
              </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0" class="text12g">
                <tr>
                  <td height="30">·恒生指数 短线: 在23440之上，看涨。                                            2017-03-17 08:01:00</td>
                </tr>
            </table></td>
          </tr>
        </table>
     </td>
      <td width="10"></td>
      <td width="545" align="center" valign="top">
        <table width="545" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="35" align="left" class="biao14" background="images/biao2.jpg">产品总计</td>
          </tr>
        </table>
        <table width="545" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="35" align="left" valign="top" background="images/biao2.jpg" ><table width="530" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="224" height="38" align="left" valign="bottom">
                    <a href="/order/history"><button type="button" class="btn btn-warning">历史订单</button></a>
                </td>
                <td width="103" valign="bottom">&nbsp;</td>
                <td width="203" align="right" valign="bottom"></td>
              </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="62" class="text12">交易笔数：<span class="ohc">0</span> 笔　<span class="ohh">0</span> 手&emsp;&emsp;更新时间：{{date('Y-m-d H:i:s')}}</td>
                </tr>
            </table>
              <table width="530" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="162" class="text12">
                      <div id="objects" style="width:482px;height:209px;"></div>
                  </td>
                </tr>
                </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>
<script src="{{env('APP_URL')}}/js/echarts.common.min.js"></script>
<script>
var uname = {{Auth::user()->name}}
$(document).ready(function(){
    objects()
    history()
    hold()
    // objects()
    // history()
    // hold()
})
function history () {
    // fetch('/home/history-pre',{
    //     credentials: 'include'
    // }).then(function(res){
    //     return res.json()
    // }).then(function(data){
    //     // console.log(data)
    //     $("#ohcp").html(data.closeprice);
    //     $(".ohc").html(data.count);
    //     $("#ohct").html(data.credit);
    //     $(".ohh").html(data.hand.toFixed(2));
    //     $("#ohhg").html(data.hang);
    //     $("#ohop").html(data.openprice);
    //     $("#ohp").html(data.profit);
    // })
    $.ajax({
        type: 'get',
        url: '/home/history-pre',
        success: function (data) {
            $("#ohcp").html(data.closeprice);
            $(".ohc").html(data.count);
            $("#ohct").html(data.credit);
            $(".ohh").html(data.hand.toFixed(2));
            $("#ohhg").html(data.hang);
            $("#ohop").html(data.openprice);
            $("#ohp").html(data.profit);
        },
        error : function() {
            layer.msg('未启用mt4数据同步')
        }
    });
}

function hold () {
    // fetch('/home/hold-pre',{
    //     credentials: 'include'
    // }).then(function(res){
    //     return res.json()
    // }).then(function(data){
    //     $("#odc").html(data.count);
    //     $("#odh").html(data.hand);
    //     $("#odp").html(data.profit);
    //     data.orders.forEach(function (_ref) {
    //         var symbol = _ref.symbol;
    //         var openprice = _ref.openprice;
    //         var profit = _ref.profit;
    //
    //         var str = '<table width="540" border="0" align="center" cellpadding="0" cellspacing="0"><tr>' + '<td width="167" height="34" align="center" class="baitext">' + symbol + '</td>' + '<td width="179" align="left" class="baitext"><strong>$' + openprice + '</strong></td>' + '<td width="194" align="left" class="baitext">$' + profit + '</td></tr></table>';
    //         $("#odos").append(str);
    //     });
    //     // data.orders.forEach(({symbol,openprice,profit}) => {
    //     //     var str = '<table width="540" border="0" align="center" cellpadding="0" cellspacing="0"><tr>'
    //     //             + '<td width="167" height="34" align="center" class="baitext">'+symbol+'</td>'
    //     //             + '<td width="179" align="left" class="baitext"><strong>$'+openprice+'</strong></td>'
    //     //             + '<td width="194" align="left" class="baitext">$'+profit+'</td></tr></table>'
    //     //     $("#odos").append(str)
    //     // })
    // })

    $.ajax({
        type: 'get',
        url: '/home/hold-pre',
        success: function (data) {
            $("#odc").html(data.count);
            $("#odh").html(data.hand);
            $("#odp").html(data.profit);
            data.orders.forEach(function (_ref) {
                var symbol = _ref.symbol;
                var openprice = _ref.openprice;
                var profit = _ref.profit;

                var str = '<table width="540" border="0" align="center" cellpadding="0" cellspacing="0"><tr>' + '<td width="167" height="34" align="center" class="baitext">' + symbol + '</td>' + '<td width="179" align="left" class="baitext"><strong>$' + openprice + '</strong></td>' + '<td width="194" align="left" class="baitext">$' + profit + '</td></tr></table>';
                $("#odos").append(str);
            });
        },
        error : function() {
            layer.msg('未启用mt4数据同步')
        }
    });
}
function objects () {
    // fetch('/api/object?name=' + uname,{
    //     credentials: 'include'
    // }).then(function(res){
    //     return res.json()
    // }).then(function(data){
    //     if (data.status) {
    //         var the = data.data
    //         chartObject(the.objects, the.oNum)
    //     } else {
    //         layer.msg(data.data)
    //     }
    // })
    $.ajax({
        type: 'get',
        url: '/api/object?name=' + uname,
        success: function (data) {
            if (data.status) {
                var the = data.data
                chartObject(the.objects, the.oNum)
            } else {
                layer.msg(data.data)
            }
        },
        error : function() {
            layer.msg('异常')
        }
    });
}
function chartObject($objects, $oNum) {
    var objectChart = echarts.init(document.getElementById('objects'));
    option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : $objects,
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'订单总数',
                type:'bar',
                barWidth: '60%',
                data:$oNum
            }
        ]
    };
    objectChart.setOption(option);
}
</script>
@include('part.footer')
