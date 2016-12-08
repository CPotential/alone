<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#searchSubmit").click(function(){
			alert($("#findType").val() + $("#searchKeyWord").val());
			var searchKeyWord = $("#searchKeyWord").val();
			if (searchKeyWord == "") {
				alert("검색어를 입력하세요!");
			} else {
				var command = $("#findType").val();
				location.href = "meetingList.do?command="+ command + "&searchKeyWord=" + searchKeyWord;
			}
		}); // click
		$("#region").change(function() {
			var region = $(this).val();
			$.ajax({
				type : "get",
				url : "getMeetingRegionList.do",
				data : "region=" + $("#region").val(),
				dataType : "json",
				success : function(rList) {
					if (rList.length == 0) {
						location.href = "meetingList.do"
					} else {
						var data = "";
						for (var i = 0; i < rList.length; i++) {
							data += "<tr><td>";
							data += rList[i].boardNo;
							data += "</td><td>";
							data += rList[i].region;
							data += "</td><td>";
							data += rList[i].interest;
							data += "</td><td>";
							data +="<a href='${pageContext.request.contextPath}/meetingDetail.do?boardNo="
							data +=	rList[i].boardNo
							data +="'>"
							data += rList[i].title;
							data +="</a>"
							data += "</td><td>";
							data += rList[i].memberVO.nickName;
							data += "</td><td>";
							data += rList[i].timePosted;
							data += "</td><td>";
							data += rList[i].hits;
							data += "</td></tr>";
						}
						$("#meetingRegionList").html(data)
					}
				} // rollback
			}); // ajax
		}); //change
	}); //ready
</script>

<div class="ui__section" id="ui_tables">
	<h3 class="header">관심있는 지역을 선택해 주세요</h3>
	<div class="row">
		<div class="col-sm-9">
			<div id="regionAjax"></div>
			지역
			<select id="region">
				<option>전체</option>
				<c:forEach var="RegionList" items="${requestScope.RegionList}">
					<option value="${RegionList.region}">${RegionList.region}</option>
				</c:forEach>
			</select>
		</div>
		<table class="table table-striped table-bordered">
			<caption>모임게시판</caption>
			<thead>
				<tr>
					<th>글번호</th>
					<th>지역</th>
					<th>공통관심</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody id="meetingRegionList">
				<c:forEach var="meetingList"  items="${requestScope.listVO.list }">
					<tr>
						<td>${meetingList.boardNo}</td>
						<td>${meetingList.region}</td>
						<td>${meetingList.interest}</td>
						<td><a href="${pageContext.request.contextPath}/meetingDetail.do?boardNo=${meetingList.boardNo}">${meetingList.title}</a></td>
						<td>${meetingList.memberVO.nickName}</td>
						<td>${meetingList.timePosted}</td>
						<td>${meetingList.hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br><br><br>
	
	<!-- / .table-responsive -->
	<div class="row">
		<div class="col-sm-5"></div>
		<div class="col-sm-5">
			<form class="form-inline topbar__search" role="form">
				<select class="selectpicker" id="findType">
					<option value="findByTitle">제목</option>
					<option value="findByWriter">작성자</option>
				</select> 
				<label class="sr-only" for="nav-search">Search</label> 
				<input type="text" class="form-control" id="searchKeyWord" name="search" placeholder="Search here...">
				<button type="button" id="searchSubmit">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
		<div class="col-sm-2">
			<div class="ui__section" id="ui_buttons">
				<a href="${pageContext.request.contextPath}/meetingWriteForm.do" class="btn btn-sm btn-primary">글작성</a>
			</div>
		</div>
	</div> 
	
	<!-- paging -->
	<div class="ui__section" id="ui_pagination" align="center">
		<nav>
			<ul class="pagination">  
			<c:if  test="${requestScope.listVO.pagingBean.previousPageGroup}">
				<li><a href="${pageContext.request.contextPath}/meetingList.do?pageNo=${requestScope.listVO.pagingBean.startPageOfPageGroup-1}" aria-label="Previous"><span
						aria-hidden="true">«</span></a></li>
			</c:if>
			<c:forEach var ="pb" begin = "${requestScope.listVO.pagingBean.startPageOfPageGroup}" end = "${requestScope.listVO.pagingBean.endPageOfPageGroup}">
				<li class="active">
				<a href="${pageContext.request.contextPath}/meetingList.do?pageNo=${pb}&command=${command}&searchKeyWord=${keyword}">${pb}
				<span class="sr-only" >(current)</span></a></li> 
			</c:forEach>
			<c:if test= "${requestScope.listVO.pagingBean.nextPageGroup}">  
				<li><a href="${pageContext.request.contextPath}/meetingList.do?pageNo=${requestScope.listVO.pagingBean.endPageOfPageGroup+1}" 
				aria-label="Next"><span aria-hidden="true">»</span></a></li>
			</c:if>
			</ul>
		</nav>
	</div>
	
</div>
	
