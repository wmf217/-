<link rel="stylesheet" href="{{env('APP_URL')}}/css/back/app.v2.css" type="text/css" />
<link href="{{env('APP_URL')}}/css/jquery.dataTables.min.css" rel="stylesheet">
<section class="vbox">
        <div class="tab-content">
            <header class="panel-heading" style="margin-bottom: 15px;">
                <button href="#" class="btn btn-sm btn-info pull-right" onclick="print()">导出excel</button>
            </header>
            <div class="text-center wrapper">
                <table class="table table-striped m-b-none" data-ride="datatables" id="table">
                  <thead>
                    <tr>
                      <th><input type="checkbox" id="checkall"/></th>
                      <th>系统单号</th>
                      <th>代付金额(分)</th>
                      <!-- <th>代付类型</th>
                      <th>业务类型</th> -->
                      <th>开户行全称</th>
                      <th>银行帐号</th>
                      <th>银行户名</th>
                      <th>开户行支行</th>
                      <!-- <th>摘要</th> -->
                      <th>审核时间</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
            </div>
        </div>
</section>
<script src="{{env('APP_URL')}}/js/back/app.v2.js"></script>
<script src="{{env('APP_URL')}}/js/common.js"></script>
<script src="{{env('APP_URL')}}/js/layer/layer.js"></script>
<script src="{{env('APP_URL')}}/js/jquery.dataTables.min.js"></script>
<script>
$(function () {
    initHistory()
})

function initHistory () {
    $('#table').DataTable($.extend(dataTableSetting(),{
        "sAjaxSource": "/back/out/print-data",
        "columns": [
            {data: 'id', render:function(data,type,row){
                return '<input type="checkbox" class="rid" name="rid[]" value="'+row.id+'"/>';
            }},
            {data: 'payno'},
            {data: 'amount'},
            {data: 'name'},
            {data: 'account_number'},
            {data: 'account_name'},
            {data: 'account_branch'},
            {data: 'updated_at'},
        ]
    }));
}

function print () {
    let rids = []
    $("input[name='rid[]']:checked").each(function(k,v){
         rids.push($(v).val())
    })
    if (rids.length == 0) {
        layer.msg('请选择数据')
        return
    }
    window.location.href="/back/out/print-excel?rids=" + rids.join('_')
}

</script>
