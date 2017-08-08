@include('part.header')
<style>
.toggle {
    color: black;
    width: 10px;
    height: 3px;
    display: block;
    float: left;
}
.togglenone {
    width: 10px;
    height: 3px;
    display: block;
    float: left;
}
</style>
<div class="zhong">
  <table width="1100" border="0" background="{{env('APP_URL')}}/images/top2.jpg" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="246" valign="top"><table width="1080" border="0" align="center" cellpadding="0" cellspacing="0" class="lantiao">
        <tr>
          <td width="12" height="54">&nbsp;</td>
          <td width="490" align="left" valign="middle"><span class="lan">下线账户</span><br />
            <span class="lanying">Offline account</span></td>
        </tr>
      </table>

        <table width="1080"  height="10" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td></td>
          </tr>
        </table>
        <table width="1080" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="508" height="343" align="center" valign="top">
            <table width="1080" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  background="{{env('APP_URL')}}/images/xiaxian.jpg">
                <tr>
                <td width="143" height="36" align="center" valign="middle" class="baitext"><strong>账户</strong></td>
                <td width="195" align="center" valign="middle" class="baitext"> <strong> 账户性质</strong></td>
                <td width="183" align="center" valign="middle" class="baitext"><strong>历史交易</strong></td>
                <td width="178" align="center" valign="middle" class="baitext"><strong>成交量 </strong></td>
                <td width="208" align="center" valign="middle" class="baitext"><strong> 余额</strong></td>
                <td width="173" align="center" valign="middle" class="baitext"><strong>净值</strong></td>
                </tr>
            </table>
              <table width="1080" border="0" cellpadding="0" cellspacing="0" class="biaogedilan">
                <tr>
                  <td>
                      <span id="user_{{Auth::id()}}" style="display:none">
                          <span id="see_{{Auth::id()}}" data-agent="1" data-level="0"></span>
                      </span>
                  </td>
               </tr>
             </table>



              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogelan">
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

</div>
<script>
const APP_URL = "{{env('APP_URL')}}"
const mid = "{{Auth::id()}}"
const colors = ['#f7f7f7', '#f7f7f7', '#FFFACD', '#FFE1FF', '#66ffcc', '#66ffff', '#66ccff', '#6699ff', '#6666ff']
$(document).ready(function(){
    seeOffline(mid)
})
function seeOffline (id) {
    // console.log($("#see_" + id).data('level'))
    if(!$("#see_" + id).data('agent')) { // 不是代理返回
        return
    }
    fetch('/agent/offline/async/' + id, {
        credentials: "include"
    }).then(function(response) {
        return response.json();
    }).then(function(data) {
        if (data.length) {
            $("#see_" + id).text('-')
            $("#see_" + id).attr('onclick', 'closeOffline('+id+')')
            $("#seeimg_" + id).attr('onclick', 'closeOffline('+id+')')
        }
        let level = $("#see_" + id).data('level') + 1
        // console.log(level + 'px')
        data.forEach((v) => {
            $("#user_" + id).after(afterHtml(v, id, level))
        })
    }).catch(function(e) {
        console.log(e);
    });
}
function closeOffline (id) {
    $("#see_" + id).text('+')
    $("#see_" + id).attr('onclick', 'seeOffline('+id+')')
    $("#seeimg_" + id).attr('onclick', 'seeOffline('+id+')')
    $('.son').each(function (k, v) {
        let pid = $(v).data('father')
        let sid = $(v).data('id')
        if (pid == id) {
            $(v).hide()
            closeOffline (sid)
        }
    })
    // console.log(id)
}
function afterHtml (data,fid,level) {
    let account = data.is_agent?'代理账户':'普通账户'
    data.orderhand = !!data.orderhand?data.orderhand: ' --'
    data.ordernum = !!data.ordernum?data.ordernum: ' --'
    let html = '<table width="1078" border="0" align="center" cellpadding="0" class="son" cellspacing="1" data-id="' + data.id + '" data-father="'+fid+'" id="user_' + data.id + '" c="c"><tr>'
    html += '<td width="141" height="45" align="right" valign="middle" bgcolor="'+colors[level]+'" class="text12">'
    html += '<div id="div_' + data.id + '" style="margin-left:'+level*0+'px;">'
    html += '<table width="20" border="0" align="left" cellpadding="0" cellspacing="0"><tr><td width="20" height="29" align="center" valign="middle" class="baitext">'
    // 点击按钮
    if (data.is_agent) {
        html += '<span class="toggle" id="see_' + data.id + '" data-agent="1" data-level="'+level+'" onclick="seeOffline(' + data.id + ')">+</span>'
    } else {
        html += '<span class="togglenone" id="see_' + data.id + '" data-agent="0"></span>'
    }
    html += '<strong><img src="' + APP_URL + '/images/xia.png" id="seeimg_' + data.id + '" width="31" height="31" onclick="seeOffline(' + data.id + ')"/></strong>'

    // 点击按钮end
    html += '</td></tr></table>'
    html += '<table width="58" border="0" align="left" cellpadding="0" cellspacing="0"><tr><td width="58" align="center" class="text12"><strong>'+data.name+'</strong></td></tr></table>'
    html += '</div>'

    html += '<br/></td><td width="194" align="left" valign="middle" bgcolor="'+colors[level]+'" class="text12"><table width="100" border="0" align="center" cellpadding="0" cellspacing="0"><tr>'
    html += '<td align="center" bgcolor="#f0433d" class="baitext"><strong>'+account+'</strong></td></tr></table></td>'
    html += '<td width="180" align="center" valign="middle" bgcolor="'+colors[level]+'" class="text12"><strong><span class="lutext12">$'+ data.ordernum +'</span></strong> '+ data.ordercount +' 笔</td>'
    html += '<td width="179" align="center" valign="middle" bgcolor="'+colors[level]+'" class="text12">'+ data.orderhand +' 手</td>'
    html += '<td width="205" align="center" valign="middle" bgcolor="'+colors[level]+'" class="text12">$'+ data.balance +' </td>'
    html += '<td width="172" align="center" valign="middle" bgcolor="'+colors[level]+'" class="text12"><strong><span class="jutext12">$'+ data.netvalue +'</span></strong></td>'
    return html
}
</script>
@include('part.footer')
