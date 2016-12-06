<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	$(document).ready(function(){
		$("#form_meetingWrite").submit(function(){
			if($("#form_meetingWrite :input[name=title]").val().trim()==""){
				alert("제목을 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=region]").val().trim()==""){
				alert("지역을 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=location]").val().trim()==""){
				alert("장소를 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=interest]").val().trim()==""){
				alert("관심사항을 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=content]").val().trim()==""){
				alert("정보를 입력하세요");				
				return false;
			}
		}); // submit
		
	}); // ready
</script>
<!-- PAGE CONTENT
    ============================== -->
<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<h3 class="header">Meeting Write form</h3>
			<p class="text-muted">혼자가 심심해??
			그럼 나만의 이야기 주제로 
			대화할 사람들을 모아봐~</p>

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
			<form method="post" role="form" action="${pageContext.request.contextPath}/meetingWrite.do" id="form_meetingWrite" enctype="multipart/form-data">
				<!-- <div class="form-group">
					<label for="email">Your email address</label> 
					<input type="email" 	name="email" class="form-control" id="email" placeholder="E-mail" 	data-original-title="" title=""> 
					<span class="help-block"></span>
				</div> -->
				<div class="form-group">
					<label for="title">Title</label> 
					<input type="text" name="title" class="form-control" placeholder="meetin title"  data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="region">Region</label> 
					<input type="text" name="region" class="form-control" placeholder="meeting region" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="location">Location</label> 
					<input type="text" name="location" class="form-control" placeholder="meeting location" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">Interest</label> 
					<input type="text" name="interest" class="form-control" placeholder="Interest" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>
					<textarea name="content" class="form-control" rows="3" placeholder="Content"></textarea>
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="uploadFile">UploadFile</label> 
					<input type="file" name="file[0]" class="form-control"> 
					<span class="help-block"></span>
				</div>
				<!-- reCAPTCHA -->
				<div class="form-group" id="form-captcha">
					<!-- Start reCAPTCHA -->
					<div id="recaptcha_widget" style="display: none">
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<p>
									<span class="recaptcha_only_if_image">Can't read the words below?</span>
									<span class="recaptcha_only_if_audio">Can't hear the sound?</span> 
									<a href="javascript:Recaptcha.reload()">Get another CAPTCHA</a> or <span class="recaptcha_only_if_image"><a
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
				<button type="submit" class="btn btn-primary" id="meetingWrite">모임글 작성</button>
				<button type="button" class="btn btn-primary" id="meetingWriteCancel">작성 취소</button>
			</form>
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->