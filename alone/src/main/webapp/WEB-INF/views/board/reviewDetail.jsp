<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
	$("#like").click(function() {
		$.ajax({ 
			type : "get",
			url : "${pageContext.request.contextPath}/likeUpAjax.do",
			data : "boardNo="+'${rvo.boardNo}',
			dataType : "json",
			success : function(result) {
				$("#likeNum").html("좋아요 : "+result.likes);  
			}
		}) // ajax
	}); // click
}); // ready
</script>
<!--  jquery 사용처입니다. -->

<script src="//code.jquery.com/jquery.min.js"></script>
    <div class="container">
    <div class="row">
       <div class="col-sm-8 col-md-9">
        <a href="#"><span class="badge">No. ${rvo.boardNo }</span></a>
        <a href="#"><span class="badge">조회수 : ${rvo.hits}</span></a>
        <a href="#"><span class="badge">날짜 : ${rvo.timePosted}</span></a>
      </div>
      <div class="nav nav-pills col-md-8 text-right" >
<%--         <a href="#">지역 : ${meetingVO.region}</a> |
       <a href="#">관심사항 : ${meetingVO.interest}</a> | --%>
       <a href="#">작성자 : ${rvo.memberVO.nickName}</a>
       <a href="#" id="likeNum">좋아요 : ${rvo.likes}</a>
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
        <div align="right" id="like">
        	<img src="${pageContext.request.contextPath}/resources/img/좋아요.jpg">
        </div>
        <div class="panel-footer">
          <div class="btn-group btn-group-justified">
            <a href="${pageContext.request.contextPath}/reviewList.do" class="btn btn-default">목 록</a>
        <c:if test="${rvo.memberVO.id==sessionScope.memberVO.id}">
            <a href="${pageContext.request.contextPath}/reviewUpdateForm.do?boardNo=${requestScope.rvo.boardNo}" class="btn btn-default">수 정</a>
            <a href="#" class="btn btn-default">삭 제</a>
        </c:if>
          		</div>
        	</div>
        </div>
      </div>
    </div>
 </div>

