<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5a5f74b55c137eef83dc34e43b7a72b7&libraries=services"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var boardNo = ${param.boardNo}
		var content = "";
		var commentNo = "";
		$("#sendComment").click(function() {
			var comment = $("#sendContent").val()

			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/sendCommentAjax.do",
				data : "comment=" + comment	+ "&boardNo=" + boardNo,
				success : function(data) {
					var json = "";
					for (var i = 0; i < data.length; i++) {
						json += "<div class='comment'>";
						json += " <div class='comment__author_img'>"
						json += data[i].memberVO.nickName;
						json += "</div> <div class='comment__content' id='commentresetView'>";
						json += "<div class='comment__author_name'>"
						json += data[i].memberVO.nickName;
						json += "</div>";
						json += "<time datetime="
						json += data[i].timePosted;
						json += "class='comment__date'> </time>";
						json += "<p>";
						json += data[i].content;
						json += "</p>";
						<c:set var="id" value="${sessionScope.memberVO.id }"/>

						var id =data[i].memberVO.id;
						var nowid= '<c:out value="${id}"/>'
						
						if(id ==nowid ){
						json += "<div class='btn-group pull-right' role='group' aria-label='comment__actions'>";
						json += " <a href='#' id='removeComment' class='btn btn-default btn-xs'><i class='fa fa-times'></i> Remove</a>";
						json += " <a href='#' id='editComment' class='btn btn-default btn-xs'><i class='fa fa-edit'></i> Edit</a>";
						json += " <a href='#' class='btn btn-primary btn-xs'><i class='fa fa-reply'></i> Answer</a>";
						json +="</div>"
						}
						json += "<input type='hidden' id='commentNo'  value="
						json += data[i].commentNo
						json +=">"
						json += "</div></div>";
					}
					$("#commentView").html(json);
					
				}//callback			
			}); //ajax
		}); // sendCommentclick 이벤트

		$("#commentView").on("click", "#editComment", function() {
			content = $(this).parent().prev().html().trim();
			commentNo = $(this).parent().next().val();
			$("#commentresetView").empty();
			$("#commentresetView").html("<textarea class='form-control'"
					+"rows='2' id='comment'>"+content+"</textarea>"
					+"<a href='#' id='updateComment' class='btn btn-default btn-xs'>"
					+"<i class='fa fa-edit'></i> 수정하기</a>");
		});//editComment (댓글 수정)

		$("#commentView").on("click", "#updateComment", function() {
			content = $(this).prev().val();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/updateCommentAjax.do",
				data : "content=" + content + "&commentNo=" + commentNo + "&boardNo=" + boardNo,
				success : function(data) {
					var json = "";
					for (var i = 0; i < data.length; i++) {
						json += "<div class='comment'>";
						json += " <div class='comment__author_img'>"
						json += data[i].memberVO.nickName;
						json += "</div> <div class='comment__content' id='commentresetView'>";
						json += "<div class='comment__author_name'>"
						json += data[i].memberVO.nickName;
						json += "</div>";
						json += "<time datetime="
						json += data[i].timePosted;
						json += "class='comment__date'> </time>";
						json += "<p>";
						json += data[i].content;
						json += "</p>";
						<c:set var="id" value="${sessionScope.memberVO.id }"/>
						var id = data[i].memberVO.id;
						var nowid = '<c:out value="${id}"/>'

						if (id == nowid) {
							json += "<div class='btn-group pull-right' role='group' aria-label='comment__actions'>";
							json += " <a href='#' id='removeComment'class='btn btn-default btn-xs'><i class='fa fa-times'></i> Remove</a>";
							json += " <a href='#'  id='editComment' class='btn btn-default btn-xs'><i class='fa fa-edit'></i> Edit</a>";
							json += " <a href='#' class='btn btn-primary btn-xs'><i class='fa fa-reply'></i> Answer</a>";
							json +="</div>"
							}
							json +="<input type='hidden' id='commentNo'  value="
							json += data[i].commentNo
							json +=">"
							json += "</div></div>"; 
						} 
						$("#commentView").html(json);
					}
				});  //ajax
			}); //commentView 수정하기 버튼
		//삭제하기
		$("#commentView").on("click","#removeComment",function(){
		 		if(confirm("댓글을 삭제하시겠습니까?")){
		 		commentNo = $(this).parent().next().val(); 
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/deleteCommentAjax.do",				
					data:"commentNo="+commentNo+"&boardNo="+boardNo,	 
					success:function(data){	
						var json = "";
						for (var i = 0; i < data.length ; i++) { 				
							json += "<div class='comment'>";
							json +=" <div class='comment__author_img'>"
							json += data[i].memberVO.nickName;
							json += "</div> <div class='comment__content' id='commentresetView'>";
							json +="<div class='comment__author_name'>"
							json += data[i].memberVO.nickName;
							json += "</div>";
							json += "<time datetime="
							json += data[i].timePosted;
							json += "class='comment__date'> </time>";
							json +="<p>";
							json += data[i].content;
							json +="</p>";
							<c:set var="id" value="${sessionScope.memberVO.id }"/>
							var id =data[i].memberVO.id;
							var nowid= '<c:out value="${id}"/>'
						  	
							if(id ==nowid ){
							json += "<div class='btn-group pull-right' role='group' aria-label='comment__actions'>";
							json += " <a href='#' id='removeComment'class='btn btn-default btn-xs'><i class='fa fa-times'></i> Remove</a>";
							json += " <a href='#'  id='editComment' class='btn btn-default btn-xs'><i class='fa fa-edit'></i> Edit</a>";
							json += " <a href='#' class='btn btn-primary btn-xs'><i class='fa fa-reply'></i> Answer</a>";
							json +="</div>" 
							}
							json +="<input type='hidden' id='commentNo'  value="
							json += data[i].commentNo
							json +=">"
							json += "</div></div>";  
						} 
						$("#commentView").html(json);
					}
				});  //ajax
	 	
	 		}else{
	 			location.href="meetingDetail.do?boardNo=${param.boardNo}";
	 		}
		}); //commentView 삭제하기 버튼
	}); // ready
