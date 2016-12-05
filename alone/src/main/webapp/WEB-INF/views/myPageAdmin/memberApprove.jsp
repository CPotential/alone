<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">

	<div class="row">
		<div class="col-sm-4 col-md-3 col-lg-2">
			<ul class="list-unstyled profile-social center-block">
				<li><a
					href="${pageContext.request.contextPath}/myPageAdmin/showInfo.do"
					class="btn btn-default btn-block">메인</a></li>
				<li><a
					href="${pageContext.request.contextPath}/NonApporvalCompanyList.do"
					class="btn btn-default btn-block"> 회원승인</a></li>
				<li><a
					href="${pageContext.request.contextPath}/memberRemove.do"
					class="btn btn-default btn-block"> 회원탈퇴</a></li>
			</ul>
		</div>

		<div class="col-sm-8 col-md-9 col-lg-10">
			<!-- Tab content -->

			<div class="ui__section" id="ui_tables">

				<!-- Tables -->


				<!-- PAGE HEADER
    ============================== -->
				<div class="row">
					<div class="col-xs-12">
						<h2 class="page-header__title">미승인 기업회원 리스트</h2>
						<ol class="breadcrumb page-header__breadcrumb">
							<li><a
								href="${pageContext.request.contextPath}/ApporvalCompanyList.do">ApprovalCompany</a></li>
							<li><a
								href="${pageContext.request.contextPath}/NonApporvalCompanyList.do">NonApprovalCompany</a></li>
							<li class="#">Main</li>
						</ol>
					</div>
				</div>

				<!--     <h3 class="header">승인 요청목록</h3> -->
				<!-- <div class="table-responsive"> -->


				<!--  <table class="table table-striped table-bordered"> -->
				<div class="table-responsive shopping-cart__table">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>대표이름</th>
								<th>기업명</th>
								<th>사업자번호</th>
								<th>대표번호</th>
								<th>기업회원 승인</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="Nonlist" items="${requestScope.NonApprovalCList}">
								<tr>
									<td>${Nonlist.id}</td>
									<td>${Nonlist.name}</td>
									<td>${Nonlist.nickName}</td>
									<td>${Nonlist.corporateRegistrationNumber}</td>
									<td>${Nonlist.tel}</td>
									<td><a
										href="${pageContext.request.contextPath}/updateApproval.do?id=${Nonlist.id}"
										class="btn btn-primary">approve</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- / .table-responsive -->
			</div>
			<!-- ui__section -->

		</div>
	</div>
</div>
<!-- / .container -->