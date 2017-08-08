@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="555" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lu">账户转账</span><br />
            <span class="luying">Account transfer</span></td>
          <td width="578" align="right" valign="middle">&nbsp;</td>
        </tr>
      </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <form id="form" action="/account/transfer" method='POST' enctype="multipart/form-data">
            <fieldset>
            <td width="403" height="348" align="right" valign="middle"><img src="{{env('APP_URL')}}/images/zhuan.jpg" width="191" height="186" /></td>
            <td width="677" align="center" valign="middle"><table width="555" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="662" height="72" align="left" valign="middle" class="text12">
                   <table width="399" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="93" height="55"><strong>转入账号：</strong></td>
                      <td width="306" align="left" class="baitext">
                         <div class="row">
                             <div class="col-lg-10">
                                 <input type="text" name="name" placeholder="请输入转入账号" class="form-control" id="name" required/>
                             </div>
                         </div>
                       </td>
                    </tr>
                  </table>
                    <table width="399" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="93" height="48" valign="top"><strong>转账金额：</strong></td>
                        <td width="306" align="left" class="baitext">
                        <div class="row">
                            <div class="col-lg-10">
                            <input type="text" name="amount" placeholder="请输入转入金额" class="form-control" id="amount" required/>
                            <span class="help-block"><span class="text12">本次可转出</span><span class="hong"> {{Auth::user()->vailable}} </span></span>
                            </div>
                        </div>
                      </td>
                      </tr>
                   </table>
                  </td>
                </tr>
            </table>
              <table width="340" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="300" height="101" align="left" valign="middle" class="text12">
                      <button type="submit" class="btn btn-success" style="margin-left: -11px;">确定转账</button>
                  </td>
                </tr>
            </table>
            </td>
            {{ csrf_field() }}
            </fieldset>
          </form>
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
    $("#form").validate({
        rules: {
            name: "required",
            amount: "required",
        },
        messages: {
        }
   });
});
</script>
@include('part.footer')
