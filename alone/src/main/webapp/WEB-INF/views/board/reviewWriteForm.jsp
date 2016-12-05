<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<script type="text/javascript">
				var RecaptchaOptions = {
					theme : 'custom',
					custom_theme_widget : 'recaptcha_widget'
				};
			</script>
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



<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<h3 class="header">Review Write</h3>
			<p class="text-muted">회원들이 경험한 내용들을 써주세요</p>
			<!-- Alert message -->
			<div class="alert" id="form_message" role="alert"></div>
			<!-- Setting the custom theme for reCaptcha.
               Default themes and customization: 
               https://developers.google.com/recaptcha/docs/customization -->

			<!-- Please carefully read the README.txt file in order to setup
               the PHP contact form properly -->
			<form role="form" name="reviewWriteForm"
				action="${pageContext.request.contextPath}/reviewWrite.do"
				onsubmit="return reviewWrite()">
				<!-- <div class="form-group">
					<label for="email">Your email address</label> 
					<input type="email" 	name="email" class="form-control" id="email" placeholder="E-mail" 	data-original-title="" title=""> 
					<span class="help-block"></span>
				</div> -->
				<div class="form-group">
					<label for="title">Title</label> <input type="text" name="title"
						class="form-control" id="title" placeholder="title"
						data-original-title="" title=""> <span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>
					<textarea cols="20" rows="20" name="content" class="form-control"
						id="content" placeholder="content" data-original-title="" title=""></textarea>
					<br> <span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="image">image</label> <input type="text" name="image"
						class="form-control" id="image" placeholder="picture"
						data-original-title="" title=""> <span class="help-block"></span>
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
								<div class="recaptcha_only_if_image">Enter the words above:</div>
								<div class="recaptcha_only_if_audio">Enter the numbers you hear:</div>
								<!-- reCAPTCHA input -->
								<input class="form-control input-sm" type="text"
									id="recaptcha_response_field" name="recaptcha_response_field" />
							</div>
						</div>
					</div>
					<!-- / #recaptcha_widget -->


					<noscript>
						<br>
						<textarea name="recaptcha_challenge_field" rows="3" cols="40">
                 </textarea>
						<input type="hidden" name="recaptcha_response_field"
							value="manual_challenge">
					</noscript>
					<span class="help-block"></span>
				</div>
				<!-- / reCAPTCHA -->
				<button type="submit" class="btn btn-primary">후기글 작성</button>
				<button type="button" class="btn btn-primary"
					onclick="reviewWriteCancel()">작성 취소</button>
			</form>

		</div>

		</div>
		</div>

