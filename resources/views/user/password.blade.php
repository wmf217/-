@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="555" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lantiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lan14">主密码</span><br />
            <span class="lanying">Master password</span></td>
          <td width="578" align="right" valign="middle">&nbsp;</td>
        </tr>
      </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="40" class="hong12">提示：投资人密码用于交易客户端的登陆（仅限数据查看）</td>
          </tr>
        </table>
        <form id="form" action="/user/info" method='POST' enctype="multipart/form-data">
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="353" height="348" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/mima.jpg" width="186" height="186" /></td>
            <td width="727" align="center" valign="top"><table width="555" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="675" height="63" align="left" valign="middle" class="text12"><strong>账号：{{$user->name}}</strong><br /></td>
              </tr>
            </table>
              <table width="555" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="662" height="72" align="left" valign="middle" class="text12"><table width="399" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="69" height="55"><strong>新的密码：</strong></td>
                          <td width="330" align="left" class="baitext">
                              <div  class="col-lg-8">
                              <input type="text" class="form-control" name="password" id="password" />
                              </div>
                          </td>
                        </tr>
                      </table>
                        <table width="399" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="69" height="48"><strong>重复一次：</strong></td>
                            <td width="330" align="left" class="baitext">
                                <div  class="col-lg-8">
                                <input type="text" class="form-control" name="password2" id="password2" />
                                </div>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                      </table>
                      <table width="340" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="340" height="101" align="left" valign="middle" class="text12">
                              <button type="submit" class="btn btn-primary">确认并提交</button>
                          </td>
                        </tr>
                    </table>
                    </td>
                  </tr>
              </table>
              <input type="hidden" name="id" value="{{$user->id}}">
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
<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery.validate.min.js"></script>
<script>
$(document).ready(function(){
    $("#form").validate({
        rules: {
            password: "required",
            password2: {
                required: "true",
                equalTo: "#password"
            }
        }
    });
});
</script>
@include('part.footer')
