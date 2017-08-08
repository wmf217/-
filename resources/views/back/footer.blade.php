</section>
</body>
</html>
<script src="{{env('APP_URL')}}/js/back/app.v2.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
<script src="{{env('APP_URL')}}/js/layer/layer.js"></script>
<!-- <script src="{{env('APP_URL')}}/js/ztree/js/jquery.ztree.core.js"></script> -->
<script>
 $(document).ready(function () {
     setTimeout(function() {
         checkUn();
     }, 1000);
});
function addMsg($msg, $total) {
    var $el = $('.nav-user'), $n = $('.count:first', $el), $v = parseInt($n.text());
    $('.count', $el).fadeOut().fadeIn().text($total);
    $el.find('.list-group').html('');
    $($msg).hide().prependTo($el.find('.list-group')).slideDown().css('display', 'block');
}
function getMsg(u = 0,inner = 0,outer = 0, t = 0, c = 0, a =0) {
    $u = cHtml('用户', u, '/back/mix/0/ucheck')
    $inner = cHtml('入金', inner, '/back/mix/0/incheck')
    $outer = cHtml('出金', outer, '/back/mix/0/outcheck')
    $t = cHtml('转户', t, '/back/mix/0/tcheck')
    $c = cHtml('佣金提取', c, '/back/mix/0/ccheck')
    $a = cHtml('代理申请', a, '/back/mix/0/acheck')
    return $u + $inner + $outer + $t + $c + $a;
}
function cHtml($name, $num, $url){
    if ($num == 0) {
        return "";
    }
    var $msg = '<a href="'+$url+'" class="media list-group-item">' +
               '<span class="pull-left thumb-sm text-center">' +
               '<i class="fa fa-check fa-2x text-success"></i>' +
               '</span>' +
               '<span class="media-body block m-b-none">' + $name +
               '待审核'+$num+'条<br>' +
               '<small class="text-muted">1 minutes ago</small>' +
               '</span>' +
               '</a>';
    return $msg;
}
function checkUn () {
    fetch('/back/home/uncheck',{
        credentials: 'include'
    }).then(function(res){
        return res.json()
    }).then(function(data){
        if (data.status) {
            let num = data.data
            addMsg(getMsg(num.user,num.in,num.out,num.t,num.c,num.a), num.total)
            setTimeout(function() {
                checkUn()
            }, 60000);
        } else {
            layer.msg(data.data)
        }
    })
}
</script>
