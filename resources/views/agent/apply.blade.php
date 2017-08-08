@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lu">申请代理</span><br/>
            <span class="luying">Application agent</span></td>
          <td width="578" align="right" valign="middle">&nbsp;</td>
        </tr>
      </table>
        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="1080"  height="409" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="361" height="409" align="center" valign="top"><table width="194" height="236" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="194" height="236"><img src="{{env('APP_URL')}}/images/sqdl.jpg" width="195" height="195" /></td>
              </tr>
            </table>
              <table width="194" height="41" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="194" height="41" align="center" valign="middle" class="text14chu">当前级别：无</td>
                </tr>
            </table></td>
            <td width="719" align="center" valign="top"><table width="710" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="81" height="84"><img src="{{env('APP_URL')}}/images/d1.jpg" width="66" height="59" /></td>
                <td width="272" class="text14chu">个人交易笔数达到0.10笔</td> <!--todo 配置-->
                <td width="176" align="left" valign="middle" class="text12">目前已达到：{{$info['total'] or '0.00'}} </td>
                <td width="181" align="center"><table width="84" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    @if($info['total'] >= 0.10)
                        <td height="32" align="center" class="baitext"><span class="label label-success">已达成</span></td>
                    @else
                        <td height="32" align="center" class="baitext"><span class="label label-danger">未达成</span></td>
                    @endif
                  </tr>
                </table></td>
              </tr>
            </table>
              <table width="710" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="81" height="77"><img src="{{env('APP_URL')}}/images/d2.jpg" width="66" height="59" /></td>
                  <td width="272" class="text14chu">推荐三个以上客户并注册</td>
                  <td width="176" align="left" valign="middle" class="text12">目前已注册：{{$info['offline']}} </td>
                  <td width="181" align="center"><table width="84" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      @if($info['offline'] > 3)
                          <td height="32" align="center" class="baitext"><span class="label label-success">已达成</span></td>
                      @else
                          <td height="32" align="center" class="baitext"><span class="label label-danger">未达成</span></td>
                      @endif
                    </tr>
                  </table></td>
                </tr>
            </table>
              <table width="300" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <form id="form" action="/agent/apply" method='POST' enctype="multipart/form-data">
                  <td height="41" align="center" valign="middle">
                      <a onclick="submit()"><img src="{{env('APP_URL')}}/images/lksq.jpg" width="123" height="29" /></a>
                  </td>
                  {{ csrf_field() }}
                  </form>
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
<script>
const info = {!!json_encode($info)!!}
const is_wait = {{$is_wait}}
$(document).ready(function(){
})
function submit () {
    if (is_wait) {
        layer.msg('不能重复申请, 请耐心等待审核')
        return
    }
    if (info.total > 0.10 && info.offline >3) {
        $("#form").submit()
    } else {
        layer.msg('您未满足筛选要求')
    }
}
</script>
@include('part.footer')
