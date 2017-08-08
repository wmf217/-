/*
*
* Credits to http://css-tricks.com/long-dropdowns-solution/
*
*/

var maxHeight = 400;

$(function(){

    $(".dropdown > li").hover(function() {

         var $container = $(this),
             $list = $container.find("ul"),
             $anchor = $container.find("a"),
             height = $list.height() * 1.1,       // make sure there is enough room at the bottom
             multiplier = height / maxHeight;     // needs to move faster if list is taller

        // need to save height here so it can revert on mouseout
        $container.data("origHeight", $container.height());

        // so it can retain it's rollover color all the while the dropdown is open
        $anchor.addClass("hover");

        // make sure dropdown appears directly below parent list item
        $list
            .show()
            .css({
                paddingTop: $container.data("origHeight")
            });

        // don't do any animation if list shorter than max
        if (multiplier > 1) {
            $container
                .css({
                    height: maxHeight,
                    overflow: "hidden"
                })
                .mousemove(function(e) {
                    var offset = $container.offset();
                    var relativeY = ((e.pageY - offset.top) * multiplier) - ($container.data("origHeight") * multiplier);
                    if (relativeY > $container.data("origHeight")) {
                        $list.css("top", -relativeY + $container.data("origHeight"));
                    };
                });
        }

    }, function() {

        var $el = $(this);

        // put things back to normal
        $el
            .height($(this).data("origHeight"))
            .find("ul")
            .css({ top: 0 })
            .hide()
            .end()
            .find("a")
            .removeClass("hover");

    });
});

function jsonToArray(json){
	return eval('('+json+')');
}

function layer_alert(msg,func){
	layer.open({
		title:null,
		content:msg,
		closeBtn:0,
		"yes":function(index,layero){
			if(typeof(func)=='function'){
				func();
			}
			layer.close(index);
		}
	});
}

function layer_confirm(msg,func){
	layer.open({
		title:false,
    	content:msg,
		closeBtn:0,
    	btn: ['确认', '取消'],
    	yes:function(index,layero){
    		if(typeof(func)=='function'){
    			func();
    		}
    		layer.close(index);
    	},
    	cancel:function(index,layero){
    		layer.close(index);
    	}
    });
}

function layer_iframe(title,url,setting){
	layer.open($.extend({
	    type: 2,
	    title:title,
	    area: ['90%', '90%'],
	    fixed: true, //不固定
	    maxmin: false,
	    scrollbar: false,
	    shadeClose: true,
	    move: false,
	    content:url
    },setting));
}

function formatDate(nS) {
   return new Date(parseInt(nS) * 1000).toLocaleString().replace(/:\d{1,2}$/,' ');
}

function dataTableSetting(){
	return  baseSetting = {
		"searching": true, //是否开启搜索
		"serverSide": true,//开启服务器后台分页
		"processing": true,
		"ordering":false,
        "paging": true,
        "pagingType": "simple_numbers",
        "lengthMenu": [10, 20],
        "autoWidth": true,
        "language": {
            "url": "/json/datatables-zh-cn-result.json",
            "processing": "正在加载中。。。",
        },
        "columnDefs": [
			{ "orderable": false }
		],
	};
}

function BrowserType()
{
     var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
     var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
     var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
     var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1 && !isIE; //判断是否IE的Edge浏览器
     var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器
     var isSafari = userAgent.indexOf("Safari") > -1 && userAgent.indexOf("Chrome") == -1; //判断是否Safari浏览器
     var isChrome = userAgent.indexOf("Chrome") > -1 && userAgent.indexOf("Safari") > -1; //判断Chrome浏览器

     if (isIE)
     {
          var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
          reIE.test(userAgent);
          var fIEVersion = parseFloat(RegExp["$1"]);
          if(fIEVersion == 7)
          { return "IE7";}
          else if(fIEVersion == 8)
          { return "IE8";}
          else if(fIEVersion == 9)
          { return "IE9";}
          else if(fIEVersion == 10)
          { return "IE10";}
          else if(fIEVersion == 11)
          { return "IE11";}
          else
          { return "0"}//IE版本过低
      }//isIE end

      if (isFF) {  return "FF";}
      if (isOpera) {  return "Opera";}
      if (isSafari) {  return "Safari";}
      if (isChrome) { return "Chrome";}
      if (isEdge) { return "Edge";}
 }//myBrowser() end
