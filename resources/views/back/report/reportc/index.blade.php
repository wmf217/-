@include('back.header')
<link href="{{env('APP_URL')}}/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" />
<section id="content">
   <section class="hbox stretch">
    <!-- .aside -->
      @include('back.aside')
      <!-- /.aside -->
      <section class="panel panel-default">
          <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-1 control-label">时间范围</label>
                <div class="col-sm-2">
                    <input id="from" class="input-sm input-s datepicker-input form-control" size="16" type="text" value="" data-date-format="yyyy-mm-dd">
                </div>
                <div class="col-sm-2">
                    <input id="to" class="input-sm input-s datepicker-input form-control" size="16" type="text" value="" data-date-format="yyyy-mm-dd">
                </div>
                <div class="col-sm-2">
                <input type="button" class="btn btn-success" style="height: 30px;padding-top: 4px;" onclick="data()" value="搜索"/>
                </div>
            </div>
          </from>
          <div class="panel-body">
            <div id="chart" style="width:1100px;height:500px;"></div>
          </div>
      </section>
   </section>
 </section>
 @include('back.footer')
 <script src="{{env('APP_URL')}}/bootstrap3-editable/js/bootstrap-editable.js"></script>
 <script src="{{env('APP_URL')}}/js/echarts.common.min.js"></script>
 <script>
 $(function () {
     data()
 });
 function data () {
     fetch('/back/week', {
         method: 'post',
         headers: {
             "Content-Type": "application/x-www-form-urlencoded"
         },
         credentials: 'include',
         body: "from=" + $("#from").val() + "&to=" + $("#to").val()
     }).then(function(res){
         return res.json()
     }).then(function(data){
         if (data.status) {
             let the = data.data
             chart(the.dates, the.oNum, the.oHand, the.in, the.out)
         } else {
             layer.msg(data.data)
         }
     })
 }
 function chart ($dates, $oNum, $oHand, $in, $out) {
     var myChart = echarts.init(document.getElementById('chart'));
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
 </script>
