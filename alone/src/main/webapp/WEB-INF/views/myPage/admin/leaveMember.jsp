<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>

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
						<h2 class="page-header__title">LeaveMember</h2>
						<ol class="breadcrumb page-header__breadcrumb">
							<li><a href="${pageContext.request.contextPath}/adminGenericManagement.do">Generic</a></li>
							<li><a href="${pageContext.request.contextPath}/adminCompanyManagement.do">Company</a></li>
							<li><a href="${pageContext.request.contextPath}/adminLeaveMemberList.do">Leave</a></li>
							<li class="#">Main</li>
						</ol>
					</div>
				</div>

				<!--     <h3 class="header">승인 요청목록</h3> -->
				<!-- <div class="table-responsive"> -->

				<!--  <table class="table table-striped table-bordered"> -->
				<div class="table-responsive shopping-cart__table">
					<table class="table table-striped" id="genericList">
						<thead>
							<tr>
								<th>#</th>
								<th>Id</th>
								<th>Username</th>
								<th>Nickname</th>
								<th>Tel</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${leaveMemberList}" var="list" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>${list.id }</td>
									<td>${list.name }</td>
									<td>${list.nickName }</td>
									<td>${list.tel }</td>
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