<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-sm-4 col-md-3 col-lg-2">
	<ul class="list-unstyled profile-social center-block">
		<li><a href="${pageContext.request.contextPath}/showCompanyInfo.do" class="btn btn-default btn-block">기업정보 </a></li>
		<li><a href="${pageContext.request.contextPath}/myPage/company/mileageDiscount.do" class="btn btn-default btn-block">마일리지 차감</a></li>
		<li><a href="${pageContext.request.contextPath}/myPage/company/leave.do" class="btn btn-default btn-block"> 회원탈퇴</a></li>
		<c:set value="${sessionScope.memberVO.write}" var="write"></c:set>
		<c:choose>
			<c:when test="${write eq 0 }">
				<li>
	        		<a href="${pageContext.request.contextPath}/myPage/company/introduceWriteForm.do" class="btn btn-default btn-block"> 소개글쓰기</a>
	        	</li>
			</c:when>
			<c:otherwise>
				  <li>
				  <a href="${pageContext.request.contextPath}/showCompanyBoard.do" class="btn btn-default btn-block">소개글보기</a>
				  </li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>