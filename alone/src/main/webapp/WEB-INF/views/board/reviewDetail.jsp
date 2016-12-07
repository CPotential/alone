<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

<!--  jquery 사용처입니다. -->
<script src="//code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript">
	
    </script>
<div class="ui__section" id="ui_tables">

	<h2 class="header">후기 정보</h2>
	<div class="table-responsive">
		<table class="table table-striped table-bordered">

			<caption>후기 상세보기</caption>
			<thead>
				<tr>
					<th class="col-md-6">제목  ${rvo.title}</th>
					<th class="col-md-1">작성자  ${rvo.memberVO.nickName}</th> 
					<th class="col-md-1">작성일  ${rvo.timePosted}</th>
					</tr>
					<tr>
					<th></th>
					<th class="col-md-1">조회수  ${rvo.hits}</th>
					<th class="col-md-1">좋아요  ${rvo.likes}</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan="3">
				${rvo.content}
				</td>
			</tr>
			<tr>
				<td  colspan="3" id="like">
			      좋아요
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<!-- / .table-responsive -->

		<div class="col-sm-2">
			<p>
				<a href="${pageContext.request.contextPath}/reviewList.do"class="btn btn-sm btn-primary">목록</a>
			</p>
		</div>
 	<c:if test="${rvo.memberVO.id==sessionScope.mvo.id}">
		<div class="col-sm-2">
			<p>
				<a href="${pageContext.request.contextPath}/reviewList.do"class="btn btn-sm btn-primary">수정</a>
			</p>
		</div>
		<div class="col-sm-2">
			<p>
				<a href="${pageContext.request.contextPath}/reviewList.do"class="btn btn-sm btn-primary">삭제</a>
			</p>
		</div>
	</c:if>
	</div>

