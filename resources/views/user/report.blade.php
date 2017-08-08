@include('part.header')
<link rel="stylesheet" type="text/css" href="{{env('APP_URL')}}/css/tcal.css" />
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lantiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lan14">交易报表</span><br />
            <span class="lanying">Transaction report</span></td>
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
           <form id="search" role="form">
               <table width="1080" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="43" >
                        <div class="col-lg-1"><label class="control-label">交易日期<label></div>
                        <div class="col-lg-2">
                            <input name="from" type="text" class="tcal form-control" readonly id="from" />
                        </div>
                        <div style="float:left">至</div>
                        <div class="col-lg-2">
                            <input name="to" type="text" class="tcal form-control" readonly id="to" />
                        </div>
                        <button type="submit" class="btn btn-primary" style="float:left;margin-left:10px;">搜索</button>
                     </td>
                  </tr>
                </table>
              </fieldset>
            </form>
              <table width="1080"  height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="19"></td>
                </tr>
              </table>
              <table width="1080" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  background="{{env('APP_URL')}}/images/jiaoyi.jpg">
                <tr>
                <td width="93" height="36" align="center" valign="middle" class="baitext"><strong>日期</strong></td>
                <td width="113" align="center" valign="middle" class="baitext"> <strong> 交易</strong></td>
                <td width="78" align="center" valign="middle" class="baitext"><strong>佣金</strong></td>
                <td width="80" align="center" valign="middle" class="baitext"><strong>利息</strong></td>
                <td width="104" align="center" valign="middle" class="baitext"><strong> 成交量</strong></td>
                <td width="97" align="center" valign="middle" class="baitext"><strong>挂单</strong></td>
                <td width="137" align="center" valign="middle" class="baitext"><strong>入金</strong></td>
                <td width="141" align="center" valign="middle" class="baitext"><strong>出金</strong></td>
                <td width="131" align="center" valign="middle" class="baitext"><strong>信用</strong></td>
                <td width="106" align="center" valign="middle" class="baitext">净入金</td>
                </tr>
            </table>
              @foreach($dates as $date)
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogedilan" id="5" c>
                <tr>
                  <td width="91" height="56" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$date}} <br /></td>
                  <td width="111" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"> {{$user->dayOrderNum($date)}} 笔 </td>
                  <td width="78" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"> ${{$user->dayCinget($date)}} </td>
                  <td width="80" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"> ${{$user->dayOrderHand($date)}} </td>
                  <td width="102" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$user->dayOrderHand($date)}} 手</td>
                  <td width="95" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$user->dayRestHand($date)}}手{{$user->dayRestCount($date)}}笔 </td>
                  <td width="137" align="center" valign="middle" bgcolor="#f7f7f7" class="lutext12"><strong class="hong">${{$user->dayIn($date)}} <span class="text12">{{$user->dayInCount($date)}}笔 </span></strong></td>
                  <td width="139" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="lutext12">${{$user->dayOut($date)}} </span>{{$user->dayInCount($date)}}笔 </strong></td>
                  <td width="131" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><span class="lan14">$0.000</span> <strong>笔 </strong></td>
                  <td width="103" align="center" valign="middle" bgcolor="#f7f7f7" class="jutext12"><strong>${{$user->dayIn($date)-$user->dayOut($date)}}</strong></td>
                </tr>
              </table>
              @endforeach
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogelan">
                <tr>
                  <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
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
<script type="text/javascript" src="{{env('APP_URL')}}/js/tcal.js"></script>
<!-- <script>

</script> -->
@include('part.footer')
