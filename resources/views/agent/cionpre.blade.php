@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="hongtiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="hong">转账统计</span><br />
            <span class="hongying">Transfer statisticsv</span></td>
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
            <td width="508" height="343" align="center" valign="top"><table width="498" height="41" border="0" align="center" cellpadding="0" cellspacing="0" class="biaogetop">
              <tr>
                <td width="248" height="36" align="center" valign="middle" class="baitext"><strong>月 份</strong></td>
                <td width="250" align="center" valign="middle" class="baitext"> <strong>金 额</strong></td>
              </tr>
            </table>
             @forelse($commissions as $v)
              <table width="498" border="0" align="center" cellpadding="0" cellspacing="1" c="c" class="biaogedi">
                <tr>
                  <td width="247" height="35" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{date('Y-m', time($v->month))}}</td>
                  <td width="246" align="left" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="100" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center">${{$v->amount}} </td>
                    </tr>
                  </table>
                    <table width="100" border="0" align="left" cellpadding="0" cellspacing="0">
                      <tr>
                        <td align="center" bgcolor="#ffaf3f" class="baitext"><strong>{{$v->count}} 笔</strong></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
             @empty
              暂无数据
             @endforelse
              <table width="498" border="0" align="center" cellpadding="0" cellspacing="1" class="biaoge">
                <tr>
                  <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
            </table></td>
            <td width="572" align="left" valign="top"><table width="392" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="105" height="35" align="center" valign="bottom" class="text14chu">转出分析</td>
                </tr>
              </table>
              <table width="447" height="395" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="35" align="center" valign="bottom" class="text12"><div id="chart" style="width: 510px;height:377px;"></div></td>
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
  const resouces = {!!json_encode($commissions)!!};
  const myChart = echarts.init(document.getElementById('chart'));
  let mData = []
  let lData = []
  // let winData = []
  // let loseData = []
  // let wlData = []
  resouces.forEach((v) => {
     let obj = {}
     obj.name = v.month.substr(0, 7)
     obj.value = v.amount
     mData.push(obj)
     lData.push(v.month.substr(0, 7))
  })
  option = {
    legend: {
        orient: 'vertical',
        left: 'left',
        data: lData
    },
    series : [
        {
            name: '佣金分析',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data: mData,
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
  };
  myChart.setOption(option);
</script>
@include('part.footer')
