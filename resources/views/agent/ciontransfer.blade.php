@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lantiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lan14">佣金转户</span><br />
            <span class="lanying">Commission transfer</span></td>
          <td width="578" align="right" valign="middle">&nbsp;</td>
        </tr>
      </table>

        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <form id="form" action="/agent/ciontransfer" method='POST' enctype="multipart/form-data">
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="508" height="343" align="center" valign="top"><table width="1080" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  background="{{env('APP_URL')}}/images/zhuanhu.jpg">
              <tr>
                <td width="88" height="36" align="center" valign="middle" class="baitext"><strong>#</strong></td>
                <td width="147" align="center" valign="middle" class="baitext"> <strong> 订单 </strong></td>
                <td width="134" align="center" valign="middle" class="baitext"><strong>交易账户</strong></td>
                <td width="176" align="center" valign="middle" class="baitext"><strong>交易类型 </strong></td>
                <td width="107" align="center" valign="middle" class="baitext"><strong> 成交量</strong></td>
                <td width="175" align="center" valign="middle" class="baitext"><strong>时间</strong></td>
                <td width="126" align="center" valign="middle" class="baitext"><strong>返佣金额</strong></td>
                <td width="127" align="center" valign="middle" class="baitext"><strong>选择</strong></td>
                </tr>
              </table>
              @forelse($commissions as $cin)
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogedilan" id="{{$cin->id}}" c>
                <tr>
                  <td width="85" height="56" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$cin->id}} <br /></td>
                  <td width="146" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"> #{{$cin->order}} </td>
                  <td width="133" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$cin->username}}</td>
                  <td width="175" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{config('constants.ORDERFLAG')[$cin->cmd]}} </td>
                  <td width="107" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$cin->volume}}手</td>
                  <td width="174" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">{{$cin->created_at}} </td>
                  <td width="124" align="center" valign="middle" bgcolor="#f7f7f7" class="lutext12"><strong>￥{{$cin->amount}} </strong></td>
                  <td width="125" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><input type="checkbox" value="{{$cin->id}}" name="cin[]" class="checkbox" /></td>
                </tr>
              </table>
              @empty
              暂无数据
              @endforelse
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogelan">
                <tr>
                  <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
                </table>
                  <table width="1080" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="43" class="text14chu">
                          <div class="form-group" style="margin-top:20px;">
                              <label class="col-sm-1 control-label">返佣明细</label>
                              <div class="row">
                                  <div class="col-lg-3">
                                      <input type="text" name="detail" id="detail" class="form-control" placeholder="请输入备注"/>
                                      <span class="help-block">
                                          返佣<strong><span class="hong" id="cnum">0</span></strong>笔
                                      </span>
                                    </div>
                                 </div>
                           </div>
                           <div class="form-group">
                               <label class="col-sm-1 control-label"></label>
                               <div class="row">
                                   <div class="col-lg-3">
                                       <input type="button" onclick="submitform()" class="btn btn-primary choosebtn" value="确认并提交"/>
                                    </div>
                               </div>
                            </div>
                      </td>
                    </tr>
                </table>
               </td>
              </tr>
          </table>
          {{ csrf_field() }}
      </form>
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
<script>
let length = 0
$(document).ready(function(){
    $(".checkbox").click(function(){
        length = $("input[name='cin[]']:checked").length
        $("#cnum").text(length)
    })
})
function submitform () {
    if (length == 0) {
        layer.msg('未选择数据')
        return
    }
    $("#form").submit();
}
</script>
@include('part.footer')
