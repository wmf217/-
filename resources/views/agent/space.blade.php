@include('part.header')
<!-- <div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="jutiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="ju">仓位总结</span><br />
            <span class="juying">Position Summary</span></td>
          <td width="578" align="right" valign="middle"><a href="#"><img src="{{env('APP_URL')}}/images/geng.jpg" width="106" height="24" /></a></td>
        </tr>
      </table>

        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="508" height="343" align="center" valign="top"><table width="1080" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="491" height="43" ><span class="texthui">日期：</span>
                    <input name="textfield5" type="text" id="textfield5" value="从" />
                    -
                  <input name="textfield5" type="text" id="textfield6" value="到" /></td>
                  <td width="589" >&nbsp;</td>
                </tr>
              </table>
              <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="43" align="left" class="text12"><a href="#"><img src="{{env('APP_URL')}}/images/sst.jpg" width="97" height="24" /></a></td>
                </tr>
              </table>
              <table width="1080"  height="19" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="19"></td>
                </tr>
              </table>
              <table width="1080" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  background="{{env('APP_URL')}}/images/changwei.jpg">
                <tr>
                <td width="112" height="36" align="center" valign="middle" class="baitext"><strong>账户</strong></td>
                <td width="123" align="center" valign="middle" class="baitext"> <strong> 交易	</strong></td>
                <td width="78" align="center" valign="middle" class="baitext"><strong>佣金</strong></td>
                <td width="83" align="center" valign="middle" class="baitext"><strong>利息</strong></td>
                <td width="102" align="center" valign="middle" class="baitext"><strong> 成交量</strong></td>
                <td width="157" align="center" valign="middle" class="baitext"><strong>入金</strong></td>
                <td width="174" align="center" valign="middle" class="baitext"><strong>出金</strong></td>
                <td width="129" align="center" valign="middle" class="baitext"><strong>信用</strong></td>
                <td width="122" align="center" valign="middle" class="baitext"><strong>净入金</strong></td>
                </tr>
            </table>
              <table width="1080" border="0" cellpadding="0" cellspacing="0" class="biaogediju">
                <tr>
                  <td><div id="masterdiv">
                    <div class="menutitle" onclick="SwitchMenu('sub1')">
                      <table width="1078" border="0" align="center" cellpadding="0" cellspacing="1" id="52" bgcolor="#FFFFFF" c="c">
                        <tr>
                          <td width="110" height="45" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="20" border="0" align="left" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="20" height="29" align="center" valign="middle" class="baitext"><strong><img src="{{env('APP_URL')}}/images/touxiang.jpg" width="20" height="17" /></strong></td>
                            </tr>
                          </table>
                            <table width="52" border="0" align="left" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="52" align="center" class="text12"><strong>8900001</strong></td>
                              </tr>
                            </table>
                            <table width="20" border="0" align="left" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="20" height="29" align="center" valign="middle" class="baitext"><img src="{{env('APP_URL')}}/images/san.png" width="10" height="8" /></td>
                              </tr>
                            </table>
                            <br /></td>
                          <td width="120" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="hong">$2,956.00 </span></strong>219 笔</td>
                          <td width="78" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"> $0.00 </td>
                          <td width="81" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">$0.00 </td>
                          <td width="101" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">8400.00 手</td>
                          <td width="157" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="lutext12">$11,321.00</span></strong> 7 笔</td>
                          <td width="173" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="hongtext12">$-277.00</span></strong> 5 笔</td>
                          <td width="127" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="jutext12">$0.00</span></strong> 0 笔</td>
                          <td width="121" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="78" bordercolor="#5cb85c" border="1" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="74" height="30" align="center" class="lu"><strong>$11,044.00</strong></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table>
                    </div>
                    <span class="submenu" id="sub1">
                    <table width="1078" border="0" align="center" cellpadding="0" cellspacing="1" id="53" c="c">
                      <tr>
                        <td width="110" height="45" align="right" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="58" border="0" align="right" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="58" align="center" class="text12"><strong>8900001</strong></td>
                            </tr>
                          </table>
                        <br /></td>
                        <td width="120" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="hong">$2,956.00 </span>219 笔</strong></td>
                        <td width="78" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"> $0.00 </td>
                        <td width="81" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">$0.00 </td>
                        <td width="101" align="center" valign="middle" bgcolor="#f7f7f7" class="text12">8400.00 手</td>
                        <td width="157" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="lutext12">$11,321.00</span></strong> 7 笔</td>
                        <td width="173" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="hongtext12">$-277.00</span></strong> 5 笔</td>
                        <td width="127" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><strong><span class="jutext12">$0.00</span></strong> 0 笔</td>
                        <td width="123" align="center" valign="middle" bgcolor="#f7f7f7" class="text12"><table width="78" bordercolor="#5cb85c" border="1" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="74" height="30" align="center" class="lu"><strong>$11,044.00</strong></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table></td>
                </tr>
              </table>

              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogeju">
                <tr>
                  <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
                </tr>
            </table></td>
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
</div> -->
@include('part.footer')
