<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
 <div class="col-sm-4 col-md-3 col-lg-2">
   <ul class="list-unstyled profile-social center-block">
          <li>
            <a href="${pageContext.request.contextPath}/myPageCompany/showInfo.do" class="btn btn-default btn-block">기업정보 </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageCompany/mileageDiscount.do" class="btn btn-default btn-block">마일리지 차감</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageCompany/leave.do" class="btn btn-default btn-block"> 회원탈퇴</a>
          </li>
     	  	<c:set var="write" value="${sessionScope.memberVO.write}" />
          	<c:choose>
    
				<c:when test="${write eq 0 }">
			  <li>
              <a href="${pageContext.request.contextPath}/myPageCompany/introduceWriteForm.do" class="btn btn-default btn-block"> 소개글쓰기</a>
             </li>
				</c:when>
        
				<c:otherwise>
				  <li>
              <a href="$#" class="btn btn-default btn-block"> 소개글수정</a>
             </li>

				</c:otherwise>
			</c:choose>
        </ul>
      </div>
         
    <!-- PAGE CONTENT
    ============================== -->
  
      
   
          <div class="col-sm-8 col-md-9 col-lg-10">
			<h3 class="header">Introduce Write form</h3>
			<p class="text-muted">당신의 가게를 멋지게! 홍보해주세요!~</p>

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
			<form method="post" role="form" action="${pageContext.request.contextPath}/meetingWrite.do" id="form_meetingWrite">
				<!-- <div class="form-group">
					<label for="email">Your email address</label> 
					<input type="email" 	name="email" class="form-control" id="email" placeholder="E-mail" 	data-original-title="" title=""> 
					<span class="help-block"></span>
				</div> -->
				<div class="form-group">
					<label for="title">가게명</label> 
					<input type="text" name="title" class="form-control" id="title" placeholder="company_name"  data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="region">키워드</label> 
					<input type="text" name="region" class="form-control" id="region" placeholder="keyword" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="location">지역</label> 
					<input type="text" name="location" class="form-control" id="region" placeholder="region" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">상세주소</label> 
					<input type="text" name="interest" class="form-control" id="interest" placeholder="location" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">영업시간</label> 
					<input type="text" name="interest" class="form-control" id="interest" placeholder="business_hours" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">전화번호</label> 
					<input type="text" name="interest" class="form-control" id="interest" placeholder="tel" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>
					<textarea name="content" class="form-control" rows="3" id="content" placeholder="Content"></textarea>
					<span class="help-block"></span>
				</div>
					<div class="form-group">
					<label for="interest">메인사진 첨부</label> 
					<input type="text" name="interest" class="form-control" id="interest" placeholder="Insert" data-original-title="" title=""> 
					<button type="button" class="btn btn-xs btn-primary">선택</button>
					<span class="help-block"></span>
				</div>
					<div class="form-group">
					<label for="interest">사진첨부</label> 
					<input type="text" name="interest" class="form-control" id="interest" placeholder="Insert" data-original-title="" title=""> 
					<button type="button" class="btn btn-xs btn-primary">선택</button>
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
				<button type="submit" class="btn btn-primary" id="meetingWrite">소개글 작성</button>
				<button type="button" class="btn btn-primary" id="meetingWriteCancel">작성 취소</button>
			</form>
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->