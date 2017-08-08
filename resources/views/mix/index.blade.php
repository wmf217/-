@include('back.header')
  <section>
    <section class="hbox stretch">
    <!-- .aside -->
      @include('back.aside')
      <!-- /.aside -->
      <section id="content">
        <section class="vbox">
          <section class="scrollable padder">
              <div class="col-lg-13">
                <ul class="breadcrumb">
                  @if(@$matrixname)
                  <li><i class="fa fa-home"></i> {{$matrixname}}</li>
                  @endif
                  <li class="active">{{$title}}管理</li>
                  <a href="#" onClick="javascript :history.back(-1);" style="float: right"><i class="fa fa-mail-reply"></i></a>
                </ul>
              </div>
            <div class="m-b-md">
                @if($handle_btn['create']['require'])
                <a href="{{action($controller . '@create',[$matrix_id])}}" class="btn btn-s-md btn-info btn-rounded">
                    {{$handle_btn['create']['show']}}
                </a>
                @endif
            </div>
            <section class="panel panel-default">
              @if(count($buttons))
              <header class="panel-heading">
                  <i class="fa fa-info-sign text-muted" data-toggle="tooltip" data-placement="bottom" data-title="ajax to load the data."></i>
                  @foreach($buttons as $button)
                  @if($button['type']=='iframe')
                  <a href="javascript:void(0)" onclick="layer_iframe('{{$button['show']}}','{{$button['url']}}')">
                  @elseif($button['type']=='url')
                   <a href="{{$button['url']}}">
                  @endif
                      <span class="label bg-{{$button['css']}} pull-right">{{$button['show']}}</span>
                  </a>
                  @endforeach
              </header>
              @endif
              <div class="table-responsive">
                <table class="table table-striped m-b-none" id="datatable">
                  <thead>
                    <tr>
                          @if($magnifying['require'])
                          <th width="20"></th>
                          @endif
                          @foreach ($fields_show as $v)
                            <th>{{$v['show']}}@if(isset($v['unit']))({{$v['unit']}})@endif</th>
                          @endforeach
                          <th>操作</th>
                    </tr>
                  </thead>
                  <tbody>
                      @forelse($models as $model)
                        <tr>
                            @if($magnifying['require'])
                            <td>
                            @if($magnifying['type']=='iframe')
                            <a href="javascript:void(0)" onclick="layer_iframe('{{$magnifying['show']}}','{{str_replace('{id}',$model->id,$magnifying['url'])}}')"><i class="fa fa-search-plus"></i></a>
                            @elseif($magnifying['type']=='url')
                            <a href="{{str_replace('{id}',$model->id,$magnifying['url'])}}"><i class="fa fa-search-plus"></i></a>
                            @endif
                            </td>
                            @endif
                            @foreach ($fields_show as $k => $v)
                            <td>
                                @if (isset($v['url'])&&$model&&$model->$k)
                                <a href="javascript:void(0)" class="btn btn-info btn-xs" onclick="layer_iframe('{{$model->$k}}','{{str_replace('{id}',$model->id,$v['url'])}}')">
                                <!-- <span class="label label-success"> -->
                                @endif
                                @if(isset($v['front']))<font color="{{$v['front']}}">@endif
                                @if (isset($v['before'])){{$v['before']}}@endif
                                @if(isset($v['type']))
                                    @if($v['type']=='radio')
                                        {{$v['source'][$model->$k] or '--'}}
                                    @elseif ($v['type']=='select')
                                        {{$v['source'][$model->$k] or '--'}}
                                    @elseif ($v['type']=='progress')
                                    <div class="progress progress-sm progress-striped active m-t-xs m-b-none">
                                        <div class="progress-bar progress-bar-success" data-toggle="tooltip" data-original-title="{{$model->$k*100}}%" style="width: {{$model->$k*100}}%"></div>
                                    </div>
                                    @else
                                        {{$model->$k or '--'}}
                                    @endif
                                @else
                                {{$model->$k or '--'}}
                                @endif
                                @if (isset($v['after'])){{$v['after']}}@endif
                                @if(isset($v['front']))</font>@endif

                                @if (isset($v['url'])&&$model&&$model->$k)
                                <!-- </span> -->
                                </a>
                                @endif
                            </td>
                            @endforeach
                            <td>
                            <div class="btn-group">
                                @if($single_btn)
                                @foreach($list_buttons as $list_button)
                                    @if($list_button['require'])
                                     @if ($list_button['type'] == 'url')
                                     <!-- 必须定义 -->
                                     <a href="{{str_replace('{id}',$model->id,$list_button['action'])}}"><i class="fa fa-check-square-o"></i>{{$list_button['name']}}</a>
                                     @elseif ($list_button['type'] == 'form')
                                     <a href="javascript:void(0)" data-id="{{$model->id}}" data-action="{{$list_button['action']}}" class="btn-form"><i class="fa fa-check-square-o"></i>{{$list_button['name']}}</a>
                                     @elseif ($list_button['type'] == 'iframe')
                                     <a href="javascript:void(0)" onclick="layer_iframe('{{$list_button['name']}}','{{str_replace('{id}',$model->id,$list_button['action'])}}')"><i class="fa fa-check-square-o"></i>{{$list_button['name']}}</a>
                                     @endif
                                    @endif
                                @endforeach
                                @else
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cogs"></i></a>
                                <ul class="dropdown-menu pull-right">
                                    @if($handle_btn['show']['require'])
                                    <li><a href="{{action($controller . '@destroy', [$matrix_id, $model->id])}}">{{$handle_btn['show']['show']}}</a></li>
                                    @endif
                                    @if($handle_btn['edit']['require'])
                                    <li><a href="{{action($controller . '@edit', [$matrix_id, $model->id])}}">{{$handle_btn['edit']['show']}}</a></li>
                                    @endif
                                    @if($handle_btn['destroy']['require'])
                                    <li><a href="javascript:void(0)" data-id="{{$model->id}}" class="del">{{$handle_btn['destroy']['show']}}</a></li>
                                    @endif
                                    @foreach($list_buttons as $list_button)
                                        @if($list_button['require'])
                                         @if ($list_button['type'] == 'url')
                                         <!-- 必须定义 -->
                                         <li><a href="{{str_replace('{id}',$model->id,$list_button['action'])}}">{{$list_button['name']}}</a></i>
                                         @elseif ($list_button['type'] == 'form')
                                         <li><a href="javascript:void(0)" data-id="{{$model->id}}" data-action="{{$list_button['action']}}" class="btn-form">{{$list_button['name']}}</a></i>
                                         @elseif ($list_button['type'] == 'iframe')
                                         <li><a href="javascript:void(0)" onclick="layer_iframe('{{$list_button['name']}}','{{str_replace('{id}',$model->id,$list_button['action'])}}')">{{$list_button['name']}}</a></li>
                                         @endif
                                        @endif
                                    @endforeach
                                </ul>
                                @endif
                            </div>
                            </td>
                        </tr>
                    @empty
                     <tr><td style="background-color: white;"><div>没有数据</div></td></tr>
                    @endforelse
                  </tbody>
                </table>
              </div>
              <div style="float:right">{{$models->appends($input)->links()}}</div>
            </section>
          </section>
        </section>
    </section>
 </section>
 @include('back.footer')
<script>
 $(document).ready(function () {
     $(".del").click(function () {
            let id=$(this).data('id');
            // let way=$(this).data('way');
            let baseurl = getUrl();
            let url=baseurl+'/'+id;
            fetch(url, {
                method:'DELETE',
                credentials: 'include',
            }).then(function(response) {
                return response.json();
            }).then(function(data) {
                if(data.status){
                    history.go(0)
                }else{
                    layer.msg(data.msg)
                }
            }).catch(function(e) {
                console.log(e);
            });
     })

     $(".btn-form").click(function () {
            let id=$(this).data('id');
            let action=$(this).data('action');
            let baseurl = getUrl();
            let url=baseurl+'/'+id;
            fetch(url, {
                method:'PUT',
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                credentials: 'include',
                body: action
            }).then(function(response) {
                // console.log(response)
                history.go(0) // todo
            }).catch(function(e) {
                console.log(e);
            });
     })
 });
 function getUrl() {
     let baseurl = '';
     if(window.location.href.indexOf("?") != -1){
         baseurl = window.location.href.substring(0,window.location.href.indexOf("?"));
     } else {
         baseurl = window.location.href;
     }
     baseurl.replace('#', '');
     return baseurl;
 }
</script>
