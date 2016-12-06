<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">

		<div class="col-sm-8 col-md-9 col-lg-10">
			<!-- Tab content -->

			<div class="ui__section" id="ui_tables">
				<!-- Tables -->

				<!-- PAGE HEADER
    ============================== -->

				<div class="row">
					<div class="col-xs-12">
						<h2 class="page-header__title">승인 기업회원 리스트</h2>
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
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ApprovalList"
								items="${requestScope.ApprovalCList}">
								<tr>
									<td>${ApprovalList.id}</td>
									<td>${ApprovalList.name}</td>
									<td>${ApprovalList.nickName}</td>
									<td>${ApprovalList.corporateRegistrationNumber}</td>
									<td>${ApprovalList.tel}</td>
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