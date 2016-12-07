<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

<!--  jquery 사용처입니다. -->

<script type="text/javascript">

</script>


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
       <a href="#">작성자 : ${rvo.memberVO.nickName}</a> | 
       <a href="#">좋아요 : ${rvo.likes}</a>
      </div>
    </div>
    <div class="container">
      <div class="row">
         <div class="col-sm-8 col-md-9">
        <div class="well well">${rvo.title}</div>
        <div class="panel-body">
          <table>
            <tr>
              <td>${rvo.content}
              </td>
            </tr>
          </table>
        </div>
        			<!-- 	<div id="map" style="width:500px;height:400px;"></div>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
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
	            map: map,
	            position: coords
	        });

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
		</script> -->
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
    
   <%--  
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
              <div class="comment__author_img">
                  ${commentList.memberVO.id}
              </div>
              <div class="comment__content" id="commentresetView">
                <div class="comment__author_name">  ${commentList.memberVO.nickName}</div>
                <time datetime="2015-01-30" class="comment__date">  ${commentList.timePosted}</time>
                <p>
                  ${commentList.content}
                </p>
                
                <c:set var="id" value="${sessionScope.memberVO.id }"/>
                <c:set var="nowid" value="${commentList.memberVO.id}"/>
                <c:if test="${id eq nowid}">
                <div class="btn-group pull-right" role="group" aria-label="comment__actions" >
                  <a href="#"  class="btn btn-default btn-xs"><i class="fa fa-times"></i> Remove</a>
                  <a href="#" id="editComment" class="btn btn-default btn-xs"><i class="fa fa-edit"></i> Edit</a>
                  <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-reply"></i> Answer</a>
                </div>
                <input type="hidden" id="commentNo"  value="${commentList.commentNo}">
                </c:if>
              </div> <!-- / .comment__content -->
            </div> <!-- / .comment -->
            </c:forEach>
            </div>
           --%>
       
	</div><!-- col-sm-8 col-md-9 -->
	</div><!-- row -->
	</div><!-- container -->
    </div>
