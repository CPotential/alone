<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- PRELOADER
    ============================== -->
<div class="preloader">
	<img src="resources/img/preloader.gif" alt="Loading..."
		class="preloader__img">
</div>

<!-- STATIC TOPBAR
    ============================== -->
<div class="topbar hidden-xs hidden-sm">
	<div class="container">
		<ul class="topbar-nav topbar-nav_right">

			<!-- Account links -->
			<li><a href="login.do">Sign In</a></li>
			<li><a href="register.jsp"> Sign Up</a></li>

		</ul>
	</div>
	<!-- / .container -->
</div>
<!-- / .topbar -->
<div class="navbar__hr hidden-xs hidden-sm"></div>


<!-- STATIC NAVBAR
    ============================== -->
<div class="navbar navbar-default navbar-static-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<!-- Toggle button -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- Brand name -->
			<a class="navbar-brand" href="home.do">혼자서도 잘해요</a>
		</div>
		<div class="collapse navbar-collapse">
			<!-- Navbar links -->
			<ul class="nav navbar-nav navbar-left">



				<!-- 가게 소개 -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 가게 소개 <span class="fa fa-angle-down"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">음식</a></li>
						<li><a href="#">술</a></li>
						<li><a href="#">문화 생활</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 커뮤니티 <span class="fa fa-angle-down"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">후기 게시판</a></li>
						<li><a href="#">리뷰 게시판</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>

