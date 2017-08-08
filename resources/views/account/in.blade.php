@include('part.header')
<div class="zhong">
  <table width="1100" border="0"  background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lu">账户入金</span><br />
            <span class="luying">Account entry</span></td>
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
            <td width="242" height="409" align="center" valign="top"><table width="194" height="340" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="194" height="340" align="center" valign="bottom"><img src="{{env('APP_URL')}}/images/ru.jpg" width="195" height="195" /></td>
              </tr>
            </table></td>
            <td width="838" align="center" valign="top"><table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
            <form id="form" action="/account/in" method='POST' class="form" enctype="multipart/form-data">
            <fieldset>
              <tr>
                <td width="280" height="84" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/r1.jpg" width="259" height="84" /></td>
                <td width="276" align="center" valign="middle" class="text14chu"><img src="{{env('APP_URL')}}/images/r2.jpg" width="259" height="84" /></td>
                <td width="282" align="center" valign="middle" class="text12"><img src="{{env('APP_URL')}}/images/r3.jpg" width="259" height="84" /></td>
                </tr>
            </table>
              <table width="850" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="66" height="41" align="left" valign="middle" class="text12">选择银行：</td>
                  <td width="784" align="left" valign="middle"><span class="text12">您已选择通过</span> <span class="hong12" id="choosebank">中国工商银行</span><span class="text12"> 在线入金</span></td>
                </tr>
              </table>
              <table width="850" border="0" cellspacing="0" cellpadding="0">
                @foreach($banks as $k => $bank)
                @if($k%5==0)<tr style="display:block;margin:4px 0;">@endif
                  <td width="170" align="center" valign="middle" class="banks" data-k="{{$k}}" data-name="{{$bank->name}}" style="cursor:pointer">
                    <table width="160" border="0" cellspacing="0" cellpadding="0"  background="{{env('APP_URL')}}{{$bank->img}}">
                        <tr>
                          <td height="40" align="right" valign="middle">
                              <table width="50" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td align="center" valign="middle"><input type="radio" name="bank" id="radio{{$k}}" value="{{$bank->bankno}}" @if($k == 0)checked="true"@endif/></td>
                                </tr>
                              </table>
                          </td>
                        </tr>
                    </table>
                  </td>
                @if($k%5==4||$k==count($banks)-1)</tr>@endif
                @endforeach
              </table>
              <table width="850" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;">
                <tr>
                  <td width="66" height="41" align="left" valign="top" class="text12">入金金额：</td>
                  <td width="784" align="left" valign="middle">
                     <div class="row">
                      <div class="col-sm-3">
                          <input type="text" name="amount" class="form-control" id="amount" onkeyup="value=value.replace(/[^\d\.]/g,'')"/>
                          <span class="help-block">
                              <span class="text12">当前账户余额</span> <span class="hong12">${{Auth::user()->balance}}</span>
                          </span>
                      </div>
                    </div>
                  </td>
                </tr>
              </table>
              <button type="button" onclick="check()" class="btn btn-primary">进入银行入金界面</button>
              {{ csrf_field() }}
              </fieldset>
            </form>
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
<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
   //  $("#form").validate({
   //      rules: {
   //          account_id: "required",
   //          amount: {
   //              required: true,
   //              number:true,
   //          },
   //      },
   //      messages: {
   //          account_id: "请选择账户",
   //          amount: {
   //              required: "必填",
   //              number:"必须为数字",
   //          },
   //      }
   // });

    $(".banks").click(function(){
       var k = $(this).data('k');
       var name = $(this).data('name');
       $("#radio" + k).prop('checked', 'checked');
       $("#choosebank").text(name);
    });
});
function check () {
    var bankno = $("input[name='bank']").val()
    var amount = $("input[name='amount']").val()
    if (amount != ''&&bankno!='') {
        // console.log(bankno)
        $("form").submit()
    } else {
        layer.msg('请输入金额并选择银行卡')
    }
}
</script>
@include('part.footer')
