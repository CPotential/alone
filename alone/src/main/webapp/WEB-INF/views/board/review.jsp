<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

<!--  jquery 사용처입니다. -->
<script type="text/javascript">
	$(document).ready(function() {

		$("#searchSubmit").click(function() {
			var searchKeyWord = $("#searchKeyWord").val(); //검색어 값 받아오기
			if (searchKeyWord == "") {
				alert("검색어를 입력하세요!");
			} else {
				var command = $("#findType").val() + ".do";
				location.href = command + "?searchKeyWord=" + searchKeyWord;
			}
		}); // click 이벤트
	}); // ready
</script>

<div class="ui__section" id="ui_tables">
	<h2 class="header">후기 게시판</h2>
	<div class="table-responsive">
		<table class="table table-striped table-bordered">
			<caption>자유로운 리뷰 남겨주세요</caption>
			<thead>
				<tr>
					<th>글번호</th>
					<th class="col-md-6">제목</th>
					<th class="col-md-1">작성자</th>
					<th class="col-md-1">작성일</th>
					<th class="col-md-1">조회수</th>
					<th class="col-md-1">좋아요</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ListVO.list}" var="list">  
					<tr>
						<th scope="row">${list.boardNo}</th>
						<td class="col-md-6"><a 
							href="${pageContext.request.contextPath}/reviewDetail.do?boardNo=${list.boardNo}">${list.title}</a></td>
						<!-- 상세정보로 이동하는 링크입니다. -->
						<td class="col-md-1">${list.memberVO.nickName}</td> 
						<td class="col-md-1">${list.timePosted}</td>
						<td class="col-md-1">${list.hits}</td>
						<td class="col-md-1">${list.likes}</td>
					</tr>
				</c:forEach>
			</tbody> 
		</table>
	</div>
	<!-- / .table-responsive -->

	<div class="row">
		<div class="col-sm-5"></div>
		<div class="col-sm-5">
			<form class="form-inline topbar__search" role="form">
				<select class="selectpicker" id="findType">
					<option value="findByTitle">제목</option>
					<option value="findByWriter">작성자</option>
				</select> <label class="sr-only" for="nav-search">Search</label> <input
					type="text" class="form-control" id="searchKeyWord"
					name="searchKeyWord">
				<button type="button" id="searchSubmit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<div class="col-sm-2">
			<p>
				<a href="${pageContext.request.contextPath}/reviewWriteForm.do"
					class="btn btn-sm btn-primary">글작성</a>
			</p>
		</div>
	</div>
</div>
<!-- / ui__section -->
<!--페이징 -->
<div class="ui__section" id="ui_pagination" align="center">
	<nav>
		<ul class="pagination">  
		<c:if  test="${requestScope.ListVO.pagingBean.previousPageGroup}">
			<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${requestScope.ListVO.pagingBean.startPageOfPageGroup-1}" aria-label="Previous"><span
					aria-hidden="true">«</span></a></li>
		</c:if>
		<c:forEach var ="pb" begin = "${requestScope.ListVO.pagingBean.startPageOfPageGroup}" end = "${requestScope.ListVO.pagingBean.endPageOfPageGroup}">
			<li class="active"><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${pb}">${pb}<span class="sr-only" >(current)</span></a></li> 
		</c:forEach>	 
		<c:if test= "${requestScope.ListVO.pagingBean.nextPageGroup}">  
			<li><a href="${pageContext.request.contextPath}/reviewList.do?pageNo=${requestScope.ListVO.pagingBean.endPageOfPageGroup+1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
		</c:if> 
		</ul>
	</nav>
</div>