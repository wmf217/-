@include('part.header')

<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top">
          <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
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
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1"  id="542" c="c">
                <tr>
                  <td width="194" height="388" align="center" valign="top" class="text12"><table width="193" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="193" height="360" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/w1.jpg" width="140" height="159" /></td>
                      </tr>
                  </table>                    <br /></td>
                  <td width="883" align="center" valign="top" class="text12"><table width="871" height="50" border="0" align="center" cellpadding="0" cellspacing="0"   bgcolor="#5db75d">
                    <tr>
                      <td width="160" height="50" align="center" valign="middle" class="baitext"><strong class="baitext14">账号： {{Auth::user()->name}} </strong></td>
                      <td width="593" align="right" valign="middle" class="baitext">&nbsp;</td>
                      <td width="117" align="center" valign="middle" class="baitext"><table width="77" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="77" align="center" bgcolor="#f0433d" class="baitext"><a href="/user/password"><button type="button" class="btn btn-danger">更改密码</button></a></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                    <!-- <table width="868" border="0" align="center" cellpadding="0" cellspacing="0" class="biaogedilu1">
                      <tr>
                        <td height="40" align="center" valign="top" class="baitext"><table width="868" border="0" cellpadding="0" cellspacing="0" class="luxian2">
                          <tr>
                            <td width="157" height="39" align="center" valign="middle" class="text14chu"><strong>杠杆：	1:600 </strong></td>
                            <td width="595" align="left" valign="middle">&nbsp;</td>
                            <td width="116" align="right" valign="middle"><table width="77" border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="77" align="center" bgcolor="#5db75d" class="baitext"><a href="/user/heaver"><button type="button" class="btn btn-success">更改杠杆</button></a></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table> -->
                    <table width="870" border="0" align="center" cellpadding="0" cellspacing="0" class="luxian1">
                      <tr>
                        <td width="496" height="174" align="left" valign="top" class="baitext"><table width="245" height="47" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="75" align="center" valign="middle" class="text12"><strong>&nbsp;&nbsp;姓名：</strong></td>
                            <td width="170" align="left" class="text12">{{Auth::user()->fullname}}</td>
                          </tr>
                        </table>
                          <table width="245" height="39" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="75" height="39" align="center" valign="middle" class="text12"><strong>&nbsp;&nbsp;组：</strong></td>
                              <td width="170" align="left" class="text12">{{Auth::user()->group}}</td>
                            </tr>
                        </table>
                          <table width="336" height="38" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="76" height="38" align="center" valign="middle" class="text12"><strong>&nbsp;&nbsp;手机：</strong></td>
                              <td width="126" align="left" class="text12">{{Auth::user()->tel}}</td>
                              <td width="134" align="left" class="text12"><table width="84" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="32" align="center" class="baitext"><a href="/user/phone"><button type="button" class="btn btn-warning">更   改</button></a></td>
                                </tr>
                              </table></td>
                            </tr>
                          </table>
                          <table width="336" height="44" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="77" height="44" align="center" valign="middle" class="text12"><strong>&nbsp;&nbsp;电邮：</strong></td>
                              <td width="125" align="left" class="text12">{{Auth::user()->email}}</td>
                              <td width="134" align="left" class="text12"><table width="84" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <!-- <td height="32" align="center" bgcolor="#45bcdf" class="baitext"><a href="/user/email"><strong>更   改</strong></a></td> -->
                                </tr>
                              </table>
                              </td>
                            </tr>
                        </table>
                          <table width="496" border="0" cellspacing="0" cellpadding="0" height="2" class="luxian">
                            <tr>
                              <td></td>
                            </tr>
                        </table></td>
                        <td width="372" rowspan="2" align="center" valign="bottom" class="baitext"><table width="372" border="0" cellpadding="0" cellspacing="0" class="luzuoxian">
                          <tr align="center" valign="middle">
                            <td height="407" valign="top"><table width="372" height="406" border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                <td height="171" colspan="2" align="center" class="baitext"><table width="148" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="148" height="166" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/w2.jpg" width="140" height="159" /></td>
                                  </tr>
                                </table></td>
                              </tr>
                              <tr>
                                <td width="180" height="120" align="center" bgcolor="#eeeeee" class="baitext"><table width="160" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="47" height="65" align="right" valign="middle"><img src="{{env('APP_URL')}}/images/z1.png" width="47" height="39" /></td>
                                    <td width="113" align="center" valign="middle"><span class="hong">余额</span><br />
                                      <span class="text16"><strong>${{Auth::user()->balance}}</strong></span></td>
                                  </tr>
                                </table></td>
                                <td width="187" align="center" bgcolor="#f7f7f7" class="baitext"><table width="160" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="47" height="65" align="right" valign="middle"><img src="{{env('APP_URL')}}/images/z2.png" width="47" height="39" /></td>
                                    <td width="113" align="center" valign="middle"><span class="lan">净值</span><br />
                                      <span class="text16"><strong>${{Auth::user()->netvalue}}</strong></span></td>
                                  </tr>
                                </table></td>
                              </tr>
                              <tr>
                                <td height="120" align="center" bgcolor="#f7f7f7" class="baitext"><table width="160" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="47" height="65" align="right" valign="middle"><img src="{{env('APP_URL')}}/images/z3.png" width="47" height="39" /></td>
                                    <td width="113" align="center" valign="middle"><span class="ju">保证金</span><br />
                                      <span class="text16"><strong>${{Auth::user()->assurevalue}}</strong></span></td>
                                  </tr>
                                </table></td>
                                <td align="center" bgcolor="#eeeeee" class="baitext"><table width="160" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="47" height="65" align="right" valign="middle"><img src="{{env('APP_URL')}}/images/z4.png" width="47" height="39" /></td>
                                    <td width="113" align="center" valign="middle"><span class="lu">可用金</span><br />
                                      <span class="text16"><strong>${{Auth::user()->vailable}}</strong></span></td>
                                  </tr>
                                </table></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td height="237" align="left" valign="top" class="baitext"><table width="389" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="632" height="84" align="left" valign="middle" class="huizi14"><table width="72" border="0" align="left" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="72" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/ww1.jpg" width="48" height="48" /></td>
                                </tr>
                              <tr>
                                <td align="center" valign="middle" class="lu">资产</td>
                                </tr>
                              </table>
                              <table width="317" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="150" height="40"><table width="120" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td height="34" align="left"><strong>余额：</strong><span class="lu">${{Auth::user()->balance}}</span></td>
                                      </tr>
                                    </table></td>
                                  <td width="167"><table width="120" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td height="36" align="left"><strong class="text12">净值：</strong><span class="ju">${{Auth::user()->netvalue}}</span></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                                <tr>
                                  <td height="44"><table width="125" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                      <td height="34" align="left"><strong class="text12">保证金：</strong><span class="lan">${{Auth::user()->assurevalue}}</span></td>
                                      </tr>
                                    </table></td>
                                  <td><table width="177" border="0" align="left" cellpadding="0" cellspacing="0">
                                      <tr>
                                      <td width="177" height="34" align="left"><strong class="text12">可用金：</strong><span class="hong">${{Auth::user()->vailable}}</span></td>
                                      </tr>
                                    </table></td>
                                  </tr>
                              </table></td>
                            </tr>
                          </table>
                          <table width="383" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="383" height="76" align="left" valign="middle" class="huizi14"><table width="72" border="0" align="left" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="72" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/ww2.jpg" width="48" height="48" /></td>
                                  </tr>
                                <tr>
                                  <td align="center" valign="middle" class="lu">开户日期</td>
                                  </tr>
                                </table>
                                <table width="136" border="0" align="left" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="136" height="66" align="left" class="text14chu"><strong class="text12">2016-09-15</strong></td>
                                  </tr>
                                </table>
                                <table width="136" border="0" align="left" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="136" height="66" align="left" class="text14chu">
                                        <!-- <img src="{{env('APP_URL')}}/images/er.jpg" width="76" height="76" /> -->
                                    </td>
                                  </tr>
                                </table></td>
                            </tr>
                          </table>
                          <table width="495" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="495" height="77" align="left" valign="middle"><table width="63" border="0" align="left" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="63" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/ww3.jpg" width="48" height="48" /></td>
                                  </tr>
                                <tr>
                                  <td align="center" valign="middle" class="lu">推广链接</td>
                                  </tr>
                                </table>
                                <table width="424" border="0" align="left" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="424" height="77" align="left" class="text14chu"><p class="texthui1"><strong class="text12">代理推广链接：{{env('APP_URL')}}/register?agent={{Auth::id()}}</strong></p></td>
                                  </tr>
                                </table></td>
                            </tr>
                        </table></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
                </td>
                </tr>
              </table>
              <table width="1080"  height="12" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="12"></td>
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
</div>
@include('part.footer')
