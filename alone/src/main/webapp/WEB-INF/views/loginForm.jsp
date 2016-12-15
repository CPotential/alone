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
    
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<!--  jquery 사용처입니다. -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#form_login").submit(function(){
			if($("#form_login :input[name=id]").val().trim()==""){
				alert("아이디를 입력하세요");				
				return false;
			}
			if($("#form_login :input[name=password]").val().trim()==""){
				alert("비밀번호를 입력하세요");				
				return false;
			}
		}); // submit
	}); // ready
</script>
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
					<h1 class="text-center">Sign In</h1>
				</div>
			</div>
		</div>
		<!-- / .row -->
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-sm-offset-3 col-md-offset-3 col-lg-offset-4">
				<div class="body-plain__form">
					<!-- Sign In form -->
					<form role="form" method="post" action="${pageContext.request.contextPath}/login.do" id="form_login" name="loginForm">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							<input type="text" class="form-control" id="sign-in__id" 	name="id" placeholder="아이디를 입력하세요">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" class="form-control" id="sign-in__password" name="password" placeholder="패스워드 입력하세요">
						</div>
						<br>
						<button type="submit" class="btn btn-primary btn-block btn-lg">Login</button>
					</form>

					<!-- Sign Up link -->
					<hr />
					<p>
						가입 안했어요?? <a href="${pageContext.request.contextPath}/register.do">회원 가입</a>
					</p>


					<!-- Footer -->
					<div class="body-plain__footer">
						Copyright 2016 <a href="http://simpleqode.com/">Simpleqode.com</a>.
						All Rights Reserved.
					</div>
				</div>
			</div>
			<!-- / .row -->
		</div>
		<!-- / .container -->
	</div>
</body>
</html>