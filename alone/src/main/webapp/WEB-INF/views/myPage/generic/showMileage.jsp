<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">

		<div class="col-sm-8 col-md-9 col-lg-10">
			<!-- Tab content -->

			<div class="ui__section" id="ui_tables">
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="personal-info">
						<h3 class="header header_plain">Mileage Info</h3>
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">현재 마일리지</th>
										<td>${nowMileage}</td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- / .table-responsive -->
					</div>
				</div>
				<!-- Tables -->


				<h3 class="header">사용내역</h3>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>#</th>
								<th>Transactions Mileage</th>
								<th>Transactions Info</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${mileageInfo}" var="mileage" varStatus="status"> 
								<tr>
									<th scope="row">${status.count}</th>
									<td>${mileage.dealMileage}</td>
									<td>${mileage.dealDetail}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- / .table-responsive -->
				<!--           </div> / ui__section -->
			</div>
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->