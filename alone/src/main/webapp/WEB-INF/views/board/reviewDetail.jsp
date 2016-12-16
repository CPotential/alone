<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

<!-- 비회원 접근시  -->
<sec:authorize ifNotGranted="ROLE_MEMBER,ROLE_ADMIN,ROLE_COMPANY_VERIFIED,ROLE_COMPANY_NON_VERIFIED">
<div class="container">
	<div class="row">
		<div class="col-sm-8 col-md-9">
			<a href="#"><span class="badge">No. ${rvo.boardNo }</span></a> <a
				href="#"><span class="badge">조회수 : ${rvo.hits}</span></a> <a
				href="#"><span class="badge">날짜 : ${rvo.timePosted}</span></a>
		</div>
		<div class="nav nav-pills col-md-8 text-right">
			<a href="#">작성자 : ${rvo.memberVO.nickName}</a> 
			<a  id="likeNum">좋아요 : ${rvo.likes}</a>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="well well">${rvo.title}</div>
				<div class="panel-body">
					<table>
						<tr>
							<td>${rvo.content}</td>
						</tr>
					</table>
				</div>

				<div class="panel-footer">
					<div class="btn-group btn-group-justified">
						<a href="${pageContext.request.contextPath}/reviewList.do"
							class="btn btn-default">목 록</a>
					</div>
				</div>
			</div>

			<div class="col-sm-8 col-md-9">
				<!-- / .comment__new -->
				
				<!-- Comments header -->
				<div class="comment__header">
					<span>List of Comments</span>
				</div>

				<!-- All comments -->
				<div id="commentView">
					<c:forEach var="commentList" items="${requestScope.commentList}">
						<div class="comment">
							<div class="comment__content" id="commentresetView">
								<div class="comment__author_name">
									${commentList.memberVO.nickName}</div>
								<time datetime="${commentList.timePosted}" class="comment__date">
									${commentList.timePosted}</time>
								<p>${commentList.content}</p>

							</div>
							<!-- / .comment__content -->
						</div>
						<!-- / .comment -->
					</c:forEach>
				</div>
			</div>
			<!-- col-sm-8 col-md-9 -->
		</div>
	</div>
</div>

</sec:authorize> 

<!-- 회원 접근 시 댓글 보이게 -->
<sec:authorize ifAnyGranted="ROLE_MEMBER,ROLE_ADMIN,ROLE_COMPANY_VERIFIED,ROLE_COMPANY_NON_VERIFIED">
<sec:authentication property="principal.id" var="sessionId" />
<!--  jquery 사용처입니다. -->
<script type="text/javascript">
	$(document).ready(function() {
		var boardNo = ${param.boardNo}
		var content = "";
		var commentNo = "";
		$("#sendComment").click(function() {
			var comment = $("#sendContent").val();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/sendCommentAjax.do",
				data : "comment="+ comment+ "&boardNo="+ boardNo,
				success : function(data) {
					var json = "";
					for (var i = 0; i < data.length; i++) {
						json += "<div class='comment'>";
						json += " <div class='comment__content' id='commentresetView'>";
						json += "<div class='comment__author_name'>"
						json += data[i].memberVO.nickName;
						json += "</div>";
						json += "<time datetime="
						json += "class='comment__date'> ";
						json += data[i].timePosted;
						json += "</time><p>";
						json += data[i].content;
						json += "</p>";
						var id = data[i].memberVO.id;
						var nowid = '<c:out value="${sessionId}"/>'

						if (id == nowid) {
							json += "<div class='btn-group pull-right' role='group' aria-label='comment__actions'>";
							json += " <a  id='removeComment' class='btn btn-default btn-xs'><i class='fa fa-times'></i> Remove</a>";
							json += " <a  id='editComment' class='btn btn-default btn-xs'><i class='fa fa-edit'></i> Edit</a>";
							json += "</div>"
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

		$("#commentView").on("click","#editComment",function() {
			content = $(this).parent().prev().html().trim();
			commentNo = $(this).parent().next().val();
			$("#commentresetView").empty();
			$("#commentresetView").html("<textarea class='form-control'"+"rows='2' id='comment'>"
				+ content+ "</textarea>"+ "<a id='updateComment' class='btn btn-default btn-xs'>"
				+ "<i class='fa fa-edit'></i> 수정하기</a>");

		});//editComment (댓글 수정)

		$("#commentView").on("click","#updateComment",function() {
			content = $(this).prev().val();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/updateCommentAjax.do",
				data : "content="+ content+ "&commentNo="+ commentNo+ "&boardNo="+ boardNo,
				success : function(data) {
					var json = "";
					for (var i = 0; i < data.length; i++) {
						json += "<div class='comment'>";
						json += " <div class='comment__content' id='commentresetView'>";
						json += "<div class='comment__author_name'>"
						json += data[i].memberVO.nickName;
						json += "</div>";
						json += "<time datetime="
						json += "class='comment__date'> ";
						json += data[i].timePosted;
						json += "</time><p>";
						json += data[i].content;
						json += "</p>";
						var id = data[i].memberVO.id;
						var nowid = '<c:out value="${sessionId}"/>'

						if (id == nowid) {
							json += "<div class='btn-group pull-right' role='group' aria-label='comment__actions'>";
							json += " <a  id='removeComment'class='btn btn-default btn-xs'><i class='fa fa-times'></i> Remove</a>";
							json += " <a  id='editComment' class='btn btn-default btn-xs'><i class='fa fa-edit'></i> Edit</a>";
							json += "</div>"
						}
						json += "<input type='hidden' id='commentNo'  value="
						json += data[i].commentNo
						json +=">"
						json += "</div></div>";
					}
					$("#commentView").html(json);
				}
			}); //ajax
		}); //commentView 수정하기 버튼
		
		//삭제하기
		$("#commentView").on("click","#removeComment",function() {
			if (confirm("댓글을 삭제하시겠습니까?")) {
				commentNo = $(this).parent().next().val();
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/deleteCommentAjax.do",
					data : "commentNo="+ commentNo+ "&boardNo="+ boardNo,
					success : function(data) {
						var json = "";
						for (var i = 0; i < data.length; i++) {
							json += "<div class='comment'>";
						
							json += "<div class='comment__content' id='commentresetView'>";
							json += "<div class='comment__author_name'>"
							json += data[i].memberVO.nickName;
							json += "</div>";
							json += "<time datetime="
							json += "class='comment__date'> ";
							json += data[i].timePosted;
							json += "</time><p>";
							json += data[i].content;
							json += "</p>";
							var id = data[i].memberVO.id;
							var nowid = '<c:out value="${sessionId}"/>'

							if (id == nowid) {
								json += "<div class='btn-group pull-right' role='group' aria-label='comment__actions'>";
								json += " <a id='removeComment'class='btn btn-default btn-xs'><i class='fa fa-times'></i> Remove</a>";
								json += " <a  id='editComment' class='btn btn-default btn-xs'><i class='fa fa-edit'></i> Edit</a>";
								json += "</div>"
							}
							json += "<input type='hidden' id='commentNo'  value="
							json += data[i].commentNo
							json +=">"
							json += "</div></div>";
						}
						$("#commentView").html(json);
					}
				}); //ajax
			} else {
				location.href = "reviewDetail.do?boardNo=${param.boardNo}";
			}
		}); //commentView 삭제하기 버튼
		
		$("#like").click(function() {
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/likeUpAjax.do",
				data : "boardNo=" + '${rvo.boardNo}',
				dataType : "json",
				success : function(result) {
					$("#likeNum").html("좋아요 : "+ result);
				}
			}) // ajax
		});// click
	}); // ready
