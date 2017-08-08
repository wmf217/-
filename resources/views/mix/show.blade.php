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
                            <header class="panel-heading font-bold">{{$title}}>查看</header>
                            <div class="panel-body">
                                <form>
                                    @foreach ($fields_edit as $field => $field_info)
                                    @if(isset($field_info['type']))
                                    @if($field_info['type']=='hidden')
                                    <!-- do nothing -->
                                    @elseif($field_info['type']=='select')
                                    <div class="form-group">
                                        <label>{{$field_info['show']}}:</label>
                                        <section class="panel panel-default">
                                          <div class="panel-body">{{$field_info['source'][$model->$field]}}</div>
                                        </section>
                                    </div>
                                    @elseif($field_info['type']=='radio')<!--radio框-->
                                    <label>{{$field_info['show']}}:</label>
                                    <section class="panel panel-default">
                                      <div class="panel-body">{{$field_info['source'][$model->$field]}}</div>
                                    </section>
                                    @elseif($field_info['type']=='file')<!--file框-->

                                    @elseif($field_info['type']=='img')<!--文件预览-->
                                    <div class="form-group">
                                        <label>{{$field_info['show']}}:</label>
                                        <section class="panel panel-default">
                                          <div class="panel-body">
                                              @if($model->$field)
                                              <img src="{{$model->$field}}" width="800"/>
                                              @else
                                              无
                                              @endif
                                          </div>
                                        </section>
                                    </div>
                                    @elseif($field_info['type']=='textarea')                                  @endif
                                    @else
                                    <div class="form-group">
                                        <label>{{$field_info['show']}}:</label>
                                        <section class="panel panel-default">
                                          <div class="panel-body">{{$model->$field or '无'}}</div>
                                        </section>
                                        <!-- <span>

                                        </span> -->
                                    </div>
                                    @endif
                                    @endforeach
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
<script src="{{env('APP_URL')}}/js/file-input/bootstrap-filestyle.min.js" cache="false"></script>
<script>
$(document).ready(function() {
});
</script>
