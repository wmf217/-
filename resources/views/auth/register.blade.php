<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="shortcut icon" type="image/ico" href="/images/favicon.ico">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="{{env('APP_URL')}}/css/tcal.css" />
<link href="{{env('APP_URL')}}/css/bootstrap.min.css" rel="stylesheet">
<link href="{{env('APP_URL')}}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="{{env('APP_URL')}}/css/fileinput.css" rel="stylesheet">
<style>
.btn-default:hover,
.btn-default:focus,
.btn-default:active,
.btn-default.active,
.open .dropdown-toggle.btn-default {
    color: white;
    background-color: #F0433D;
    border-color: #F0433D;
}
.choosebtn {
    color: white;
    background-color: #F0433D;
    border-color: #F0433D;
}
</style>
</head>
<body>
<div class="logo">
<div class="logoleft"><img src="{{env('APP_URL')}}{{$setting->logo or '/images/default.png'}}" width="254" height="100" />
</div>

<div class="logoright">
  <div class="logozi_2">
     <a style="color:#FFF;" href="/login">直接登录</a>
  </div>
 </div>

<!-- <div class="logoright">
  <div class="logozi_1"><a href="#" style="color:#FFF;">简 体
  </a></div>
<div class="logozi_2"><a href="#" style="color:#FFF;">繁 體</a>
</div>
<div class="logozi_3"><a href="#" style="color:#FFF;">English</a>
</div>

</div> -->

</div>

