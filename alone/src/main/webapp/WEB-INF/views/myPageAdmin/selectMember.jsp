<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- PAGE CONTENT
    ============================== -->
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-2">

          <!-- Gategories -->
          <h3 class="header">Categories</h3>
          <div class="list-group list-group-left ui__sidebar nav" data-spy="affix">
            <a href="#ui_typography" class="list-group-item">Typography</a>
            <a href="#ui_tables" class="list-group-item">Tables</a>
            <a href="#ui_buttons" class="list-group-item">Buttons</a>
            <a href="#ui_tabs" class="list-group-item">Tabs</a>
            <a href="#ui_pills" class="list-group-item">Pills</a>
            <a href="#ui_pagination" class="list-group-item">Pagination</a>
            <a href="#ui_pager" class="list-group-item">Pager</a>
            <a href="#ui_progress-bars" class="list-group-item">Progress bars</a>
            <a href="#ui_list-groups" class="list-group-item">List groups</a>
            <a href="#ui_panels" class="list-group-item">Panels</a>
            <a href="#ui_accordion" class="list-group-item">Accordion</a>
            <a href="#ui_carousel" class="list-group-item">Carousel</a>
          </div> <!--  / .list-group -->
        </div>
        <div class="col-sm-9 col-md-10">
          
          <!-- Typography -->
          <div class="ui__section" id="ui_typography">
            <h3 class="header">Typography</h3>
            <div class="row">
              <div class="col-sm-8">
                <p class="lead">
                  Phasellus a sem et augue ullamcorper gravida. Maecenas sed porta orci. Aliquam interdum felis sapien, vitae viverra diam consectetur a. Sed interdum quam leo, sed pretium eros mattis vitae.
                </p>
                <p>
                  Phasellus a sem et augue ullamcorper gravida. Maecenas sed porta orci. Aliquam interdum felis sapien, vitae viverra diam consectetur a. Sed interdum quam leo, sed pretium eros mattis vitae.
                </p>
              </div>
              <div class="col-sm-4">
                <h1>Header 1</h1>
                <h2>Header 2</h2>
                <h3>Header 3</h3>
                <h4>Header 4</h4>
                <h5>Header 5</h5>
                <h6>Header 6</h6>
              </div>
            </div> <!-- / .row -->
          </div> <!-- / .ui__section -->
          
          <!-- Tables -->
          <div class="ui__section" id="ui_tables">
            <h3 class="header">Tables</h3>
            <div class="table-responsive">
              <table class="table table-striped table-bordered">
                <caption>Optional table caption.</caption>
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                  </tr>
                </tbody>
              </table>
            </div> <!-- / .table-responsive -->
          </div> <!-- / ui__section -->

          <!-- Buttons -->
          <div class="ui__section" id="ui_buttons">
            <h3 class="header">Buttons</h3>
            <p>
              <a class="btn btn-lg btn-default">Large Button Default</a> 
              <a class="btn btn-lg btn-primary">Large Button Primary</a>
            </p>
            <p>
              <a class="btn btn-default">Default Button</a> 
              <a class="btn btn-primary">Default Button</a>
            </p>
            <p>
              <a class="btn btn-sm btn-default">Small Button</a> 
              <a class="btn btn-sm btn-primary">Small Button</a>
            </p>
            <p>
              <a class="btn btn-xs btn-default">Extra Small</a> 
              <a class="btn btn-xs btn-primary">Extra Small</a>
            </p>
            <br />
            <p>Easily create a new button of any color with a single mixin using LESS:
            </p>
            <p>
              <code>
                .btn-new { #button &gt; .btn(#333; #FFF); }
              </code>
            </p>
            <p>
              where <code>#333</code> is your button background color, and <code>#FFF</code> is your button text color.
            </p>
          </div> <!-- / ui__section -->

          <!-- Tabs -->
          <div class="ui__section" id="ui_tabs">
            <h3 class="header">Tabs</h3>
            <ul class="nav nav-tabs">
              <li role="presentation" class="active"><a href="#">Home</a></li>
              <li role="presentation"><a href="#">Profile</a></li>
              <li role="presentation"><a href="#">Messages</a></li>
            </ul>
          </div> <!-- / ui__section -->
          
          <!-- Pills -->
          <div class="ui__section" id="ui_pills">
            <h3 class="header">Pills</h3>
            <ul class="nav nav-pills">
              <li role="presentation" class="active"><a href="#">Home</a></li>
              <li role="presentation"><a href="#">Profile</a></li>
              <li role="presentation"><a href="#">Messages</a></li>
            </ul>
          </div> <!-- / ui__section -->

          <!-- Pagination -->
          <div class="ui__section" id="ui_pagination">
            <h3 class="header">Pagination</h3>
            <nav>
              <ul class="pagination pagination-lg">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">Â«</span></a></li>
                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#" aria-label="Next"><span aria-hidden="true">Â»</span></a></li>
              </ul>
            </nav>
            <nav>
              <ul class="pagination">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">Â«</span></a></li>
                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#" aria-label="Next"><span aria-hidden="true">Â»</span></a></li>
              </ul>
            </nav>
            <nav>
              <ul class="pagination pagination-sm">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">Â«</span></a></li>
                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#" aria-label="Next"><span aria-hidden="true">Â»</span></a></li>
              </ul>
            </nav>
          </div> <!-- / ui__section -->

          <!-- Pager -->
          <div class="ui__section" id="ui_pager">
            <h3 class="header">Pager</h3>
            <nav>
              <ul class="pager">
                <li><a href="#">Previous</a></li>
                <li><a href="#">Next</a></li>
              </ul>
            </nav>
            <nav>
              <ul class="pager">
                <li class="previous"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
                <li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li>
              </ul>
            </nav>
            <nav>
              <ul class="pager">
                <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Older</a></li>
                <li class="next"><a href="#">Newer <span aria-hidden="true">&rarr;</span></a></li>
              </ul>
            </nav>
          </div> <!-- / ui__section -->

          <!-- Profress bars -->
          <div class="ui__section" id="ui_progress-bars">
            <h3 class="header">Progress Bars</h3>
            <div class="progress">
              <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
                40%
              </div>
            </div>
            <div class="progress">
              <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                <span class="sr-only">40% Complete (success)</span>
              </div>
            </div>
          </div> <!-- / ui__section -->

          <!-- List groups -->
          <div class="ui__section" id="ui_list-groups">
            <h3 class="header">List Groups</h3>
            <div class="list-group">
              <a href="#" class="list-group-item active">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              </a>
              <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              </a>
              <a href="#" class="list-group-item">
                <h4 class="list-group-item-heading">List group item heading</h4>
                <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
              </a>
            </div>
          </div> <!-- / ui__section -->

          <!-- Panels -->
          <div class="ui__section" id="ui_panels">
            <h3 class="header">Panels</h3>
            <div class="row">
              <div class="col-sm-6">
                <div class="panel panel-primary">
                  <div class="panel-heading">Panel heading without title</div>
                  <div class="panel-body">
                    Panel content
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Panel title</h3>
                  </div>
                  <div class="panel-body">
                    Panel content
                  </div>
                </div>
              </div>
            </div> <!-- / row -->
          </div> <!-- / ui__section -->

          <!-- Accordion -->
          <div class="ui__section" id="ui_accordion">
            <h3 class="header">Accordion</h3>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      Collapsible Group Item #1
                    </a>
                  </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                  <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      Collapsible Group Item #2
                    </a>
                  </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingThree">
                  <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      Collapsible Group Item #3
                    </a>
                  </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                  <div class="panel-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                  </div>
                </div>
              </div>
            </div>
          </div> <!-- / ui__section -->

          <!-- Carousel -->
          <div class="ui__section" id="ui_carousel">
            <h3 class="header">Carousel</h3>
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>

              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="img/general_4.jpg" alt="...">
                  <div class="carousel-caption">
                    Image 1
                  </div>
                </div>
                <div class="item">
                  <img src="img/general_5.jpg" alt="...">
                  <div class="carousel-caption">
                    Image 2
                  </div>
                </div>
                <div class="item">
                  <img src="img/general_6.jpg" alt="...">
                  <div class="carousel-caption">
                    Image 3
                  </div>
                </div>
              </div>

              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <i class="fa fa-angle-left" aria-hidden="true"></i>
                <i class="sr-only">Previous</i>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
                <i class="sr-only">Next</i>
              </a>
            </div>
          </div> <!-- / ui__section -->


        </div>
      </div> <!-- / .row -->
    </div> <!-- / .container -->
    