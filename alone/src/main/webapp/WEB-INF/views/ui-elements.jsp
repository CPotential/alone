<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="icon" href="img/favicon.ico">-->

    <title>Beatrix :: UI Elements</title>

    <!-- CSS Global -->
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

    <!-- CSS Plugins -->
    <link href="${pageContext.request.contextPath}/resources/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- PRELOADER (uncomment to enable)
    ============================== -->
    <!-- <div class="preloader">
      <img src="img/preloader.gif" alt="Loading..." class="preloader__img">
    </div> -->


    <!-- STATIC TOPBAR
    ============================== -->
    <div class="topbar hidden-xs hidden-sm">
      <div class="container">
        <!-- Social links -->
        <ul class="topbar-nav topbar-nav_left">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
          <li><a href="#"><i class="fa fa-vk"></i></a></li>
          <li><a href="#"><i class="fa fa-stumbleupon"></i></a></li>
        </ul>
        <ul class="topbar-nav topbar-nav_right">
          <li>
            <!-- Search form -->
            <form class="form-inline topbar__search" role="form">
              <label class="sr-only" for="nav-search">Search</label>
              <input type="search" class="form-control" id="nav-search" placeholder="Search here...">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
          </li>
          <!-- Account links -->
          <li><a href="sign-in.html">Sign In</a></li>
          <li><a href="sing-up.html">Sign Up</a></li>
          <li><a href="shopping-cart.html">My Cart (0)</a></li>
        </ul>
      </div> <!-- / .container -->
    </div> <!-- / .topbar -->
    <div class="navbar__hr hidden-xs hidden-sm"></div>


    <!-- STATIC NAVBAR
    ============================== -->
    <div class="navbar navbar-default navbar-static-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <!-- Toggle button -->
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- Brand name -->
          <a class="navbar-brand" href="index.html">Beatrix</a>
        </div>
        <div class="collapse navbar-collapse">
          <!-- Navbar links -->
          <ul class="nav navbar-nav navbar-right">

            <!-- Home -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                Home <span class="fa fa-angle-down"></span>
              </a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="index.html">Home: Default</a></li>
                <li><a href="index_carousel.html">Home: Carousel</a></li>
              </ul>
            </li>

            <!-- Profile -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                Profile <span class="fa fa-angle-down"></span>
              </a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-submenu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sign In</a>
                  <!-- Dropdown submenu -->
                  <ul class="dropdown-menu">
                    <li><a href="sign-in.html">Sign In: Default</a></li>
                    <li><a href="sign-in_option-1.html">Sign In: Option 1</a></li>
                  </ul>
                </li>
                <li class="dropdown-submenu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sign Up</a>
                  <!-- Dropdown submenu -->
                  <ul class="dropdown-menu">
                    <li><a href="sign-up.html">Sign Up: Default</a></li>
                    <li><a href="sign-up_option-1.html">Sign Up: Option 1</a></li>
                  </ul>
                </li>
                <li><a href="profile.html">User Profile</a></li>
              </ul>
            </li>

            <!-- Portfolio -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                Portfolio <span class="fa fa-angle-down"></span>
              </a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="portfolio.html">Portfolio</a></li>
                <li><a href="portfolio-item.html">Portfolio Item</a></li>
              </ul>
            </li>

            <!-- Blog -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                Blog <span class="fa fa-angle-down"></span>
              </a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="blog.html">Blog</a></li>
                <li><a href="blog-post.html">Blog Post</a></li>
              </ul>
            </li>

            <!-- Shop -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                Shop <span class="fa fa-angle-down"></span>
              </a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="shop.html">Shop</a></li>
                <li><a href="shop-item.html">Shop Item</a></li>
                <li><a href="shopping-cart.html">Shopping Cart</a></li>
              </ul>
            </li>

            <!-- More pages -->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                More Pages <span class="fa fa-angle-down"></span>
              </a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="about-us.html">About Us</a></li>
                <li><a href="coming-soon.html">Coming Soon</a></li>
                <li><a href="contact-us.html">Contact Us</a></li>
                <li class="dropdown-submenu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Help Center</a>
                  <!-- Dropdown submenu -->
                  <ul class="dropdown-menu">
                    <li><a href="help-center.html">Help Center</a></li>
                    <li><a href="help-item.html">Help Item</a></li>
                  </ul>
                </li>
                <li class="dropdown-submenu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pricing Options</a>
                  <!-- Dropdown submenu -->
                  <ul class="dropdown-menu">
                    <li><a href="pricing_boxes.html">Pricing Options: Boxes</a></li>
                    <li><a href="pricing_table.html">Pricing Options: Table</a></li>
                  </ul>
                </li> 
                <li><a href="services.html">Services</a></li>
                <li><a href="search-results.html">Search Results</a></li>
                <li><a href="timeline.html">Timeline</a></li>
                <li><a href="error-page.html">404 Error</a></li>               
              </ul>
            </li>

            <!-- UI Elements -->
            <li class="active"><a href="ui-elements.html">UI Elements</a></li>
          </ul>
          <!-- Search form (for collapsed menu only) -->
          <form class="navbar-form navbar-left visible-xs visible-sm" role="search">
            <div class="form-group">
              <label class="sr-only" for="nav-search-xs">Search</label>
              <input type="search" class="form-control" id="nav-search-xs" placeholder="Search here...">
            </div>
          </form>
        </div> <!-- / .navbar-collapse -->
      </div> <!-- / .container -->
    </div> <!-- / .navbar -->


    <!-- PAGE HEADER
    ============================== -->
    <div class="page__header">
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <h3 class="page-header__title">UI Elements</h3>
            <ol class="breadcrumb page-header__breadcrumb">
              <li><a href="index.html">Home</a></li>
              <li class="active">UI Elements</li>
            </ol>
          </div>
        </div>
      </div>
    </div>


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
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
              </ul>
            </nav>
            <nav>
              <ul class="pagination">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
              </ul>
            </nav>
            <nav>
              <ul class="pagination pagination-sm">
                <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
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


    <!-- FOOTER
    ============================== -->
    <footer>

      <!-- Footer Top -->
      <div class="footer_top hidden-xs">
        <div class="container">
          <div class="row">

            <!-- Contact Us -->
            <div class="col-xs-12 col-sm-3">
              <div class="footer__item">
                <div class="footer__title">Contact Us</div>
                <div class="footer__content">
                  <p>
                    Do not hesitate to contact us if you have any questions or feature requests:
                  </p><p>
                    Lorem ipsum dolor sit amet,<br>
                    Consectetur adipiscing elit
                  </p><p>
                    Phone: +0 000 000 00 00<br>
                    Fax: +0 000 000 00 00
                  </p><p>
                    Email: <a href="#">support@example.com</a>
                  </p>
                </div>
              </div>
            </div>

            <!-- Recent Tweets -->
            <div class="col-xs-12 col-sm-3">
              <div class="footer__item">
                <div class="footer__title">Recent Tweets</div>
                <div class="footer__content">
                  <div class="footer__tweet">
                    <div class="footer-tweet__icon">
                      <i class="fa fa-twitter"></i>
                    </div>
                    <div class="footer-tweet__content">
                      <p>
                        <a href="#">@wrapbootstrap</a> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nisi lorem, elementum sed feugiat.
                      </p>
                      <a href="#">1 hour ago</a>
                    </div>
                  </div>
                  <div class="footer__tweet">
                    <div class="footer-tweet__icon">
                      <i class="fa fa-twitter"></i>
                    </div>
                    <div class="footer-tweet__content">
                      <p>
                        <a href="#">@wrapbootstrap</a> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nisi lorem, elementum sed feugiat.
                      </p>
                      <a href="#">1 day ago</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Recent Posts -->
            <div class="col-xs-12 col-sm-3">
              <div class="footer__item">
                <div class="footer__title">Recent Posts</div>
                <div class="footer__content">
                  <div class="footer__post">
                    <div class="footer-post__img">
                      <img src="img/general_1.jpg" alt="...">
                    </div>
                    <div class="footer-post__content">
                      <p><a href="#">Lorem ipsum dolor sit amet</a></p>
                      <time datetime="2015-01-01">2015/01/01</time>
                    </div>
                  </div>
                  <div class="footer__post">
                    <div class="footer-post__img">
                      <img src="img/general_2.jpg" alt="...">
                    </div>
                    <div class="footer-post__content">
                      <p><a href="#">Lorem ipsum dolor sit amet</a></p>
                      <time datetime="2015-01-01">2015/01/01</time>
                    </div>
                  </div>
                  <div class="footer__post">
                    <div class="footer-post__img">
                      <img src="img/general_3.jpg" alt="...">
                    </div>
                    <div class="footer-post__content">
                      <p><a href="#">Lorem ipsum dolor sit amet</a></p>
                      <time datetime="2015-01-01">2015/01/01</time>
                    </div>
                  </div>
                </div>
              </div>            
            </div>

            <!-- Quick Links -->
            <div class="col-xs-12 col-sm-3">
              <div class="footer__item">
                <div class="footer__title">Quick Links</div>
                <div class="footer__content">
                  <ul class="footer__links">
                    <li><a href="#">Donec commodo turpis eget orci</a></li>
                    <li><a href="#">Lorem ipsum dolor sit amet</a></li>
                    <li><a href="#">Aenean rhoncus vel nisi sed</a></li>
                    <li><a href="#">Aenean accumsan volutpat libero</a></li>
                    <li><a href="#">Vestibulum lacinia erat massa</a></li>
                  </ul>
                </div>
              </div>            
            </div>

          </div> <!-- / .row -->
        </div> <!-- / .container -->
      </div> <!-- / .footer_top -->
      <div class="footer__hr hidden-xs"></div>

      <!-- Footer Bottom -->
      <div class="footer_bottom">
        <div class="container">
          <div class="row">
            <div class="col-xs-12 col-sm-6">
              <div class="footer__copyright">
                Copyright 2015 <a href="http://simpleqode.com/">Simpleqode.com</a>. All Rights Reserved.
              </div>
            </div>
            <div class="col-xs-12 col-sm-6">
              <ul class="footer__social">
                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
              </ul>
            </div>
          </div> <!-- / .row -->
        </div> <!-- / .container -->
      </div> <!-- / .footer_bottom -->
    </footer>


    <!-- Javascript
    ============================== -->

    <!-- JS Global -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>

    <!-- JS Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/smoothscroll.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/scrolltopcontrol.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>

    <!-- JS Custom -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom_ui-nav.js"></script>


  </body>
</html>