@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="hongtiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="hong">盈利产品</span><br />
            <span class="hongying">Profit product</span></td>
          <td width="578" align="right" valign="middle">&nbsp;</td>
        </tr>
      </table>

        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="508" height="343" align="center" valign="top"><table width="1080" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="328" align="center" valign="middle" ><div id="chart" style="width: 984px;height:322px;"></div></td>
                </tr>
              </table>
              <table width="1080"  height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="19"></td>
                </tr>
              </table>
              <table width="1080" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  background="{{env('APP_URL')}}/images/yingli.jpg">
                <tr>
                <td width="206" height="36" align="center" valign="middle" class="baitext"><strong>产品</strong></td>
                <td width="299" align="center" valign="middle" class="baitext"> <strong> 盈</strong></td>
                <td width="305" align="center" valign="middle" class="baitext"><strong>亏损</strong></td>
                <td width="270" align="center" valign="middle" class="baitext"><strong>综合盈利</strong></td>
                </tr>
            </table>
            @foreach($obs as $ob)
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogedihong" id="52" c="c">
                <tr>
                  <td width="203" height="45" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$ob->symbol}}<br /></td>
                  <td width="297" align="left" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="84" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="32" align="center" class="text12">${{$ob->win}}</td>
                    </tr>
                  </table>
                    <table width="105" bordercolor="#5cb85c" border="1" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="101" height="30" align="center" class="text12">{{$ob->wtime}} 笔{{$ob->whand}} 手 </td>
                      </tr>
                    </table></td>
                  <td width="305" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="84" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="32" align="center" class="text12">${{$ob->lose or ' --'}}</td>
                    </tr>
                  </table>
                    <table width="105" bordercolor="#5cb85c" border="1" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="101" height="30" align="center" class="text12">{{$ob->ltime or ' --'}} 笔{{$ob->lhand or ' --'}} 手 </td>
                      </tr>
                    </table></td>
                  <td width="268" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="84" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="32" align="center" class="text12">${{$ob->wl}}</td>
                    </tr>
                  </table>
                    <table width="105" bordercolor="#5cb85c" border="1" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="101" height="30" align="center" class="text12">{{$ob->wltime}} 笔{{$ob->wlhand}} 手 </td>
                      </tr>
                    </table></td>
                </tr>
              </table>
            @endforeach
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogehong">
                <tr>
                  <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
            </table></td>
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
<script src="{{env('APP_URL')}}/js/echarts.common.min.js"></script>
<script type="text/javascript">
  var resouces = {!!json_encode($obs)!!};
  var myChart = echarts.init(document.getElementById('chart'));
  var objData = []
  var winData = []
  var loseData = []
  var wlData = []
  resouces.forEach(function (v) {
      objData.push(v.symbol);
      winData.push(v.win);
      loseData.push(v.lose);
      wlData.push(v.wl);
  });
  var option = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['盈利', '亏损']
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
                    data : objData
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'盈利',
                    type:'bar',
                    stack: '总量',
                    itemStyle: {
                        //通常情况下：
                        normal:{
                            color: function (params){
                                return "#3DB9DE";
                            }
                        }
                    },
                    data: winData
                },
                {
                    name:'亏损',
                    type:'bar',
                    stack: '总量',
                    itemStyle: {
                        //通常情况下：
                        normal:{
                            color: function (params){
                                return "#5CB85C";
                            }
                        }
                    },
                    data: loseData
                },
                // {
                //     name:'综合',
                //     type:'bar',
                //     label: {
                //         normal: {
                //             show: true
                //         }
                //     },
                //     data: wlData
                // }
            ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
@include('part.footer')
