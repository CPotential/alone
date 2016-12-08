<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//alert("1");
		$("#deleteFileView").on("click", "#deleteBtn", function() {

			//alert($(this).val());
			var fileName = $(this).parent().text().trim();
			var del = $(this).parent().parent();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/fileDelete.do",
				data : "deleteFileName=" + fileName,
				success : function(data) {
					alert(data);
					if (data == "fail") {
						console.log(data);
						alert("실패");

					} else {
						del.empty();
					}
				}//callback			
			});//ajax 

		});//deleteBtn callback

	});//ready
</script>

<!-- PAGE CONTENT
    ============================== -->

<div class="container">
	<div class="row">


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
			<form role="form" action="${pageContext.request.contextPath}/introduceUpdate.do"
				id="form_introduceWrite" method="post" enctype="multipart/form-data">
				<c:set value="${requestScope.introVO}" var="introVO" />
				<input type="hidden" name="boardNo" value="${introVO.boardNo}">
				<div class="form-group">
					<label for="title">가게명</label> <input type="text"
						name="companyName" class="form-control" id="company_name"
						placeholder="${introVO.companyName}" data-original-title=""
						title=""> <span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="region">키워드</label> <input type="text" name="keyword"
						class="form-control" id="keyword"
						placeholder="<%-- ${introVO.keyWordVO[0].keywordName}${introVO.keyWordVO[1].keywordName}${introVO.keyWordVO[2].keywordName} --%>keyword"
						data-original-title="" title="" value="">
					<div id="hashTag">
						<input type="text" id="hash1" name="keyWordVO[0].keyWordName" value="" readonly> 
						<input type="text" id="hash2" name="keyWordVO[1].keyWordName" value="" readonly> 
						<input type="text" id="hash3" name="keyWordVO[2].keyWordName" value="" readonly>
					</div>
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="location">지역</label> <input type="text" name="region"
						class="form-control" id="region" placeholder="${introVO.region}"
						data-original-title="" title=""> <span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">상세주소</label> <input type="text"
						name="location" class="form-control" id="location"
						placeholder="${introVO.location}" data-original-title="" title="">
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">영업시간</label> <input type="text"
						name="businessHours" class="form-control" id="business_hours"
						placeholder="${introVO.businessHours}" data-original-title=""
						title=""> <span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">전화번호</label> 
					<input type="text" name="tel" class="form-control" id="tel" placeholder="${introVO.tel}"
						data-original-title="" title=""> <span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>
					<textarea name="content" class="form-control" rows="5" id="content"
						placeholder="${introVO.content}"></textarea>
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">메인사진 첨부</label> 
					<input type="file" name="mainFile"><br> <span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">사진첨부</label> <input type="file" name="file"
						multiple="multiple"><br> <span class="help-block"></span>
				</div>

					<!-- 파일 삭제하기 -->
					<div id="deleteFileView">

						<c:forEach items="${introVO.imageVO}" var="file"
							varStatus="status">
							<%-- 	<a href="fileDownload.do?fileName=${fileName}">${fileName}</a> --%>
							<%-- 	<img src="${pageContext.request.contextPath}/resources/upload/${fileName}"> --%>

							<%--     <a  id="" href="fileDelete.do?fileName=${fileName}">${fileName}</a> --%>

							<div id="deleteResult">
								<p id="resultView">${file.imageName}
									<input type="button" id="deleteBtn" value="삭제" />
								</p>
							</div>

						</c:forEach>

					</div>


					<!-- 	<div class="row"> -->
					<div class="form-group">
						<label for="interest">카테고리</label>
						<div></div>

						<div class="row">

							<div class="col-sm-5">
								<!-- 	<form class="form-inline topbar__search" role="form"
				action="findMeetingList.do"> -->
								<select class="selectpicker" name="categoryVO.categoryNo"
									id="category_no">
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
										<span class="recaptcha_only_if_image">Can't read the
											words below?</span> <span class="recaptcha_only_if_audio">Can't
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
									<div class="recaptcha_only_if_audio">Enter the numbers
										you hear:</div>
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
					<button type="submit" class="btn btn-primary" id="meetingWrite">수정
						하기</button>
					<button type="button" class="btn btn-primary"
						id="meetingWriteCancel">작성 취소</button>
			</form>
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->