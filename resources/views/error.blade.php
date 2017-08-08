@include('part.header')
<style type="text/css">
 .pagination{
padding: 2px;
}

.pagination ul{
margin: 0;
padding: 0;
text-align: left; /*Set to "right" to right align pagination interface*/
font-size: 16px;
}

.pagination li{
list-style-type: none;
display: inline;
padding-bottom: 1px;
}

.pagination a, .pagination a:visited{
padding: 0 5px;
border: 1px solid #3DB9DE;
text-decoration: none;
color: #3DB9DE;
}

.pagination a:hover, .pagination a:active{
border: 1px solid #2b66a5;
color: #000;
background-color: lightyellow;
}

.pagination li.currentpage{
font-weight: bold;
padding: 0 5px;
border: 1px solid navy;
background-color: #2e6ab1;
color: #<a href="http://www.nextcool.cn/firefox/firefox.htm" target="_blank">FF</a>F;
}

.pagination li.disablepage{
padding: 0 5px;
border: 1px solid #929292;
color: #929292;
}

.pagination li.nextpage{
font-weight: bold;
}

* html .pagination li.currentpage, * html .pagination li.disablepage{ /*IE 6 and below. Adjust non linked LIs slightly to account for bugs*/
margin-right: 5px;
padding-right: 0;
}
</style>
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="459" valign="top"><table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="1100" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="449" align="center"><table width="1100" border="0" align="center" cellpadding="0" cellspacing="0" style="border-bottom:1px solid #2db7f5;">
            <tr>
              <td height="286" align="center"><img src="{{env('APP_URL')}}/images/404.jpg" width="600" height="286" /></td>
            </tr>
          </table>
            <table width="1080"  height="107" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="107" align="center"><p><span class="text16">{{$err}}</span><br />
                  </p>
                  <table width="84" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="25" align="center" bgcolor="#2CB6F5" class="baitext14" ><a href="javascript:history.go(-1)"><strong>返回</strong></a></td>
                    </tr>
            </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>
@include('part.footer')
