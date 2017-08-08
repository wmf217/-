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
            <td width="508" height="343" align="center" valign="top">
               <table width="1080"  height="12" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="12"></td>
                </tr>
              </table>
              <table width="1080" border="0" align="center" cellpadding="0" cellspacing="1"  id="5423" c="c">
                <tr>
                  <td width="194" height="159" align="center" valign="top" class="text12"><table width="193" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="193" height="159" align="center" valign="middle"><img src="{{env('APP_URL')}}/images/yhkz.jpg" width="140" height="159" /></td>
                    </tr>
                  </table>
                  </td>
                  <td width="883" align="center" valign="top" class="text12">
                    <table width="880" height="41" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#f04741">
                    <tr>
                      <td width="276" height="36" align="center" valign="middle" class="baitext"><strong>发卡银行</strong></td>
                      <td width="176" align="center" valign="middle" class="baitext"><strong> 银行帐号</strong></td>
                      <td width="142" align="center" valign="middle" class="baitext"><strong>户名 </strong></td>
                      <td width="192" align="center" valign="middle" class="baitext"><strong>操作</strong></td>
                      <td width="94" align="center" valign="middle" class="baitext"><table width="86" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                           <td width="86" height="32" align="center" class="baitext"><a href="/user/bank"><button type="button" class="btn btn-warning">添 加</button></a></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                  @forelse(Auth::user()->account as $account)
                    <table width="880" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogedihong" id="5" c="c">
                      <tr>
                        <td width="82" height="45" align="center" valign="middle" class="text12"><img src="{{$account->bank->img or ''}}" width="70" height="25" /><br /></td>
                        <td width="187" align="left" valign="middle" class="text12">
                            <div id="layer-photos-{{$account->id}}" class="layer-photos-demo">
                              <img layer-src="{{$account->frontimg or '/images/default.png'}}" src="/images/frontimg.jpg" alt="正面">
                              <img layer-src="{{$account->backimg or '/images/default.png'}}" src="/images/backimg.jpg" alt="反面">
                            </div>
                        </td>
                        <td width="179" align="center" valign="middle" class="text12">{{$account->account_number}}</td>
                        <td width="140" align="center" valign="middle" class="text12">{{$account->account_name}}</td>
                        <td width="193" align="center" valign="middle" class="text12">
                            <button type="button" class="btn btn-danger del" data-id="{{$account->id}}">删除</button>
                        </td>
                        <td width="90" align="center" valign="middle" class="text12">&nbsp;</td>
                      </tr>
                  </table>
                  @empty
                    暂无数据
                  @endforelse
                  <table width="880" border="0" align="center" cellpadding="0" cellspacing="1" class="biaogehong">
                    <tr>
                      <td width="500" height="1" align="left" valign="middle" bgcolor="#FFFFFF" class="text12"></td>
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
<script>
var id = '';
$(document).ready( function (){
    $(".del").click( function () {
        id=$(this).data('id');
        layer.msg('确定删除吗', {
          time: 0 //不自动关闭
          ,btn: ['是', '否']
          ,yes: function(index){
             del()
             layer.close(index);
          }
        });
    })
    $(".layer-photos-demo").each(function(k,v){
        var id = $(v).attr("id")
        layer.photos({
            photos: '#' + id
        });
    })
})
function del () {
    var url='/user/banks/'+id;
    // fetch(url, {method:'DELETE',credentials: "include"}).then(function(response) {
    //     return response.json();
    // }).then(function(data) {
    //     if(data.status){
    //         history.go(0)
    //     }else{
    //         layer.msg(data.msg)
    //     }
    // }).catch(function(e) {
    //     console.log(e);
    // });
    layer.load()
    $.ajax({
        type: 'DELETE',
        url: url,
        success: function (data) {
            layer.closeAll('loading')
            if(data.status){
                history.go(0)
            }else{
                layer.msg(data.msg)
            }
        },
        error : function() {
            layer.msg('删除错误请重试')
        }
    });
}
</script>
@include('part.footer')
