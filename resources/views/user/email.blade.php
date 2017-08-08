@include('part.header')
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="555" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="hongtiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="hong">更换电邮</span><br />
            <span class="hongying">Change email</span></td>
          <td width="578" align="right" valign="middle">&nbsp;</td>
        </tr>
      </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="353" height="348" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/dianyou.jpg" width="186" height="186" /></td>
            <td width="727" align="center" valign="top"><table width="727" border="0" cellpadding="0" cellspacing="0" class="huitiao">
              <tr>
                <td width="727" height="46" align="left" valign="bottom"><strong>当前</strong></td>
                </tr>
            </table>
              <table width="429" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="417" height="86" align="left" valign="middle" class="text12">账号：{{$user->name}}<br />
                    <table width="399" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="38">电邮：</td>
                        <td width="361" align="left" class="baitext"><input type="text" name="textfield" id="textfield" value="{{$user->email}}" readonly="readonly"/></td>
                      </tr>
                  </table></td>
                </tr>
            </table>
              <table width="727" border="0" cellpadding="0" cellspacing="0" class="huitiao">
                <tr>
                  <td width="727" height="43" align="left" valign="bottom"><strong>更改后</strong></td>
                </tr>
            </table>
               <form id="form" action="/userinfo" method='POST' enctype="multipart/form-data">
                     <table width="721" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="721" height="44" align="left" valign="bottom" class="text12"><table width="399" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="67">新的电邮：</td>
                                <td width="332" align="left" class="baitext"><input type="text" name="email" id="email" /></td>
                              </tr>
                          </table></td>
                        </tr>
                    </table>
                      <table width="340" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="340" height="101" align="left" valign="middle" class="text12"><a onclick="submit()"><img src="{{env('APP_URL')}}/images/queding.jpg" width="145" height="32" /></a></td>
                        </tr>
                     </table>
                <input type="hidden" name="id" value="{{$user->id}}">
                {{ csrf_field() }}
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
<script>
function submit () {
    $("#form").submit();
}
</script>
@include('part.footer')
