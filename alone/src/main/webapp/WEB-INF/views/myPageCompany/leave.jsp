<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	$(document).ready(function() {
		
		var leaveCheck ="";
		$("#form_delete").submit(function(){
			var password = $("#form_delete :input[name=password]").val().trim();
			
			if(password==""){
				alert("비밀번호를 입력하세요");				
				return false;
			}
			
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/passwordCheckAjax.do",
				data:"password="+password,
				success : function(result){
					if(result=="ok"){
						leaveCheck=true;
						if(confirm("진심 탈퇴 할거임?")){
							location.href="${pageContext.request.contextPath}/deleteMember.do"
						}
					} else{
						alert("비밀번호 불일치");
						leaveCheck=false;						
					} 
				}
			}); // ajax
			if(leaveCheck==false){
				return false;
			}
		});//submit

	}); // ready
</script>
<!-- PAGE CONTENT
    ============================== -->
<div class="container">
	<div class="row">
		<div class="col-sm-4 col-md-3 col-lg-2">
			<ul class="list-unstyled profile-social center-block">
				<li><a
					href="${pageContext.request.contextPath}/myPageCompany/showInfo.do"
					class="btn btn-default btn-block">기업정보 </a></li>
				<li><a
					href="${pageContext.request.contextPath}/myPageCompany/mileageDiscount.do"
					class="btn btn-default btn-block">마일리지 차감</a></li>
				<li><a
					href="${pageContext.request.contextPath}/myPageCompany/leave.do"
					class="btn btn-default btn-block"> 회원탈퇴</a></li>
			</ul>
		</div>

		<!-- PAGE CONTENT
    ============================== -->
		<div class="col-sm-8 col-md-9 col-lg-10">

			<div class="body-plain__title">
				<h1 class="text-center">회원 탈퇴</h1>
			</div>

			<div class="body-plain__form">

				<!-- Sign In form -->
				<form role="form" method="post" id="form_delete">
					<br> <label for="sign-in__password" class="sr-only">Enter password</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-lock"></i></span>
						<input type="password" name="password" class="form-control" id="sign-in__password" placeholder="Password">
					</div>
					<br>
					<button type="submit" class="btn btn-primary btn-block btn-lg">탈퇴하기</button>
				</form>

			</div>
		</div>
	</div>
	<!-- / .row -->

</div>
<!-- / .container -->