</script>
<!--  jquery 사용처입니다. -->


<div class="container">
	<div class="row">
		<div class="col-sm-8 col-md-9">
			<a href="#"><span class="badge">No. ${rvo.boardNo }</span></a> 
			<a 	href="#"><span class="badge">조회수 : ${rvo.hits}</span></a> 
			<a 	href="#"><span class="badge">날짜 : ${rvo.timePosted}</span></a>
		</div>
		<div class="nav nav-pills col-md-8 text-right">
			<a href="#">작성자 : ${rvo.memberVO.nickName}</a> 
			<a  id="likeNum">좋아요 : ${rvo.likes}</a>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="well well">${rvo.title}</div>
				<div class="panel-body">
					<table>
						<tr>
							<td>${rvo.content}</td>
						</tr>
					</table>
				</div>
				<sec:authorize ifNotGranted="ROLE_COMPANY_VERIFIED,ROLE_COMPANY_NON_VERIFIED,ROLE_ADMIN">
	            <div align="right" id="like">
	               <img src="${pageContext.request.contextPath}/resources/img/좋아요.jpg">
	            </div>
	            </sec:authorize>
				<div class="panel-footer">
					<div class="btn-group btn-group-justified">
						<a href="${pageContext.request.contextPath}/reviewList.do" class="btn btn-default">목 록</a>
						<c:if test="${rvo.memberVO.id==sessionId}">
							<a 	href="${pageContext.request.contextPath}/reviewUpdateForm.do?boardNo=${requestScope.rvo.boardNo}" class="btn btn-default">수 정</a>
							<a 	href="${pageContext.request.contextPath}/reviewDelete.do?boardNo=${requestScope.rvo.boardNo}" class="btn btn-default">삭 제</a>
						</c:if>
					</div>
				</div>
			</div>

			<div class="col-sm-8 col-md-9">
				<div class="comment comment_new">
					<div class="comment__author_img">${memberVO.nickName}</div>
					<div class="comment__content">
						<form>
							<div class="form-group">
								<label for="comment-new__textarea" class="sr-only">Enteryour comment</label>
								<textarea class="form-control" rows="2" id="sendContent"placeholder="Enter your comment"></textarea>
							</div>
							<button type="button" id="sendComment" class="btn btn-primary">Send Comment</button>
						</form>
					</div>
					<!-- / .comment__content -->
				</div>
				<!-- / .comment__new -->
				
				<!-- Comments header -->
				<div class="comment__header">
					<span>List of Comments</span>
				</div>

				<!-- All comments -->
				<div id="commentView">
					<c:forEach var="commentList" items="${requestScope.commentList}">
						<div class="comment">
							<div class="comment__content" id="commentresetView">
								<div class="comment__author_name">
									${commentList.memberVO.nickName}</div>
								<time datetime="${commentList.timePosted}" class="comment__date">
									${commentList.timePosted}</time>
								<p>${commentList.content}</p>
								<c:if test="${commentList.memberVO.id== sessionId}">
									<div class="btn-group pull-right" role="group" aria-label="comment__actions">
										<a  id="removeComment"class="btn btn-default btn-xs"><i class="fa fa-times"></i>Remove</a> 
										<a id="editComment"class="btn btn-default btn-xs"><i class="fa fa-edit"></i>Edit</a> 
									</div>
									<input type="hidden" id="commentNo" value="${commentList.commentNo}">
								</c:if>
							</div>
							<!-- / .comment__content -->
						</div>
						<!-- / .comment -->
					</c:forEach>
				</div>
			</div>
			<!-- col-sm-8 col-md-9 -->
		</div>
	</div>
</div>

</sec:authorize>



