<aside class="bg-dark lter b-r aside-md hidden-print nav-xs" id="nav">
  <section class="vbox">
    <section class="w-f scrollable">
      <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color="#333333"> <!-- nav -->
        <nav class="nav-primary hidden-xs">
            <ul class="nav">
            <li @if($index=='index')class="active"@endif> <a href="/back/index" @if($index=='index')class="active"@endif> <i class="fa fa-dashboard icon"> <b class="bg-info dker"></b> </i> <span>监控台</span> </a> </li>
            @foreach($navs as $nav)
              @if($nav->show)
              <li @if($nav->index == $p_index)class="active"@endif>
                <a href="#pages" >
                    <i class="fa fa-{{$nav->icon}} icon"> <b class="bg-{{$nav->class}}"></b> </i>
                    <span class="pull-right">
                    <i class="fa fa-angle-down text"></i>
                    <i class="fa fa-angle-up text-active"></i>
                    </span>
                    <span>{{$nav->name}}</span>
                </a>
                <ul class="nav lt">
                  @foreach($nav->child as $child)
                      @if($child->show)
                      <li @if($child->index == $index)class="active"@endif>
                          <a href="{{$child->url}}" @if($child->index == $index)class="active"@endif>
                          <i class="fa fa-angle-right"></i>
                          <span>{{$child->name}}</span>
                          </a>
                      </li>
                      @endif
                  @endforeach
                </ul>
              </li>
              @endif
            @endforeach
          </ul>
        </nav>
        <!-- / nav -->
      </div>
    </section>
    <footer class="footer lt hidden-xs b-t b-dark">
      <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon active"> <i class="fa fa-angle-left text"></i> <i class="fa fa-angle-right text-active"></i> </a>
    </footer>
  </section>
</aside>
