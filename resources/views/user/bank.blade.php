@include('part.header')
<link href="{{env('APP_URL')}}/css/bootstrap.min.css" rel="stylesheet">
<link href="{{env('APP_URL')}}/css/fileinput.css" rel="stylesheet">
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lutiao">
        <tr>
          <td width="12" height="54"></td>
          <td width="490" align="left" valign="middle"><span class="lu">添加银行卡</span><br />
            <span class="luying">Add Bank</span></td>
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
        <form id="form" action="/user/bank" method='POST' class="form" enctype="multipart/form-data">
          <fieldset>
            <div class="form-group">
                <label class="col-sm-1 control-label">币种</label>
                <div class="row">
                    <div class="col-lg-3">
                        <select name="bank_id" id="select" class="form-control">
                          <option value="">-请选择银行-</option>
                          @foreach($banks as $bank)
                          <option value="{{$bank->id}}">{{$bank->name}}</option>
                          @endforeach
                        </select>
                        <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">开户行</span></span>
                    </div>
                    <div class="col-lg-3">
                      <input type="text" name="account_city" id="account_city" class="form-control" placeholder="区域/城市"/>
                      <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">区域/城市</span></span>
                    </div>
                    <div class="col-lg-4">
                      <input type="text" name="account_branch" id="account_branch" class="form-control" placeholder="支行名称"/>
                      <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">支行名称</span></span>
                    </div>
                 </div>
             </div>
             <div class="form-group">
                 <label class="col-sm-1 control-label">账户</label>
                 <div class="row">
                     <div class="col-lg-3">
                       <input name="account_name" type="text" id="account_name" class="form-control" placeholder="用户名"/>
                       <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">用户名</span></span>
                     </div>
                     <div class="col-lg-4">
                       <input type="text" name="account_number" id="account_number" class="form-control"  placeholder="银行帐号"/>
                       <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">银行帐号</span></span>
                     </div>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-1 control-label">银行</label>
                  <div class="row">
                      <div class="col-lg-5">
                        <input id="uploadfront" name="uploadimg" type="file" multiple class="file" data-overwrite-initial="false">
                      </div>
                      <div class="col-lg-5">
                        <input id="uploadback" name="uploadimg" type="file" multiple class="file" data-overwrite-initial="false">
                      </div>
                   </div>
               </div>
                <input type="hidden" name="frontimg">
                <input type="hidden" name="backimg">
                <button type="submit" class="btn btn-primary">确认并提交</button>
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
<script src="{{env('APP_URL')}}/js/fileinput.js"></script>
<script src="{{env('APP_URL')}}/js/common/uploadimg.js"></script>
<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery.validate.min.js"></script>
<script>
var vailable = {{Auth::user()->vailable}}
uploadInit('uploadfront', '银行卡正面', 'frontimg')
uploadInit('uploadback', '银行卡反面', 'backimg')
$(document).ready(function(){
    $("#form").validate({
        rules: {
            bank_id: "required",
            account_city: "required",
            account_branch: "required",
            account_name: "required",
            account_number: {
                required: true,
                number:true
            },
        },
        messages: {
            bank_id: "",
            account_city: "",
            account_branch: "",
            account_name: "",
            account_number: "",
        },
        // showErrors: function(errorMap, errorList) {
        //     console.log(errorList)
        // }
   });
});
</script>
@include('part.footer')
