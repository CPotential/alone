<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

    <title>후기 상세정보</title>
<!--  jquery 사용처입니다. -->
<script src="//code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript">

</script>
    <!-- CSS Global -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- CSS Plugins -->
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">

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




    <!-- PAGE CONTENT
    ============================== -->

    <div class="container">
      <div class="row">
   
        <div class="col-sm-8 col-md-9 col-lg-10">
          <!-- Tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
           <!--   <a href="#personal-info" aria-controls="personal-info" role="tab" data-toggle="tab">후기 상세정보</a> -->
           
            </li>
          </ul>
          <!-- Tab content -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="personal-info">
         <!--   <h3 class="header header_plain"> 후기 상세정보</h3> -->
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <th scope="row">제목</th>
                      <td>${rvo.title}</td>
                       <th scope="row">작성자</th>
                        <td>${rvo.memberVO.nickName}</td>
                         <th scope="row">작성일</th>
                         <td> ${rvo.timePosted}</td>
                          <th scope="row">조회수</th>
                      <td>${rvo.hits}</td>
                      <th scope="row">좋아요</th>
                      <td>${rvo.likes}</td>
                      
                    </tr>
                    
                    <tr>
                      <th scope="row">content</th>
                      <td>${rvo.content}</td>
                    </tr>
                    <tr>
                    <td>좋아요 들어갈 자리</td>
                    </tr>
                    <tr>
                      <td>
                      		<div class="col-sm-2">
							<p>
							<a href="${pageContext.request.contextPath}/reviewList.do"class="btn btn-sm btn-primary">목록</a>
							</p>
							</div>
                      </td>
                    </tr>





                  </tbody>
                </table>
              </div> <!-- / .table-responsive -->
              </div> <!-- / .row -->
          </div> <!-- / .tab-content -->
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



          </div> <!-- / .row -->
        </div> <!-- / .container -->
      </div> <!-- / .footer_top -->
      <div class="footer__hr hidden-xs"></div>


    </footer>


    <!-- Javascript
    ============================== -->

    <!-- JS Global -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>

    <!-- JS Plugins -->
    <script src="js/scrolltopcontrol.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- JS Custom -->
    <script src="js/custom.js"></script>


  </body>
</html>