<div class="zhong">
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="6"><img src="images/top1.jpg" width="1100" height="6" /></td>
    </tr>
  </table>
  <form id="form" action="/register" method='POST' enctype="multipart/form-data">
  <fieldset>
  <table width="1100" border="0" background="images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="1301" valign="top"><table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="508" height="343" align="center" valign="top"><table width="1080"  height="12" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="12"></td>
                </tr>
              </table>
              <table width="1080" height="57" border="0" align="center" cellpadding="0" cellspacing="0"   bgcolor="#5db75d">
                <tr>
                <td width="174" height="57" align="center" valign="middle" class="baitext"><strong class="baitext14">账户属性</strong></td>
                <td width="906" align="center" valign="middle" class="baitext">&nbsp;</td>
                </tr>
            </table>
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogedilu1" id="5422" c="c">
                <tr>
                  <td width="94" height="147" align="right" valign="top" class="text12"><table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                    <table width="1060" border="0" align="center" cellpadding="0" cellspacing="1" id="542" c="c">
                    <tr>
                      <td height="44" width="121" align="right" valign="top" class="text12"><strong>账户类型：</strong><br /></td>
                      <td align="left" width="954" valign="top" class="text12">
                          <div class="row">
                                <div class="col-sm-4">
                                    <div class="btn-group">
                                      <button type="button" data-sim="1" class="btn btn-default usetype choosebtn">普通用户</button>
                                      <!-- <button type="button" data-sim="0" class="btn btn-default usetype">模拟用户</button> -->
                                    </div>
                                    <input type="hidden" name="usetype" id="usetype" value="">
                                </div>
                          </div>
                      </td>
                    </tr>
                    <tr>
                      <td height="44" align="right" valign="top" class="text12"><strong>MT4组：</strong></td>
                      <td align="left" valign="top" class="text12">
                          <div class="row">
                                <div class="col-sm-4">
                                    <!-- 真实组 -->
                                    <div class="btn-group" id="sim1">
                                        @foreach($realg as $v)
                                        <button type="button" class="btn btn-default group choosebtn">{{$v->name}}</button>
                                        @endforeach
                                    </div>
                                    <!-- 模拟组 -->
                                    <div class="btn-group" id="sim0" style="display:none">
                                        @foreach($nrealg as $v)
                                        <button type="button" class="btn btn-default group choosebtn">{{$v->name}}</button>
                                        @endforeach
                                    </div>
                                    <input type="hidden" name="group" id="group" value="{{$realg[0]->name or ''}}">
                                </div>
                          </div>
                          <div class="row" id="nreal-btn" style="display:none;margin-top:10px;">
                                <div class="col-sm-4">
                                    <button type="button" onclick="window.location.href='/sim'" class="btn btn-primary">确认模拟登陆</button>
                                </div>
                          </div>
                      </td>
                    </tr>
                    <!-- <tr>
                      <td height="44" align="right" valign="top" class="text12"><strong>代理编号：</strong></td>
                      <td align="left" valign="top" class="text12">
                          <div class="row">
                              <div class="col-sm-3">
                                 <input name="agent_id" class="form-control" type="text" class="wenkuang" id="agent_id" value="{{$agent or ''}}"/>
                                 <span class="help-block"><span class="lutext12">*选填</span></strong><span class="text12">代理</span></span>
                              </div>
                          </div>
                      </td>
                    </tr> -->
                  </table>
                  <br />
                 </td>
                </tr>
              </table>
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogelu">
                <tr>
                  <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
              </table>
              <table width="1080"  height="30" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="30"></td>
                </tr>
              </table>
              <span id = 'maininfo'>
              <table width="1080" height="57" border="0" align="center" cellpadding="0" cellspacing="0"   bgcolor="#ffaf3f">
                <tr>
                  <td width="174" height="57" align="center" valign="middle" class="baitext"><strong class="baitext14">个人资料</strong></td>
                  <td width="906" align="center" valign="middle" class="baitext">&nbsp;</td>
                </tr>
              </table>
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="biaogediju">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
              <table width="1080" border="0" align="c" cellpadding="0" cellspacing="1" c="c" class="biaogediju">
                <tr>
                  <td width="121" height="35" align="right" valign="top"  class="text12"><strong>中文姓名：</strong></td>
                  <td width="954" align="left" valign="middle"  class="text12">
                      <div class="row">
                            <div class="col-sm-4">
                                <input name="firstname" class="form-control col-sm-5" type="text" class="wenkuang" id="firstname" placeholder="张三"/>
                                <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">姓名</span></span>
                            </div>
                            <!-- <div class="col-sm-4">
                                <input name="lastname" class="form-control" type="text" class="wenkuang" id="firstname" placeholder="三"/>
                                <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">名字</span></span>
                            </div> -->
                     </div>
                  </td>
                </tr>
                <tr>
                  <td height="35" align="right" valign="top"  class="text12"><strong>英文名：</strong></td>
                  <td align="left" valign="middle"  class="text12">
                      <div class="row">
                            <div class="col-sm-4">
                                <input name="englishname" class="form-control" type="text" class="wenkuang" id="englishname" placeholder="James"/>
                                <span class="help-block"><span class="lutext12">*选填</span></strong><span class="text12">英文名</span></span>
                            </div>
                     </div>
                  </td>
                </tr>
                <tr>
                  <td height="35" align="right" valign="top"  class="text12"><strong>交易密码：</strong></td>
                  <td align="left" valign="middle"  class="text12">
                      <div class="row">
                            <div class="col-sm-3">
                                <input name="password" class="form-control" type="password" class="wenkuang" id="password"/>
                                <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">(字母和数字组合,不超出15位)</span></span>
                            </div>
                            <div class="col-sm-3">
                                <input name="password2" class="form-control" type="password" class="wenkuang" id="password2"/>
                                <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">确认交易密码</span></span>
                            </div>
                     </div>
                  </td>
                </tr>
                <!-- <div class="col-sm-3">
                   <input name="password" class="form-control" type="text" class="wenkuang" value=""/>
                   <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">密码</span></span>
                </div> -->
                <tr>
                  <td height="46" align="right" valign="top"  class="text12"><strong>身份证明：</strong></td>
                  <td align="left" valign="middle"  class="text12">
                      <div class="row">
                            <div class="col-sm-4">
                                <div class="btn-group">
                                  <button type="button" class="btn btn-default idtype choosebtn">大陆身份证</button>
                                  <button type="button" class="btn btn-default idtype">其它身份</button>
                                  <button type="button" class="btn btn-default idtype">证件照</button>
                                </div>
                                <span class="help-block"><span class="hongtext12">*必选</span></strong><span class="text12">证件类型</span></span>
                                <input type="hidden" value="大陆身份证" name="id_type" id="id_type">
                            </div>
                            <div class="col-sm-3" style="margin-left: -50px;">
                                <input name="idcountry" class="form-control col-sm-5 country" type="text" class="wenkuang" id="idcountry" value="中国"/>
                                <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">签发国家</span></span>
                            </div>
                            <div class="col-sm-4">
                                <input name="idnum" class="form-control" type="text" class="wenkuang" id="idnum" placeholder="23090....."/>
                                <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">证件号码</span></span>
                            </div>
                      </div>
                    </td>
                </tr>
                <tr>
                  <td height="35" align="right" valign="top"  class="text12"><strong>生日：</strong></td>
                  <td align="left" valign="middle"  class="text12">
                      <div class="row">
                            <div class="input-group date form_date col-md-4" data-date="" data-date-format="dd MM yyyy" data-link-field="fete" data-link-format="yyyy-mm-dd">
                                <input class="form-control" size="16" type="text" value="" readonly>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
            				<input type="hidden" id="fete" name="fete" value="" />
                      </div>
                      <span class="help-block"><span class="lutext12">*选填</span></strong><span class="text12">生日</span></span>
                  </td>
                </tr>
                <tr>
                  <td height="35" align="right" valign="top"  class="text12"><strong>信息：</strong></td>
                  <td align="left" valign="middle"  class="text12">
                      <div class="row">
                          <div class="col-md-2">
                              <div class="btn-group">
                                <button type="button" class="btn btn-default sex choosebtn">男</button>
                                <button type="button" class="btn btn-default sex">女</button>
                              </div>
                              <span class="help-block"><span class="hongtext12">*必选</span></strong><span class="text12">性别</span></span>
                              <input type="hidden" value="男" name="sex" id="sex">
                          </div>
                          <div class="col-sm-2" style="margin-left:-50px;">
                              <input name="country" class="form-control col-sm-5 country" type="text" class="wenkuang" id="country" value="中国" placeholder="请填写所在国家"/>
                              <span class="help-block"><span class="lutext12">*选填</span></strong><span class="text12">居住国家</span></span>
                          </div>
                          <div class="col-sm-3">
                              <input name="address" class="form-control" type="text" class="address" id="idnum" placeholder="请填写住址"/>
                              <span class="help-block"><span class="lutext12">*选填</span></strong><span class="text12">居住地址</span></span>
                          </div>
                          <div class="col-sm-3">
                              <input name="tel" class="form-control" type="text" id="tel" placeholder="请填写手机号"/>
                              <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">手机号</span></span>
                          </div>
                      </div>
                  </td>
                </tr>
                <tr>
                  <td height="35" align="right" valign="top"  class="text12"><strong>电子邮箱：</strong></td>
                  <td align="left" valign="middle"  class="text12">
                      <div class="row">
                          <div class="col-sm-3">
                              <input name="email" type="text" class="form-control col-sm-3" id="email" placeholder="请填写邮箱地址"/>
                              <span class="help-block"><span class="hongtext12">请务必使用真实电邮以确保及时获取信息</span></strong></span>
                          </div>
                          <input type="button" class="btn btn-default" id="btn" value="获取验证码" onclick="sendcode(this)" />
                      </div>
                  </td>
                </tr>
                <tr>
                  <td height="35" align="right" valign="top"  class="text12"><strong>验证码：</strong></td>
                  <td align="left" valign="middle"  class="text12">
                      <div class="row">
                          <div class="col-sm-2">
                             <input name="code" type="text" class="form-control" id="code" />
                             <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">验证码</span></span>
                          </div>
                      </div>
                          <!-- 验证码寄存 todo 存后台 -->
                  </td>
                </tr>
                <tr>
                  <td height="44" align="right" valign="top" class="text12"><strong>身份证：</strong></td>
                  <td align="left" valign="top" class="text12">
                      <div class="row">
                          <div class="col-lg-5">
                            <input id="idfront" name="uploadimg" type="file" multiple class="file" data-overwrite-initial="false">
                          </div>
                          <div class="col-lg-5">
                            <input id="idback" name="uploadimg" type="file" multiple class="file" data-overwrite-initial="false">
                          </div>
                       </div>
                 </td>
                </tr>
              </table>
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogeju">
                <tr>
                  <td width="500" height="10" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
              </span>
            </table>
           </td>
          </tr>
      </table>
        <table width="1080"  height="12" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="12"></td>
          </tr>
      </table>
        <table width="1080"  height="12" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="12"></td>
          </tr>
      </table>
        <span id="accountinfo">
        <table width="1080" height="57" border="0" align="center" cellpadding="0" cellspacing="0"   bgcolor="#45bcdf">
          <tr>
            <td width="174" height="57" align="center" valign="middle" class="baitext"><strong class="baitext14">银行卡资料</strong></td>
            <td width="906" align="center" valign="middle" class="baitext">&nbsp;</td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="biaogedilan">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" c="c" class="biaogedilan">
          <tr>
            <td height="44" align="right" valign="top" class="text12" width=121><strong>币种：</strong></td>
            <td align="left" valign="middle"  class="text12">
                <div class="row">
                    <div class="col-md-4">
                        <div class="btn-group">
                          <button type="button" class="btn btn-default account_type choosebtn">CNY</button>
                          <!-- <button type="button" class="btn btn-default account_type">USD</button> -->
                        </div>
                    </div>
                </div>
                <input type="hidden" name="account_type" id="account_type">
                <span class="help-block"><span class="hongtext12">*必选</span></strong><span class="text12">币种</span></span>
            </td>
          </tr>
          <tr>
            <td height="44" align="right" valign="top" class="text12"><strong>发卡银行：</strong></td>
            <td align="left" valign="top" class="text12">
                <div class="row">
                    <div class="col-sm-3">
                        <select name="bank_id" id="select" class="form-control">
                          <option value="">-请选择银行-</option>
                          @foreach($banks as $bank)
                          <option value="{{$bank->id}}">{{$bank->name}}</option>
                          @endforeach
                        </select>
                        <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">开户行</span></span>
                    </div>
                    <div class="col-sm-4">
                        <input name="account_city" type="text" class="form-control" id="account_city" placeholder="请填写开户区域/城市"/>
                        <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">区域/城市</span></span>
                    </div>
                    <div class="col-sm-4">
                        <input name="account_branch" type="text" class="form-control" id="account_branch" placeholder="请填写开户支行"/>
                        <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">支行名称</span></span>
                    </div>
               </div>
            </td>
          </tr>
          <tr>
            <td height="44" align="right" valign="top" class="text12"><strong>账户：</strong></td>
            <td align="left" valign="top" class="text12">
                <div class="row">
                    <div class="col-sm-4">
                        <input name="account_name" type="text" class="form-control" id="account_name" placeholder="请填写户名"/>
                        <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">户名</span></span>
                    </div>
                    <div class="col-sm-4">
                        <input name="account_number" type="text" class="form-control" id="account_number" placeholder="请填写银行帐号"/>
                        <span class="help-block"><span class="hongtext12">*必填</span></strong><span class="text12">银行帐号</span></span>
                    </div>
               </div>
           </td>
          </tr>
          <tr>
            <td height="44" align="right" valign="top" class="text12"><strong>银行卡：</strong></td>
            <td align="left" valign="top" class="text12">
                <div class="row">
                    <div class="col-lg-5">
                      <input id="uploadfront" name="uploadimg" type="file" multiple class="file" data-overwrite-initial="false">
                    </div>
                    <div class="col-lg-5">
                      <input id="uploadback" name="uploadimg" type="file" multiple class="file" data-overwrite-initial="false">
                    </div>
                 </div>
           </td>
          </tr>
          <input type="hidden" class="wenkuang" id="codecopy" name="codecopy" value="-1"/>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogelan">
          <tr>
            <td width="500" height="10" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="38" align="center" class="text12">
              <input name="agree1" type="checkbox" class="fukuang" id="agree1" />
              同意『开户协议』
              <input name="agree2" type="checkbox" class="fukuang" id="agree2" />
              同意『风险披露声明』
              <input name="agree3" type="checkbox" class="fukuang" id="agree3" />
            同意『免责声明』</td>
          </tr>
          <tr>
            <input type="hidden" name="frontimg">
            <input type="hidden" name="backimg">
            <input type="hidden" name="idfront">
            <input type="hidden" name="idback">
            <td height="53" align="center" class="text12">
                <button type="submit" class="btn btn-primary">接受以上协议并注册</button>
            </td>
          </tr></table>
        </span>
       </td>
    </tr>
  </table>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr></tr>
    <tr>
      <td height="5"><img src="images/top3.jpg" width="1100" height="5" /></td>
    </tr>
  </table>
      {{ csrf_field() }}
      </fieldset>
    </form>
  <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr></tr>
    <tr>
      <td height="12"></td>
    </tr>
  </table>
