@include('part.header')
<style>
.choosebtn {
    color: white;
    background-color: #FFAF40;
    border-color: #FFAF40;
}
</style>
<link rel="stylesheet" type="text/css" href="{{env('APP_URL')}}/css/tcal.css" />
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="jutiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="ju">佣金明细</span><br />
            <span class="juying">Position Summary</span></td>
          <td width="578" align="right" valign="middle">
              <div class="btn-group">
                @foreach(config('constants.STATUS') as $k => $v)
                <button type="button" @if($status == $k)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/agent/ciondetail/{{$k}}'">{{$v}}</button>
                @endforeach
                <button type="button" @if($status == -1)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/agent/ciondetail'">全部</button>
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
                    <td width="491" height="43">
                        <div class="col-lg-2"><label class="control-label">账户<label></div>
                        <div class="col-lg-5">
                            <input name="username" class="form-control" type="text" id="username" />
                        </div>
                    </td>
                    <td width="589" >
                        <div class="col-lg-2"><label class="control-label">日期<label></div>
                        <div class="col-lg-4">
                            <input name="from" class="form-control tcal" type="text" id="from" readonly/>
                        </div>
                        <div style="float:left">至</div>
                        <div class="col-lg-4">
                            <input name="to" class="form-control tcal" style="float:left" type="text" id="to" readonly/>
                        </div>
                    </td>
                  </tr>
                </table>
                <button type="submit" class="btn btn-warning" style="float:left;margin-left:10px;margin-bottom:10px;">搜索</button>
              </fieldset>
            </form>
              <table width="1080" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  background="{{env('APP_URL')}}/images/yong.jpg">
                <tr>
                <td width="83" height="36" align="center" valign="middle" class="baitext"><strong>#</strong></td>
                <td width="145" align="center" valign="middle" class="baitext"> <strong> 订单</strong></td>
                <td width="151" align="center" valign="middle" class="baitext"><strong>交易账户</strong></td>
                <td width="134" align="center" valign="middle" class="baitext"><strong>交易类型</strong></td>
                <td width="128" align="center" valign="middle" class="baitext"><strong>成交量 </strong></td>
                <td width="147" align="center" valign="middle" class="baitext"><strong> 时间	</strong></td>
                <td width="159" align="center" valign="middle" class="baitext"><strong>返佣金额</strong></td>
                <td width="133" align="center" valign="middle" class="baitext"><strong>状态</strong></td>
                </tr>
            </table>
              @forelse($commissions as $v)
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" c="c" class="biaogediju">
                <tr>
                  <td width="80" height="35" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$v->id}}</td>
                  <td width="144" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">#{{$v->orderno}}</td>
                  <td width="150" align="left" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="58" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="58" height="29" align="center" valign="middle" class="baitext"><strong><img src="{{env('APP_URL')}}/images/touxiang.jpg" width="20" height="17" /></strong></td>
                    </tr>
                  </table>
                    <table width="58" border="0" align="left" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="58" align="center" class="baitext"><strong></strong><strong class="text12">{{$v->username}} </strong></td>
                      </tr>
                  </table></td>
                  <td width="133" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="77" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="77" align="center" bgcolor="#f0433d" class="baitext"><strong>{{config('constants.ORDERFLAG')[$v->flag]}} </strong></td>
                    </tr>
                  </table></td>
                  <td width="128" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong></strong>{{$v->num}}</td>
                  <td width="146" align="left" valign="middle" bgcolor="#f7f7f7" class="text12">{{$v->created_at}}</span></td>
                  <td width="158" align="center" valign="middle" bgcolor="#f7f7f7" class="hong12">${{$v->amount or ' --'}}</td>
                  <td width="130" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="77" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="77" align="center" bgcolor="#f0433d" class="baitext"><strong>{{config('constants.STATUS')[$v->status]}}</strong></td>
                    </tr>
                  </table></td>
                </tr>
              </table>
              @empty
              暂无数据
              @endforelse
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogeju">
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
<script type="text/javascript" src="{{env('APP_URL')}}/js/tcal.js"></script>
<script>
function submit () {
    $("#search").submit();
}
</script>
@include('part.footer')
