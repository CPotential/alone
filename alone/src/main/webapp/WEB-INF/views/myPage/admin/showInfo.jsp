<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- PRELOADER (uncomment to enable)
    ============================== -->
<!-- <div class="preloader">
      <img src="img/preloader.gif" alt="Loading..." class="preloader__img">
    </div> -->

<div class="container">
	<div class="row">

		<div class="col-sm-8 col-md-9 col-lg-10">

			<!-- Tab content -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="personal-info">
					<h3 class="header header_plain">Admin Info</h3>
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>${admin.id}</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>${admin.name}</td>
								</tr>
								<tr>
									<th scope="row">닉네임</th>
									<td>${admin.nickName}</td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td>${admin.tel}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- / .table-responsive -->
				</div>
			</div>
			<!-- / .tab-content -->
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->