</div>
<script src="{{env('APP_URL')}}/js/jquery-1.9.0.min.js"></script>
<!-- <script src="{{env('APP_URL')}}/js/bootstrap.min.js"></script> -->
<script src="{{env('APP_URL')}}/js/bootstrap-datetimepicker.min.js"></script>
<script src="{{env('APP_URL')}}/js/layer/layer.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
<script type="text/javascript" src="{{env('APP_URL')}}/js/tcal.js"></script>
<script src="{{env('APP_URL')}}/js/fileinput.js"></script>
<script src="{{env('APP_URL')}}/js/common/uploadimg.js"></script>
<script type="text/javascript" src="{{env('APP_URL')}}/js/jquery.validate.min.js"></script>
<script>
var browser = BrowserType();
if (browser == 'IE8'||browser == 'IE7') {
    layer_alert('本网站兼容性要求ie8以上版本,为了您的使用体验,建议使用谷歌,火狐等浏览器');
}
var countdown=60;
uploadInit('uploadfront', '银行卡正面', 'frontimg')
uploadInit('uploadback', '银行卡反面', 'backimg')
uploadInit('idfront', '身份证正面', 'idfront')
uploadInit('idback', '身份证反面', 'idback')
$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
});
$(document).ready(function(){
    $("#form").validate({
        rules: {
            firstname: "required",
            // lastname: "required",
            idcountry: "required",
            idnum: "required",
            tel: {
                required: true,
                number:true
            },
            email: {
                required: true,
                email: true
            },
            code: {
                required: true,
                equalTo: "#codecopy"
            },
            password: {
                required: true,
                equalTo: "#password2"
            },
            password2: {
                required: true,
                equalTo: "#password"
            },
            bank_id: "required",
            account_city: "required",
            account_branch: "required",
            account_name: "required",
            account_number: "required",
            agree1: "required",
            agree2: "required",
            agree3: "required",
        },
        messages: {
            firstname: "",
            // lastname: "",
            idcountry: "",
            idnum: "",
            tel: "",
            email: "",
            code: "",
            bank_id: "",
            account_city: "",
            account_branch: "",
            account_name: "",
            account_number: "",
            password: "",
            password2: "",
            agree1: "",
            agree2: "",
            agree3: "",
        },
    });
    $(".idtype").click(function () {
        $("#id_type").val($(this).text())
        if ($(this).text() == '大陆身份证') { //todo
            $(".country").val('中国') // todo
        } else {
            $(".country").val('') // todo
        }
        $(".idtype").removeClass('choosebtn')
        $(this).addClass('choosebtn')
    })
    $(".sex").click(function () {
        $("#sex").val($(this).text())
        $(".sex").removeClass('choosebtn')
        $(this).addClass('choosebtn')
    })
    $(".account_type").click(function () {
        $("#account_type").val($(this).text())
        $(".account_type").removeClass('choosebtn')
        $(this).addClass('choosebtn')
    })
    $(".usetype").click(function () {
        var sim = $(this).data('sim')
        if (sim) {
            var son = $("#sim1").children("button:first-child")
            groupthis(son)
            $("#maininfo").show()
            $("#accountinfo").show()
            $("#nreal-btn").hide()
            $("#sim1").show()
            $("#sim0").hide()
        } else {
            var son = $("#sim0").children("button:first-child")
            groupthis(son)
            $("#maininfo").hide()
            $("#accountinfo").hide()
            $("#nreal-btn").show()
            $("#sim0").show()
            $("#sim1").hide()
        }
        // 1真实 0模拟
        $("#usetype").val(sim)
        $(".usetype").removeClass('choosebtn')
        $(this).addClass('choosebtn')
    })

    $(".group").click(function () {
        groupthis(this)
    })

})
function groupthis (v) {
    $("#group").val($(v).text())
    $(".group").removeClass('choosebtn')
    $(v).addClass('choosebtn')
}
function sendcode(obj) {
    var re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
    if (!re.test($("#email").val())) {
        layer.msg('请输入正确邮箱格式')
        $("#email").focus()
        return
    }
    // fetch('/sendcode', {
    //     method: "POST",
    //     headers: {
    //         "Content-Type": "application/json"
    //     },
    //     body: JSON.stringify({ email: $("#email").val() })
    // }).then(function(response) {
    //     return response.json();
    // }).then(function(data) {
    //     if (data.status) {
    //         $("#codecopy").val(data.data)
    //     } else {
    //         layer.msg(data.data)
    //     }
    // }).catch(function(e) {
    //     layer.msg(e.message)
    // });
    $.ajax({
         type:'post',
         url:'/sendcode',
         data:{ email: $("#email").val() },
         cache:false,
         dataType:'json',
         success:function(data){
             if (data.status) {
                 $("#codecopy").val(data.data)
             } else {
                 layer.msg(data.data)
                 countdown = 0
             }
         },
         error:function(e) {
             console.log(e)
         }
    });
    settime(obj)
}
function submit () {
    if (valid()) {
        $("#form").submit()
    }
}
function valid () {
    if ($("#code").val() != $("#codecopy").val()) {
        layer.msg('验证码不正确')
        return false
    }
    return true
}
function settime(obj) {
    if (countdown == 0) {
        obj.removeAttribute("disabled");
        obj.value="获取验证码";
        countdown = 60;
        return;
    } else {
        obj.setAttribute("disabled", true);
        obj.value="重新发送(" + countdown + ")";
        countdown--;
    }
setTimeout(function() {
    settime(obj) }
    ,1000)
}
</script>
@include('part.footer')
