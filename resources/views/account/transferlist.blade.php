@include('part.header')
<style>
.choosebtn {
    color: white;
    background-color: #059765;
    border-color: #059765;
}
.label-primary {
    background-color: #428bca;
    margin-left: -17px;
}
</style>
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lu">转户记录</span><br />
            <span class="luying">Transfer record</span></td>
              <td width="578" align="right" valign="middle">
                  <div class="btn-group">
                    @foreach(config('constants.STATUS') as $k => $v)
                    <button type="button" @if($status == $k)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/account/translist/{{$k}}'">{{$v}}</button>
                    @endforeach
                    <button type="button" @if($status == -1)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/account/translist'">全部</button>
                  </div>
              </td>
        </tr>
      </table>
        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        @forelse($transfers as $transfer)
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao_1">
          <tr>
            <td width="103" height="139" align="center" valign="middle"><p><img src="{{env('APP_URL')}}/images/zhong.jpg" width="60" height="61" />
            <br>
            <span class="text12">{{$transfer->created_at}}</br>
            </span></td>
            <td width="453" align="left" valign="top"><table width="312" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="104" height="30" align="center" valign="bottom">
                    <span class="label label-primary">{{config('constants.STATUS')[$transfer->status]}}</span>
                </td>
                <td width="208" align="left" valign="bottom" class="lutext12">至<strong>{{$transfer->toUsername}}</strong></td>
                </tr>
            </table>
              <table width="429" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="417" height="82" align="left" valign="middle" class="text12" ><table width="429" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="417" height="84" align="left" valign="middle" class="text12" >金额：<span class="hong12">${{$transfer->amount}}</span><br />
                      处理时间：{{$transfer->updated_at}}<br />
                      错误原因：<span class="hong12">{{$transfer->reason or ' --'}}</span></td>
                  </tr>
                </table>                  <span class="hong12"></span></td>
              </tr>
            </table></td>
            <td width="524" align="center" valign="middle"><p>&nbsp;</p></td>
          </tr>
        </table>
        @empty
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao_1">
            <tr>
              <td width="103" height="146" align="center" valign="middle">
              暂无数据
              </td>
            </tr>
        </table>
        @endforelse
        <div style="float:right;margin-right: 10px">
        {{$transfers->links()}}
        </div>
       </td>
    </tr>
  </table>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr></tr>
    <tr>
      <td height="12"></td>
    </tr>
  </table>
</div>
@include('part.footer')
