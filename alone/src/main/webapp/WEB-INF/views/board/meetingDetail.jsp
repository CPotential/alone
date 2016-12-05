<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

		 <div class="container">
    <div class="row">
      <div class="col-md-4">
        <a href="#"><span class="badge">No. 01</span></a>
        <a href="#"><span class="badge">조회수 : ${meetingVO.hits}</span></a>
        <a href="#"><span class="badge">날짜 : ${meetingVO.timePosted}</span></a>
      </div>
      <div class="nav nav-pills col-md-8 pull-right" role="tablist">
        <li role="presentation" class="pull-right"><a href="#">지역 : ${meetingVO.region}</a></li>
        <li role="presentation" class="pull-right"><a href="#">관심사항 : ${meetingVO.interest}</a></li>
        <li role="presentation" class="pull-right"><a href="#">작성자 : ${meetingVO.memberVO.nickName}</a></li>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="well well">${meetingVO.title}</div>
        <div class="panel-body">
          <table>
            <tr>
              <td>${meetingVO.content}
              </td>
            </tr>
          </table>
        </div>
        <div class="panel-footer">
        
          <div class="container">
          <div class = "row">
         
          <div class="btn-group btn-group-justified">
            <a href="#" class="btn btn-default">목 록</a>
            <a href="#" class="btn btn-default">수 정</a>
            <a href="#" class="btn btn-default">삭 제</a>
            </div>
            </div>

        </div>
      </div>
    </div>
    </div>
       
       
       

<!--  jquery 사용처입니다. -->
<script type="text/javascript">
	$(document).ready(function() {

		$("#sendComment").click(function() {
			var searchKeyWord = $("#searchKeyWord").val(); //검색어 값 받아오기
			if (searchKeyWord == "") {
				alert("검색어를 입력하세요!");
			} else {
				var command = $("#findType").val() + ".do";
				alert(command)
				location.href = command + "?searchKeyWord=" + searchKeyWord;
			}
		}); // click 이벤트
	}); // ready
</script> --%>


 <div class="container">
    <div class="row">
       <div class="col-sm-8 col-md-9">
        <a href="#"><span class="badge">No. 01</span></a>
        <a href="#"><span class="badge">조회수 : ${meetingVO.hits}</span></a>
        <a href="#"><span class="badge">날짜 : ${meetingVO.timePosted}</span></a>
      </div>
      <div class="nav nav-pills col-md-8 pull-right" role="tablist">
      <ul>
        <li role="presentation" class="pull-right"><a href="#">지역 : ${meetingVO.region}</a></li>
        <li role="presentation" class="pull-right"><a href="#">관심사항 : ${meetingVO.interest}</a></li>
        <li role="presentation" class="pull-right"><a href="#">작성자 : ${meetingVO.memberVO.nickName}</a></li>
       </ul>
      </div>
    </div>
    <div class="container">
      <div class="row">
         <div class="col-sm-8 col-md-9">
        <div class="well well">${meetingVO.title}</div>
        <div class="panel-body">
          <table>
            <tr>
              <td>${meetingVO.content}
              </td>
            </tr>
          </table>
        </div>
        <div class="panel-footer">
          <div class="btn-group btn-group-justified">
            <a href="#" class="btn btn-default">목 록</a>
            <a href="#" class="btn btn-default">수 정</a>
            <a href="#" class="btn btn-default">삭 제</a>
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
                    <textarea class="form-control" rows="2" id="comment" placeholder="Enter your comment"></textarea>
                  </div>
                  <button type="submit" id="sendComment"class="btn btn-primary">Send Comment</button>
                </form>
              </div> <!-- / .comment__content -->
            </div> <!-- / .comment__new -->

            <!-- Comments header -->
            <div class="comment__header">
              <span>List of Comments</span>
            </div>

            <!-- All comments -->
            <c:forEach var="commentList" items="${requestScope.commentList}">
            <div class="comment">
              <div class="comment__author_img">
                 ${commentList.memberVO.nickName}
              </div>
              <div class="comment__content">
                <div class="comment__author_name">  ${commentList.memberVO.nickName}</div>
                <time datetime="2015-01-30" class="comment__date">  ${commentList.timePosted}</time>
                <p>
                  ${commentList.content}
                </p>
                <div class="btn-group pull-right" role="group" aria-label="comment__actions">
                  <a href="#" class="btn btn-default btn-xs"><i class="fa fa-times"></i> Remove</a>
                  <a href="#" class="btn btn-default btn-xs"><i class="fa fa-edit"></i> Edit</a>
                  <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-reply"></i> Answer</a>
                </div>
              </div> <!-- / .comment__content -->
            </div> <!-- / .comment -->
            </c:forEach>
          
       
	</div><!-- col-sm-8 col-md-9 -->
	</div><!-- row -->
	</div><!-- container -->
    </div>
