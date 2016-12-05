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

    <title>Beatrix :: Sign Up (default)</title>

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
    <script type="text/javascript">
       function reviewWrite(){
    		var reviewInfo = document.reviewWriteForm;
    		
    		if(reviewInfo.title.value == ""){
    			alert("제목을 입력하세요");
    			return false;
    		}else if(reviewInfo.content.value == ""){
    			alert("내용을 입력하세요");
    			return false; 
    		}
       }
       function reviewWriteCancel(){
    		if(confirm("작성을 취소하시겠습니까?")){
    			location.href="${pageContext.request.contextPath}/reviewList.do"; 
    		}
    	}
    </script>
</head>
<body>
 <div class="container">
	<div class="row">
		<div class="col-sm-8">
			<h3 class="header">Review Write</h3>
			<p class="text-muted">
				회원들이 경험한 내용들을 써주세요
			</p>
			<!-- Alert message -->
			<div class="alert" id="form_message" role="alert"></div>
			<!-- Setting the custom theme for reCaptcha.
               Default themes and customization: 
               https://developers.google.com/recaptcha/docs/customization -->
			<script type="text/javascript">
				var RecaptchaOptions = {
					theme : 'custom',
					custom_theme_widget : 'recaptcha_widget'
				};
			</script>
			<!-- Please carefully read the README.txt file in order to setup
               the PHP contact form properly -->
			<form role="form" name="reviewWriteForm" action="${pageContext.request.contextPath}/reviewWrite.do" onsubmit="return reviewWrite()"> 
				<!-- <div class="form-group"> 
					<label for="email">Your email address</label> 
					<input type="email" 	name="email" class="form-control" id="email" placeholder="E-mail" 	data-original-title="" title=""> 
					<span class="help-block"></span>
				</div> -->
				<div class="form-group"> 
					<label for="title">Title</label> 
					<input type="text" name="title" class="form-control" id="title" placeholder="title" > 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>  
					<textarea cols="20" rows="20" name="content" class="form-control" id="content" placeholder="content" ></textarea><br>
					<span class="help-block"></span>
				</div>
				<div class="form-group"> 
					<label for="image">image</label> 
					<input type="text" name="image" class="form-control" id="image" placeholder="picture"> 
					<span class="help-block"></span>
				</div>
				<!-- reCAPTCHA -->
				<div class="form-group" id="form-captcha">
					<!-- Start reCAPTCHA -->
					<div id="recaptcha_widget" style="display: none">
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<p>
									<span class="recaptcha_only_if_image">Can't read the
										words below?</span><span class="recaptcha_only_if_audio">Can't
										hear the sound?</span> <a href="javascript:Recaptcha.reload()">Get
										another CAPTCHA</a> or <span class="recaptcha_only_if_image"><a
										href="javascript:Recaptcha.switch_type('audio')">try an
											audio CAPTCHA</a></span><span class="recaptcha_only_if_audio"><a
										href="javascript:Recaptcha.switch_type('image')">try an
											image CAPTCHA</a></span>.
								</p>
								<!-- reCAPTCHA image -->
								<div id="recaptcha_image"></div>
								<div class="recaptcha_only_if_image">Enter the words
									above:</div>
								<div class="recaptcha_only_if_audio">Enter the numbers you
									hear:</div>
								<!-- reCAPTCHA input -->
								<input class="form-control input-sm" type="text"
									id="recaptcha_response_field" name="recaptcha_response_field" />
							</div>
						</div>
					</div>
					<!-- / #recaptcha_widget -->
					<script type="text/javascript"
						src="http://www.google.com/recaptcha/api/challenge?k=your_public_key">
						// Insert your public key here
					</script>
					<noscript>
						<iframe
							src="http://www.google.com/recaptcha/api/noscript?k=your_public_key"
							height="300" width="500" frameborder="0"></iframe>
						<br>
						<textarea name="recaptcha_challenge_field" rows="3" cols="40">
                 </textarea>
						<input type="hidden" name="recaptcha_response_field"
							value="manual_challenge">
					</noscript>
					<!-- End reCAPTCHA -->
					<span class="help-block"></span>
				</div>
				<!-- / reCAPTCHA -->
				<button type="submit" class="btn btn-primary">후기글 작성</button>
				<button type="button" class="btn btn-primary" onclick="reviewWriteCancel()">작성 취소</button>
			</form>
		</div>
</body>
</html>