</script>

<div class="container">
	<div class="row">
		<div class="col-sm-8 col-md-9">
			<a href="#"><span class="badge">No.${meetingVO.boardNo}</span></a> 
			<a href="#"><span class="badge">조회수 : ${meetingVO.hits}</span></a> 
			<a href="#"><span class="badge">날짜 : ${meetingVO.timePosted}</span></a>
		</div>
		<div class="nav nav-pills col-md-8 text-right">
			<a href="#">지역 : ${meetingVO.region}</a> | 
			<a href="#">관심사항 : 	${meetingVO.interest}</a> | 
			<a href="#">작성자 : ${meetingVO.memberVO.nickName}</a>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="well well">${meetingVO.title}</div>
				<c:forEach items="${requestScope.meetingVO.imageVO}" var="imageVO">
					<img src="${pageContext.request.contextPath}/resources/upload/${imageVO.imageName}" width="50%" height="50%">
				</c:forEach>
				<div class="panel-body">
					<table>
						<tr>
							<td>${meetingVO.content}</td>
							
						</tr>
					</table>
				</div>
				<div id="map" style="width: 500px; height: 400px;"></div>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3 // 지도의 확대 레벨
					};
					
					var map = new daum.maps.Map(mapContainer, mapOption); 
					var geocoder = new daum.maps.services.Geocoder();
					<c:set var="location" value="${meetingVO.location}"/>
					var fullAddr='<c:out value="${location}"/>'
					// 주소로 좌표를 검색합니다
					geocoder.addr2coord(fullAddr, function(status, result) {
					
						// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new daum.maps.Marker({
								map : map,
								position : coords
							});
							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
				</script>
				<sec:authentication property="principal.id" var="sessionId"/>
				<div class="panel-footer">
					<div class="btn-group btn-group-justified">
						<a href="${pageContext.request.contextPath}/meetingList.do" class="btn btn-default">목 록</a>
						<c:if test="${meetingVO.memberVO.id==sessionId}">
							<a href="${pageContext.request.contextPath}/reviewUpdateForm.do?boardNo=${requestScope.meetingVO.boardNo}" class="btn btn-default">수 정</a>
							<a href="${pageContext.request.contextPath}/meetingDelete.do?boardNo=${requestScope.meetingVO.boardNo}" class="btn btn-default">삭 제</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
	      <div class="row">
	        <div class="col-sm-8 col-md-9">
				<div class="comment comment_new">
					<div class="comment__author_img">
					   ${memberVO.nickName}
					</div>
					<div class="comment__content">
						<form>
						<div class="form-group">
							<label for="comment-new__textarea" class="sr-only">Enter your comment</label>
							<textarea class="form-control" rows="2" id="sendContent" placeholder="Enter your comment"></textarea>
						</div>
						<button type="button" id="sendComment"class="btn btn-primary">Send Comment</button>
						</form>
					</div> <!-- / .comment__content -->
	            </div> <!-- / .comment__new -->
	            <!-- Comments header -->
	            <div class="comment__header">
	              <span>List of Comments</span>
	            </div>
	                      
	            <!-- All comments -->
	            <div id="commentView">
	            <c:forEach var="commentList" items="${requestScope.commentList}">
					<div class="comment">
						<div class="comment__author_img">${commentList.memberVO.id}</div>
						<div class="comment__content" id="commentresetView">
							<div class="comment__author_name">  ${commentList.memberVO.nickName}</div>
							<time datetime="2015-01-30" class="comment__date">  ${commentList.timePosted}</time>
							<p>${commentList.content}</p>
							<c:set var="id" value="${sessionScope.memberVO.id }"/>
							<c:set var="nowid" value="${commentList.memberVO.id}"/>
							<c:if test="${id eq nowid}">
							
								<div class="btn-group pull-right" role="group" aria-label="comment__actions" >
									<a href="#" id="removeComment" class="btn btn-default btn-xs"><i class="fa fa-times"></i> Remove</a>
									<a href="#" id="editComment" class="btn btn-default btn-xs"><i class="fa fa-edit"></i> Edit</a>
									<a href="#" class="btn btn-primary btn-xs"><i class="fa fa-reply"></i> Answer</a>
								</div>
								<input type="hidden" id="commentNo"  value="${commentList.commentNo}">
							</c:if>
						</div> <!-- / .comment__content -->
					</div> <!-- / .comment -->
	            </c:forEach>
	            </div>
	       
			</div><!-- col-sm-8 col-md-9 -->
		</div><!-- row -->
	</div><!-- container -->
</div>

