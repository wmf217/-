@include('part.header')
<style>
.choosebtn {
    color: white;
    background-color: #5DB75D;
    border-color: #5DB75D;
}
</style>
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lu">申请记录</span><br />
            <span class="luying">Commission statistics</span></td>
          <td width="578" align="right" valign="middle">
              <div class="btn-group">
                @foreach(config('constants.STATUS') as $k => $v)
                <button type="button" @if($status == $k)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/agent/applylist/{{$k}}'">{{$v}}</button>
                @endforeach
                <button type="button" @if($status == -1)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/agent/applylist'">全部</button>
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
            <td width="508" height="343" align="center" valign="top"><table width="1080" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  background="{{env('APP_URL')}}/images/biaobeida.jpg">
              <tr>
                <td width="108" height="36" align="center" valign="middle" class="baitext"><strong># </strong></td>
                <td width="152" align="center" valign="middle" class="baitext"> <strong> 账户</strong></td>
                <td width="170" align="center" valign="middle" class="baitext"><strong>账户性质</strong></td>
                <td width="147" align="center" valign="middle" class="baitext"><strong>杠杆</strong></td>
                <td width="206" align="center" valign="middle" class="baitext"><strong>提交时间 </strong></td>
                <td width="104" align="center" valign="middle" class="baitext"><strong>状态 </strong></td>
                <td width="193" align="center" valign="middle" class="baitext"><strong>注释</strong></td>
                </tr>
              </table>
              @forelse($applys as $apply)
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" c class="biaogedilu">
                <tr>
                  <td width="106" height="35" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">#{{$apply->id}}</td>
                  <td width="151" align="left" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="58" border="0" align="left" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="58" height="29" align="center" valign="middle" class="baitext"><strong><img src="{{env('APP_URL')}}/images/touxiang.jpg" width="20" height="17" /></strong></td>
                    </tr>
                  </table>
                    <table width="58" border="0" align="left" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="58" align="center" class="baitext"><span class="text12"><strong>{{Auth::user()->name}}</strong></span><strong>1</strong></td>
                      </tr>
                  </table></td>
                  <td width="170" align="left" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td align="center" class="baitext"><span class="label label-success">交易账户</span></td>
                    </tr>
                  </table></td>
                  <td width="144" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong>1:100</strong></td>
                  <td width="206" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong>{{$apply->created_at}}</strong></td>
                  <td width="103" align="left" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="77" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="77" align="center" class="baitext"><span class="label label-success">{{config('constants.AGENTAPPLYSTATUS')[$apply->status]}} </span></td>
                    </tr>
                  </table></td>
                  <td width="190" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong>{{$apply->reason or '无'}}</strong>  {{$apply->updated_at}}</td>
                </tr>
              </table>
              @empty
              <p>没有数据</p>
              @endforelse
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogelu">
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
<map name="Map" id="Map">
  <area shape="rect" coords="9,4,80,26" href="/agent/applylist/0" />
  <area shape="rect" coords="97,1,157,27" href="/agent/applylist/1" />
  <area shape="rect" coords="174,-1,225,27" href="/agent/applylist/2" />
  <area shape="rect" coords="242,1,295,28" href="/agent/applylist" />
</map>
@include('part.footer')
