<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="col-sm-4 col-md-3 col-lg-2">
	<ul class="list-unstyled profile-social center-block">
		<li><a href="${pageContext.request.contextPath}/myPage/admin/showInfo.do" class="btn btn-default btn-block">메인</a></li>
		<li><a href="${pageContext.request.contextPath}/NonApporvalCompanyList.do" class="btn btn-default btn-block"> 회원승인</a></li>
		<li><a href="${pageContext.request.contextPath}/memberManagement.do" class="btn btn-default btn-block"> 회원탈퇴</a></li>
	</ul>
</div>