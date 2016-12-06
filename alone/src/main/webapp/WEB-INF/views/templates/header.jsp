<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#introduce").click(function() {
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/introduceCategoryListAjax.do",
				dataType : "json",
				success : function(result) {
					var data = "";
					for (var i = 0; i < result.length; i++) {
						data += "<li><a href=\"${pageContext.request.contextPath }/introduceList.do?categoryNo=";
						data += result[i].categoryNo;
						data += "\">";
						data += result[i].categoryName;
						data += "</a></li>";
					}
					$("#list").html(data);
				}
			}) // ajax
		}); // click
	}); // ready
</script>

<!-- STATIC TOPBAR
    ============================== -->
<div class="topbar hidden-xs hidden-sm">
	<div class="container">
		<ul class="topbar-nav topbar-nav_right">


			<!-- Account links -->
			<c:choose>
				<c:when test="${empty sessionScope.memberVO}">
					<li><a href="${pageContext.request.contextPath}/login.do">Sign In</a></li>
					<li><a href="${pageContext.request.contextPath}/register.do"> Sign Up</a></li>
				</c:when>

				<c:otherwise>
					<c:set var="authority" value="${sessionScope.memberVO.authority}" />
					<c:if test="${authority eq 'ROLE_MEMBER'}">
						<li><a href="${pageContext.request.contextPath}/showGenericInfo.do">myPageGeneric</a></li>
						<li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${authority eq 'ROLE_COMPANY'}">
						<li><a href="${pageContext.request.contextPath}/showCompanyInfo.do">myPageCompany</a></li>
						<li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
					</c:if>
					<c:if test="${authority eq 'ROLE_ADMIN'}">
						<li><a href="${pageContext.request.contextPath}/myPage/admin/showInfo.do">myPageAdmin</a></li>
						<li><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
					</c:if>

				</c:otherwise>
			</c:choose>

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
			<a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">혼자서도 잘해요</a>
		</div>
		<div class="collapse navbar-collapse">
			<!-- Navbar links -->
			<ul class="nav navbar-nav navbar-left">

				<!-- 가게 소개 -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="introduce"> 가게 소개 <span class="fa fa-angle-down"></span></a>
					<ul class="dropdown-menu" role="menu" id="list">
					</ul></li>
				<li>
					<ul class="dropdown-menu" role="menu" id="list">
					</ul>
				</li>

				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> 커뮤니티 <span class="fa fa-angle-down"></span>
				</a>

					<ul class="dropdown-menu" role="menu"> 
						<li><a href="${pageContext.request.contextPath}/getMeetingList.do">모임 게시판</a></li>
						<li><a href="${pageContext.request.contextPath}/reviewList.do">리뷰 게시판</a></li>
					</ul></li>
			</div>
	</div>
</div>

