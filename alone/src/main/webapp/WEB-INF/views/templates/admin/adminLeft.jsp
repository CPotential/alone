<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="col-sm-4 col-md-3 col-lg-2">
	<ul class="list-unstyled profile-social center-block">
		<li><a href="${pageContext.request.contextPath}/myPage/admin/showInfo.do" class="btn btn-default btn-block">메인</a></li>
		<li><a href="${pageContext.request.contextPath}/NonApporvalCompanyList.do" class="btn btn-default btn-block"> 회원승인</a></li>
		<li class="dropdown"><a href="#" class="btn btn-default btn-block" data-toggle="dropdown"> 회원관리</a>
			<ul class="dropdown-menu" role="management"> 
				<li><a href="${pageContext.request.contextPath}/adminGenericManagement.do">일반 회원</a></li>
				<li><a href="${pageContext.request.contextPath}/adminCompanyManagement.do">기업 회원</a></li>
				<li><a href="${pageContext.request.contextPath}/adminLeaveMemberList.do">떠난 회원</a></li>
			</ul>
		</li>
	</ul>
</div>