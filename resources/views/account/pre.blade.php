@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" @if($type) class="lutiao" @else class="jutiao" @endif>
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span @if($type) class="lu" @else class="ju" @endif>@if($type)出@else入@endif金统计</span><br />
            <span @if($type) class="luying" @else class="juying" @endif>Gold production statistics</span></td>
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
            <td width="508" height="343" align="center" valign="top">
              <table width="498" height="41" border="0" align="center" cellpadding="0" cellspacing="0" @if($type) class="biaogetoplu" @else class="biaogetopju" @endif>
              <tr>
                <td width="248" height="36" align="center" valign="middle" class="baitext"><strong>月 份</strong></td>
                <td width="250" align="center" valign="middle" class="baitext"> <strong>金 额</strong></td>
              </tr>
            </table>
              @forelse($mrecords as $record)
              <table width="498" border="0" align="center" cellpadding="0" cellspacing="1" c="c" @if($type) class="biaogedilu" @else class="biaogediju" @endif>
                <tr>
                  <td width="247" height="35" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$record->month}}</td>
                  <td width="246" align="left" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="100" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center">${{$record->sum or ' --'}} </td>
                    </tr>
                  </table>
                    <table width="100" border="0" align="left" cellpadding="0" cellspacing="0">
                      <tr>
                        <td align="center" bgcolor="#f0433d" class="baitext"><strong>{{$record->count or ' --'}} 笔</strong></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              @empty
               没有数据
              @endforelse
              <table width="498" border="0" align="center" cellpadding="0" cellspacing="1" @if($type) class="biaogelu" @else class="biaogeju" @endif>
                <tr>
                  <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
            </table></td>
            <td width="572" align="left" valign="top"><table width="392" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="105" height="35" align="center" valign="bottom" class="text14chu">@if($type)出@else入@endif金分析</td>
                </tr>
              </table>
              <table width="392" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="105" height="28" align="center" valign="bottom" class="text12">From 12/2015 To 02/2017 Withdrawals case</td>
                </tr>
              </table>
              <table width="447" height="395" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="35" align="center" valign="bottom" class="text12"><div id="chart" style="width: 526px;height:420px;"></div></td>
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
  var resouces = {!!json_encode($mrecords)!!};
  var myChart = echarts.init(document.getElementById('chart'));
  var mData = []
  var lData = []
  // let winData = []
  // let loseData = []
  // let wlData = []
  resouces.forEach((v) => {
     var obj = {}
     obj.name = v.month
     obj.value = v.sum
     mData.push(obj)
     lData.push(v.month)
  })
  option = {
    legend: {
        orient: 'vertical',
        left: 'left',
        data: lData
    },
    series : [
        {
            name: '月统计数据',
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
