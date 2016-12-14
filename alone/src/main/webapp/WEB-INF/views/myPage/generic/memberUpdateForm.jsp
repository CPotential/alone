<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

<!--  jquery 사용처입니다. -->
<!-- <script type="text/javascript">
	$(document).ready(function() {
		var nicknameCheck; // nickName 체크 변수

		$("#memberUpdateForm").submit(function() {
			if (nicknameCheck == false) {
				alert("닉네임 중복 확인하세요");
				return false;
			}
		}); // submit function
	});
</script> -->

<div class="container">
	<div class="row">

		<div class="col-sm-8 col-md-9 col-lg-10">
			<sec:authorize ifAnyGranted="ROLE_MEMBER">
			<form action="${pageContext.request.contextPath}/genericUpdate.do" method="post" id="memberUpdateForm">
				<!-- Tab content -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="personal-info">
						<h3 class="header header_plain">개인 정보 수정</h3>
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">아이디</th>
										<td><sec:authentication property="principal.id" /><td>
									</tr>
									<tr>
										<th scope="row">비밀번호</th>
										<td><input type="password" id="password" name="password"></td>
									</tr>
									<tr>
										<th scope="row">비밀번호 확인</th>
										<td><input type="password" id="passwordCheck"
											name="passwordCheck"> <span id="passwordCheckView"></span>
										</td>
									</tr>
									<tr>
										<th scope="row">이름</th>
										<td><input type="text" class="form-control"
											id="sign-up__name" name="name" placeholder="이름"></td>
									</tr>
									<tr>
										<th scope="row">닉네임</th>
										<td>
											<input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임"> 
											<span id="nickNameCheckView"></span>
										</td>
									</tr>
									<tr>
										<th scope="row">성별</th>
										<td>
											<input type="radio" id="sign-up__gender" name="gender" value="여성">여성 
											<input type="radio" 	id="sign-up__gender" name="gender" value="남성">남성
										</td>
									</tr>
									<tr>
										<th scope="row">전화번호</th>
										<td><input type="text" class="form-control" id="sign-up__tel" name="tel" placeholder="연락처"></td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- / .table-responsive -->
					</div>

					<input type="submit" class="btn btn-primary btn-block btn-lg" value="수정하기"><br> 
					<a href="${pageContext.request.contextPath}/showGenericInfo.do" class="btn btn-primary">취소</a>

				</div>
				<!-- / .tab-content -->
			</form>
			</sec:authorize>
		</div>


	</div>
	<!-- / .row -->

</div>
<!-- / .container -->


