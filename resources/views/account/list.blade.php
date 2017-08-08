@include('part.header')
<style>
.choosebtn {
    color: white;
    background-color: #F0433D;
    border-color: #F0433D;
}
</style>
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="hongtiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="hong">{{$note}}记录</span><br />
            <span class="hongying">Gold record</span></td>
          <td width="578" align="right" valign="middle">
              <div class="btn-group">
                @foreach(config('constants.STATUS') as $k => $v)
                <button type="button" @if($status == $k)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/account/list/{{$type}}/{{$k}}'">{{$v}}</button>
                @endforeach
                <button type="button" @if($status == -1)class="btn btn-default choosebtn"@else class="btn btn-default" @endif onclick="window.location='/account/list/{{$type}}'">全部</button>
              </div>
          </td>
        </tr>
      </table>
        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        @forelse($records as $record)
            <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="hongtiao_1">
              <tr>
                <td width="103" height="146" align="center" valign="middle"><p><img src="{{env('APP_URL')}}/images/zhong.jpg" width="60" height="61" />
                <br>
                <span class="text12">{{$record->created_at}}</br>
                </span>
                </td>
                <td width="453" align="left" valign="top"><table width="392" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="100" height="35" align="center" valign="bottom"><h4><span class="label label-primary">{{config('constants.STATUS')[$record->status]}}</span></h4></td>
                    <td width="100" align="center" valign="bottom"><h4><span class="label label-success">{{config('constants.RECORDWAY')[$record->way]}}</span></h4></td>
                    <td width="185" align="left" valign="bottom" class="text12"><h5><span>余额 ${{$record->bebalance}} → ${{$record->gobalance}}</span></h5></td>
                    </tr>
                </table>
                  <table width="429" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="417" height="128" align="left" valign="middle" class="text12">{{$note}}金额：<span class="hong">$<strong>{{$record->amount or ' --'}}</strong></span><br />
                        处理时间：{{$record->updated_at}}<br />
                        备注：{{$record->reason or '无'}}</td>
                    </tr>
                </table></td>
                <td width="524" align="center" valign="middle"><table width="387" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="128" height="45" align="left" valign="middle"><img src="{{env('APP_URL')}}{{$record->bankImg or '/images/default.png'}}" width="168" height="40" /></td>
                  </tr>
                </table></td>
              </tr>
            </table>
        @empty
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="hongtiao_1">
            <tr>
              <td width="103" height="146" align="center" valign="middle">
              暂无数据
              </td>
            </tr>
        </table>
        @endforelse
        <div style="float:right;margin-right: 10px">
        {{$records->links()}}
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
