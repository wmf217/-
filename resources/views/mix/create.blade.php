@include('back.header')
  <section>
    <section class="hbox stretch">
    <!-- .aside -->
      @include('back.aside')
      <!-- /.aside -->
      <section id="content">
        <section class="vbox">
          <section class="scrollable padder">
              <div class="row">
                    <div class="col-sm-12">
                        <section class="panel panel-default">
                            <header class="panel-heading font-bold">新增{{$title}}</header>
                            <div class="panel-body">
                                <form role="form" action="{{action($controller . "@store", $matrix_id)}}" method='POST' enctype="multipart/form-data">
                                    @foreach ($fields_create as $field => $field_info)
                                    <div class="form-group col-lg-8">
                                    @if(isset($field_info['type']))
                                    @if($field_info['type']=='hidden')
                                    <input name="{{$field}}" id="{{$field}}" type="hidden"  value="@if($field_info['source']=='matrix_id'){{$matrix_id}}@else{{$field_info['source']}}@endif"/>
                                    @elseif($field_info['type']=='select')
                                    <label>{{$field_info['show']}}</label>
                                    <select id="{{$field}}" name="{{$field}}" class="form-control">
                                        @foreach ($field_info['source'] as $k => $v)
                                        <option value ="{{$k}}">{{$v}}</option>
                                        @endforeach
                                    </select>
                                    @elseif($field_info['type']=='radio')<!--radio框-->
                                    <label>{{$field_info['show']}}</label>
                                    <div>
                                        @foreach ($field_info['source'] as $k => $v)
                                        <input type="radio" id="{{$field}}" name="{{$field}}" value ="{{$k}}"/>{{$v}}
                                        @endforeach
                                    </div>
                                    @elseif($field_info['type']=='file')<!--file框-->
                                    <label>{{$field_info['show']}}</label>
                                    <div>
                                    <input type="file" name="{{$field}}" class="filestyle" data-icon="false" data-classButton="btn btn-default" data-classInput="form-control inline input-s">
                                    </div>
                                    @elseif($field_info['type']=='img')<!--文件预览-->
                                    <label>{{$field_info['show']}}</label>
                                    <div>
                                    <input id="{{$field}}" name="uploadimg" type="file" multiple class="file see" data-overwrite-initial="false">
                                    </div>
                                    <input type="hidden" name="{{$field}}">
                                    @elseif($field_info['type']=='checkbox')<!--radio框-->
                                    <label>{{$field_info['show']}}</label>
                                    <div>
                                        @foreach ($field_info['source'] as $k => $v)
                                        <input type="checkbox" name="{{$field}}[]" id="{{$field}}[]" value ="{{$k}}"/>{{$v}}
                                        @endforeach
                                    </div>
                                    @elseif($field_info['type']=='textarea')
                                    <label>{{$field_info['show']}}</label>
                                    <script type="text/plain" id="{{$field}}" name="{{$field}}" style="width:100%;height:150px;" class="editor_textarea">
                                    </script>
                                    @else
                                    <label>{{$field_info['show']}}</label>
                                    <input name="{{$field}}" id="{{$field}}" type="text" class="form-control"
                                      value="@if(@$field_info['readonly']){{$field_info['readonly']}}@endif" @if(@$field_info['readonly'])readonly="readonly"@endif/>
                                    @endif
                                    @else
                                    <label>{{$field_info['show']}}</label>
                                    <input name="{{$field}}" id="{{$field}}" type="text" class="form-control"
                                      value="@if(@$field_info['readonly']){{$field_info['readonly']}}@endif" @if(@$field_info['readonly'])readonly="readonly"@endif/>
                                    <!-- </div> -->
                                    @endif
                                    </div>
                                    @endforeach
                                    <div class="form-group col-lg-8">
                                    <button type="submit" class="btn btn-sm btn-default">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
          </section>
        </section>
    </section>
  </section>
@include('back.footer')
<!-- <script src="{{env('APP_URL')}}/js/app.v2.js"></script> -->
<script src="{{env('APP_URL')}}/editor/ueditor.config.js"></script>
<script src="{{env('APP_URL')}}/editor/ueditor.all.min.js"> </script>
<script src="{{env('APP_URL')}}/js/file-input/bootstrap-filestyle.min.js" cache="false"></script>
<script src="{{env('APP_URL')}}/js/fileinput.js"></script>
<script src="{{env('APP_URL')}}/js/common/uploadimg.js"></script>
<script>
$('.see').each(function(k,v){
    let id = $(v).attr('id')
    uploadInit(id, '拖拽图片到这里', id)
})
$(document).ready(function() {
    $(".editor_textarea").each(function(k,v){
        UE.getEditor(''+$(v).attr('id')+'', {
            toolbars: [
                ['bold', 'italic', 'underline', 'fontfamily', 'fontsize', 'simpleupload']
            ]
        });
    });
});
</script>
