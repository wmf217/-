function data () {
    main()
    week()
    objects()
    todo()
    honor()
}
function week () {
    fetch('/back/week',{
        method: 'post',
        credentials: 'include'
    }).then(function(res){
        return res.json()
    }).then(function(data){
        if (data.status) {
            let the = data.data
            chartWeek(the.dates, the.oNum, the.oHand, the.in, the.out)
        } else {
            layer.msg(data.data)
        }
    })
}
function main () {
    fetch('/back/home/main',{
        credentials: 'include'
    }).then(function(res){
        return res.json()
    }).then(function(data){
        if (data.status) {
            let the = data.data
            $("#netSum").text(the.netSum.toFixed(2))
            $("#date").text(the.date)
            $("span[data-target='#oCount']").attr("data-percent", the.oCount)
            $("span[data-target='#uCount']").attr("data-percent", the.uCount)
            easyPie();
        } else {
            layer.msg(data.data)
        }
    })
}
function objects () {
    fetch('/api/object',{
        credentials: 'include'
    }).then(function(res){
        return res.json()
    }).then(function(data){
        if (data.status) {
            let the = data.data
            chartObject(the.objects, the.oNum)
        } else {
            layer.msg(data.data)
        }
    })
}
function todo () {
    fetch('/back/home/uncheck',{
        credentials: 'include'
    }).then(function(res){
        return res.json()
    }).then(function(data){
        if (data.status) {
            let num = data.data
            $("#todo").html(getTodo(num.user,num.in,num.out,num.t,num.c,num.a))
        } else {
            layer.msg(data.data)
        }
    })
}
function honor () {
    fetch('/back/home/usere',{
        credentials: 'include'
    }).then(function(res){
        return res.json()
    }).then(function(data){
        if (data.status) {
            let datas = data.data
            $("#honor").html('')
            datas.forEach(({login, count}, k)=>{
                $("#honor").append('<tr><td class="text-warning">'+(k+1)+'</td><td class="text-warning">'+login+'</td><td class="text-warning">'+count+'</td></tr>');
            })
        } else {
            layer.msg(data.data)
        }
    })
}
function getTodo (u = 0,inner = 0,outer = 0, t = 0, c = 0, a = 0) {
    $u = todoHtml('用户', u, '/back/mix/0/ucheck')
    $inner = todoHtml('入金', inner, '/back/mix/0/incheck')
    $outer = todoHtml('出金', outer, '/back/mix/0/outcheck')
    $t = todoHtml('转户', t, '/back/mix/0/tcheck')
    $c = todoHtml('佣金提取', c, '/back/mix/0/ccheck')
    $a = todoHtml('代理申请', a, '/back/mix/0/acheck')
    return $u + $inner + $outer + $t + $c + $a;
}
function todoHtml($name, $num, $url){
    if ($num == 0) {
        return "";
    }
    var $msg = '<li class="list-group-item box-shadow"><a href="'+$url+'"><div class="clear text-danger"> ' + $name + '待审核'+$num+'条 </div></a></li>';
    return $msg;
}
function chartWeek ($dates, $oNum, $oHand, $in, $out) {
    var myChart = echarts.init(document.getElementById('week'));
    option = {
    title: {
        text: ''
    },
    tooltip : {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data:['订单数', '交易笔数', '入金笔数', '出金笔数']
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : $dates
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'订单数',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data: $oNum
        },
        {
            name:'交易笔数',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data: $oHand
        },
        {
            name:'入金笔数',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data: $in
        },
        {
            name:'出金笔数',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data: $out
        }
    ]
};
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
}
function chartObject($objects, $oNum) {
    var objectChart = echarts.init(document.getElementById('objects'));
    option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                data : $objects,
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'订单总数',
                type:'bar',
                barWidth: '60%',
                data:$oNum
            }
        ]
    };
    objectChart.setOption(option);
}
function easyPie () {
    $('.easypiechart').each(function() {
        var $this = $(this),
        $data = $this.data(),
        $step = $this.find('.step'),
        $target_value = parseInt($($data.target).text()),
        $value = 0;
        $data.barColor || ($data.barColor = function($percent) {
            $percent /= 100;
            return "rgb(" + Math.round(200 * $percent) + ", 200, " + Math.round(200 * (1 - $percent)) + ")";
        });
        $data.onStep = function(value) {
            $value = value;
            $step.text(parseInt(value));
            $data.target && $($data.target).text(parseInt(value) + $target_value);
        }
        // $data.onStop = function() {
        //     $target_value = parseInt($($data.target).text());
        //     $data.update && setTimeout(function() {
        //         $this.data('easyPieChart').update(100 - $value);
        //     }, $data.update);
        // }
        $(this).easyPieChart($data);
    });
}
function gorefresh () {
    $('.easypiechart').each(function() {
        $(this).data('easyPieChart').update();
    });
    refresh ()
}
