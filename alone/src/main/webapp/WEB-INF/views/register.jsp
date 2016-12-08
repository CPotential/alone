<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="icon" href="img/favicon.ico">-->

    <title>혼자서도 잘해요</title>
        <script src="//code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript">
	$(document).ready(function(){
		$("#cancel").click(function(){
			location.href="${pageContext.request.contextPath}/homego.do";
			return false;
		});
		$("#registerMember").click(function(){
			location.href="${pageContext.request.contextPath}/registerMember.do";
			return false;
		});
		$("#registerCompany").click(function(){
			location.href="${pageContext.request.contextPath}/registerCompany.do";
			return false;
		});
	});
		</script>
		
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

  <body class="body_plain">

    <!-- PRELOADER (uncomment to enable)
    ============================== -->
    <!-- <div class="preloader">
      <img src="img/preloader.gif" alt="Loading..." class="preloader__img">
    </div> -->


    <!-- PAGE CONTENT
    ============================== -->
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <div class="body-plain__title">
            <h1 class="text-center">Sign Up</h1>
          </div>
        </div> 
      </div> <!-- / .row -->
      <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-sm-offset-3 col-md-offset-3 col-lg-offset-4">
          <div class="body-plain__form">
  


			 <button type="submit" class="btn btn-ki btn-block btn-lg" id="registerMember">일반회원 가입</button>
  			 <button type="submit" class="btn btn-ki btn-block btn-lg" id="registerCompany">기업회원 가입</button>
      


            <div class="collapse" id="lost-password__form">
              <p class="text-muted">
                Enter your email address below and we will send you a link to reset your password.
              </p>
              <form class="form-inline" role="form">
                <div class="form-group">
                  <label class="sr-only" for="lost-password__email">Email address</label>
                  <input type="email" class="form-control" id="lost-password__email" placeholder="Enter email">
                </div>
                <button type="submit" class="btn btn-info">Send</button>
              </form>
            </div> <!-- lost-password__form -->
          </div> <!-- / .body-plain__form -->
          <br>
          
          
		<button type="submit" class="btn btn-primary btn-block btn-lg" id="cancel">취소</button>
          <!-- Footer -->
          <div class="body-plain__footer">
            Copyright 2016 <a href="http://simpleqode.com/">Simpleqode.com</a>. All Rights Reserved.
          </div>
        </div>
      </div> <!-- / .row -->
    </div> <!-- / .container -->


    <!-- Javascript
    ============================== -->

    <!-- JS Global -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>

    <!-- JS Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/scrolltopcontrol.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>

    <!-- JS Custom -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>


  </body>
</html>