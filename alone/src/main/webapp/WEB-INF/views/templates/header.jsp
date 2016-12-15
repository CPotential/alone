<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

			<%-- 
			ifAllGranted 속성: 사용자가 나열된 모든 권한에 해당할 경우 태그 안에 포함된 내용을 보여준다.
			ifAnyGranted 속성: 사용자가 나열된 권한 중 한가지에라도 해당할 경우 태그 안에 포함된 내용을 보여준다.
			ifNotGranted 속성: 사용자가 나열된 권한 중 한가지에라도 해당할 경우 태그 안에 포함된 내용을 보여주지 않는다.
			
			Spring Security를 이용하면 Authentication Bean 이 생성
			로그인 한 사용자의 정보는 Authentication 객체의 principal property
			 --%>
			<sec:authorize ifNotGranted="ROLE_MEMBER, ROLE_COMPANY_VERIFIED, ROLE_ADMIN">
				<li><a class="navbar-brand"  href="${pageContext.request.contextPath}/loginForm.do">Sign In</a></li>
				<li><a class="navbar-brand"  href="${pageContext.request.contextPath}/register.do"> Sign Up</a></li>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_MEMBER">
				<sec:authentication property="principal.nickName" />님
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/showGenericInfo.do">myPageGeneric</a></li>
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_COMPANY_VERIFIED">
				<sec:authentication property="principal.nickName" />님
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/showCompanyInfo.do">myPageCompany</a></li>
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
			</sec:authorize>
			<sec:authorize ifAnyGranted="ROLE_ADMIN">
				<sec:authentication property="principal.nickName" />님
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/showAdminInfo.do">myPageAdmin</a></li>
				<li><a class="navbar-brand" href="${pageContext.request.contextPath}/logout.do">로그아웃</a></li>
			</sec:authorize>

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
			<a class="navbar-brand"  href="${pageContext.request.contextPath}/home.do">혼자서도 잘해요</a>
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
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> 커뮤니티 <span class="fa fa-angle-down"></span></a>
					<ul class="dropdown-menu" role="menu"> 
						<li><a href="${pageContext.request.contextPath}/meetingList.do">모임 게시판</a></li>
						<li><a href="${pageContext.request.contextPath}/reviewList.do">리뷰 게시판</a></li>
					</ul>
				</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> 이벤트 <span class="fa fa-angle-down"></span></a>
					<ul class="dropdown-menu" role="menu"> 
						<li><a href="#">진행중인 이벤트</a></li>
						<li><a href="#">지난 이벤트</a></li>
						<%
						Calendar cal=Calendar.getInstance(); //현재 시스템이 가지고 있는 날짜 데이터 가지고 오기
					 	
					 	int y=cal.get(Calendar.YEAR);
					 	int m=cal.get(Calendar.MONTH)+1;
						%>
						<li><a href="${pageContext.request.contextPath}/showAttendanceMain.do?y=<%=y%>&m=<%=m%>">출석체크 이벤트</a></li>
						<%--  <li><a href="${pageContext.request.contextPath}/showAttendanceMain.do">출석체크 이벤트</a></li> --%>
					</ul>
				</li>
				</ul>
			</div>
				
	</div>
</div>

