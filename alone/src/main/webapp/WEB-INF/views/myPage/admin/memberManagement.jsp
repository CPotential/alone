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
						<h2 class="page-header__title">Management</h2>
						<ol class="breadcrumb page-header__breadcrumb">
							<li><a href="#">Generic</a></li>
							<li><a href="#">Company</a></li>
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
								<th>#</th>
								<th>Id</th>
								<th>Username</th>
								<th>Nickname</th>
								<th>Gender</th>
								<th>Birth</th>
								<th>Tel</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${genericMemberList}" var="list" varStatus="status">
								<tr>
									<th scope="row">${status.count}</th>
									<td>${list.id }</td>
									<td>${list.name }</td>
									<td>${list.nickName }</td>
									<td>${list.gender }</td>
									<td>${list.birth }</td>
									<td>${list.tel }</td>
									<td><a class="btn btn-primary">remove</a></td>
								</tr>
							</c:forEach>
							<tr>
								<th scope="row">1</th>
								<td>json</td>
								<td>서현진</td>
								<td>개구리</td>
								<td>여자</td>
								<td>851201</td>
								<td>01078965412</td>
								<td><a class="btn btn-primary">remove</a></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>json</td>
								<td>서현진</td>
								<td>개구리</td>
								<td>여자</td>
								<td>851201</td>
								<td>01078965412</td>
								<td><a class="btn btn-primary">remove</a></td>
							</tr>
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