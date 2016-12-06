<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="container">
	<div class="row">

		<div class="col-sm-8 col-md-9 col-lg-10">

			<!-- Tab content -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="personal-info">
					<h3 class="header header_plain">일반회원</h3>
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>${requestScope.gvo.id}</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>${gvo.name}</td>
								</tr>
								<tr>
									<th scope="row">닉네임</th>
									<td>${gvo.nickName}</td>
								</tr>
								<tr>
									<th scope="row">성별</th>
									<td>${gvo.gender}</td>
								</tr>
								<tr>
									<th scope="row">생년월일</th>
									<td>${gvo.birth}</td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td>${gvo.tel}</td>
								</tr>

							</tbody>
						</table>
					</div>
					<!-- / .table-responsive -->
				</div>
				<a href="${pageContext.request.contextPath}/myPageGeneric/myPageMemberupdate.do" class="btn btn-primary">수정하기</a>
			</div>
			<!-- / .tab-content -->
		</div>

	</div>
	<!-- / .row -->

</div>
<!-- / .container -->

