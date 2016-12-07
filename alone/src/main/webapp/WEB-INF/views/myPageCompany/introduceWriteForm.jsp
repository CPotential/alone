<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	$(document).ready(function(){
	
		$("#form_introduceWrite").submit(function(){
			if($("#form_introduceWrite :input[name=companyName]").val().trim()==""){
				alert("회사이름을 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=keyword]").val().trim()==""){
				alert("키워드를 입력하세요");				
				return false;
				
			}
	
			if($("#form_introduceWrite :input[name=region]").val().trim()==""){
				alert("지역을 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=location]").val().trim()==""){
				alert("장소를 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=businessHours]").val().trim()==""){
				alert("영업시간을 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=tel]").val().trim()==""){
				alert("시간을 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=content]").val().trim()==""){
				alert("상세정보를 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=mainImage]").val().trim()==""){
				alert("메인 이미지를 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=Image]").val().trim()==""){
				alert("그외 이미지를 입력하세요");				
				return false;
			}
			if($("#form_introduceWrite :input[name=categoryVO.categoryNo]").val() =="0")
				{
				
			alert("카테고리번호를 선택하세요");				
			return false;
				}
			

		
				
		}); // submit
		
		$("#keyword").keyup(function(){
			 //해쉬 태그 분할하기 

			var string=$(this).val();
			//문자열 해쉬태그 배열로 나누기
			var strArray=string.split('#');
			
			console.log(strArray);
			
			//for문으로 저장된 해쉬태그 대화상자로 출력하기
			for(var key in strArray){
				console.log(key);
				if(parseInt(key)!=0 && parseInt(key)<4)
					{
					$("#hash"+key).val(strArray[key]);
					
					}
				else if( parseInt(key)>=4){
					
					alert("태그는 3개까지만 유효합니다");
				
					$(this).val("#"+$("#hash1").val()+"#"+$("#hash2").val()+"#"+$("#hash3").val());
		
					
				}
				//alert(strArray[key]);
			}
		})//callback
		
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
			<form role="form" action="${pageContext.request.contextPath}/introduceWrite.do" id="form_introduceWrite"
			method="post" 
enctype="multipart/form-data">
				<!-- <div class="form-group">
					<label for="email">Your email address</label> 
					<input type="email" 	name="email" class="form-control" id="email" placeholder="E-mail" 	data-original-title="" title=""> 
					<span class="help-block"></span>
				</div> -->
				<div class="form-group">
					<label for="title">가게명</label> 
					<input type="text" name="companyName" class="form-control" id="company_name" placeholder="company_name"  data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="region">키워드</label> 
					<input type="text" name="keyword" class="form-control" id="keyword" placeholder="keyword" data-original-title="" title="" value=""> 
					<input type="text" id="hash1" name="keyWordVO[0].keyWordName" value="" readonly>
                    <input type="text" id="hash2" name="keyWordVO[1].keyWordName" value="" readonly>
                    <input type="text" id="hash3" name="keyWordVO[2].keyWordName" value="" readonly>
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="location">지역</label> 
					<input type="text" name="region" class="form-control" id="region" placeholder="region" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">상세주소</label> 
					<input type="text" name="location" class="form-control" id="location" placeholder="location" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">영업시간</label> 
					<input type="text" name="businessHours" class="form-control" id="business_hours" placeholder="business_hours" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">전화번호</label> 
					<input type="text" name="tel" class="form-control" id="tel" placeholder="tel" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>
					<textarea name="content" class="form-control" rows="5" id="content" placeholder="content"></textarea>
					<span class="help-block"></span>
				</div>
					<div class="form-group">
					<input type="file" name="mainFile"><br>
					<span class="help-block"></span>
				</div>
					<div class="form-group">
					<label for="interest">사진첨부</label> 
					<input type="file" name="file"  multiple="multiple"  ><br>
					<span class="help-block"></span>
				</div>
		
			<!-- 	<div class="row"> -->
      <div class="form-group">
		<label for="interest">카테고리</label> 
		<div></div>
	
		<div class="row">

		<div class="col-sm-5">
		<!-- 	<form class="form-inline topbar__search" role="form"
				action="findMeetingList.do"> -->
				<select class="selectpicker"name="categoryVO.categoryNo" id="category_no">
					<option value="0">카테고리</option>
					<option value="1">음식</option>
					<option value="2">술</option>
					<option value="3">문화</option>
			</select>
			</div>
		
	    </div>
	
	  <div class="form-group"></div>
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