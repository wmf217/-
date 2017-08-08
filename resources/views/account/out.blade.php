@include('part.header')
<link href="{{env('APP_URL')}}/css/bootstrap.min.css" rel="stylesheet">
<link href="{{env('APP_URL')}}/css/fileinput.css" rel="stylesheet">
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao">
        <tr>
          <td width="12" height="54"></td>
          <td width="490" align="left" valign="middle"><span class="lu">账户出金</span><br />
            <span class="luying">Account money</span></td>
          <td width="578" align="right" valign="middle"></td>
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
                <td width="194" height="340" align="center" valign="bottom"><img src="{{env('APP_URL')}}/images/chujin.jpg" width="195" height="195" /></td>
              </tr>
            </table></td>
            <td width="838" align="center" valign="top">
            <!-- <table width="850" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="280" height="84" align="center" valign="middle">
                    <img src="{{env('APP_URL')}}/images/chu.jpg" width="259" height="84" />
                </td>
                <td width="276" align="center" valign="middle" class="text14chu"></td>
                <td width="282" align="center" valign="middle" class="text12"></td>
                </tr>
            </table> -->
        <form id="form" action="/account/out" method='POST' class="form" enctype="multipart/form-data">
          <fieldset>
              <div class="form-group">
                  <label class="col-sm-2 control-label">现有账户</label>
                  <div class="row">
                      <div class="col-lg-5">
                          <select id="account_id" name="account_id" class="form-control">
                              <option value="">请选择账户</option>
                              @foreach($accounts as $account)
                              <option value="{{$account->id}}">{{$account->bank->name}}({{$account->account_number}})</option>
                              @endforeach
                          </select>
                      </div>
                   </div>
               </div>
               <div class="form-group">
                   <label class="col-sm-2 control-label">出金金额</label>
                   <div class="row">
                       <div class="col-lg-5">
                         <input name="amount" type="text" id="amount" class="form-control" placeholder="出金金额"/>
                       </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">可用金额</label>
                    <div class="row">
                        <div class="col-lg-5">
                            <input name="vailable" type="text" id="vailable" class="form-control" value="{{Auth::user()->vailable}}" readonly/>
                        </div>
                     </div>
                 </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-lg-7">
                            <button type="submit" class="btn btn-primary">确认并提交</button>
                            <a href="/user/bank"><span class="hongtext12" style="text-decoration: underline;">添加银行卡</span></a>
                        </div>
                    </div>
                </div>
                {{ csrf_field() }}
            </fieldset>
          </form>
            </td>
          </tr>
        </table>
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
<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery.validate.min.js"></script>
<script>
var vailable = {{Auth::user()->vailable}}
$(document).ready(function(){
    $("#form").validate({
        rules: {
            account_id: "required",
            amount: {
                required: true,
                number:true,
                max: vailable
            },
        },
        messages: {
            account_id: "请选择账户",
            amount: {
                required: "必填",
                number:"必须为数字",
                max: "余额不足"
            },
        }
   });
});
</script>
@include('part.footer')
