<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#region").change(function() {
			var region = $(this).val();
			/* if(region == ""){
				alert("지역을 선택하세요");
				$("#meetingRegionList").html(""); 
				return; 
			}  */
			$.ajax({
				type : "get",
				url : "getMeetingRegionList.do",
				data : "region=" + $("#region").val(),
				dataType : "json",
				success : function(rList) {

					if (rList.length == 0) {
						alert("지역을 선택해주세요");
						location.href = "getMeetingList.do"
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
							data += rList[i].title;
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
				}
			});
		});
	});
</script>


<div class="ui__section" id="ui_tables">
	<h3 class="header">관심있는 지역을 선택해 주세요</h3>
	<div class="row">
		<div class="col-sm-9">
			<select id="region">
				<option>지역</option>
				<c:forEach var="meetingList" items="${requestScope.RegionList}">
					<option value="${meetingList.region}">${meetingList.region}</option>
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
				<c:forEach var="meetingList" items="${requestScope.list}">
					<tr>
						<td>${meetingList.boardNo}</td>
						<td>${meetingList.region}</td>
						<td>${meetingList.interest}</td>
						<td><a
							href="${pageContext.request.contextPath}/meetingDetail.do?boardNo=${meetingList.boardNo}">${meetingList.title}</a></td>
						<td>${meetingList.memberVO.nickName}</td>
						<td>${meetingList.timePosted}</td>
						<td>${meetingList.hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- / .table-responsive -->
	<div class="row">
		<div class="col-sm-5"></div>
		<div class="col-sm-5">
			<form class="form-inline topbar__search" role="form"
				action="findMeetingList.do">
				<select class="selectpicker" name="select">
					<option>검색</option>
					<option value="작성자">작성자</option>
					<option value="제목">제목</option>
				</select> <label class="sr-only" for="nav-search">Search</label> <input
					type="search" class="form-control" id="nav-search" name="search"
					placeholder="Search here...">
				<button type="submit">
					<i class="fa fa-search"></i>
				</button>
			</form>

		</div>
		<div class="col-sm-2">
			<div class="ui__section" id="ui_buttons">
				<a href="${pageContext.request.contextPath}/meetingWriteForm.do"
					class="btn btn-sm btn-primary">글작성</a>
			</div>
		</div>
	</div>
</div>
<!-- / ui__section -->

