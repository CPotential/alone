<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

  <div class="ui__section" id="ui_typography">
   <h3 class="header">${meetingVO.title}</h3>
   <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" 
                    aria-expanded="true" aria-controls="collapseOne">
                      지역
                    </a>
                  </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                  <div class="panel-body">
                     ${meetingVO.region}
                  </div>
                </div>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                  <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" 
                    aria-expanded="false" aria-controls="collapseTwo">
                    관심사항
                    </a>
                  </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="panel-body">
                          ${meetingVO.interest}
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
      <div class="col-sm-8">
      <span class="label label-default text-right">조회수 ${meetingVO.hits}</span>
	<span class="label label-default text-right">날자 ${meetingVO.timePosted}</span>

     <div class="panel-heading">
        <h2 class="text-center" style="color: #fff">${meetingVO.title}</h2>
        <p class="text-right">작성자  ${meetingVO.memberVO.nickName}</p>
     </div>
   </div>
   
     <div class="panel-body">
       <p class="lead">${meetingVO.content}</p>
     </div>
     
     <div class="panel-footer">
         <div class="btn-group btn-group-justified">
            <a href="DispatcherServlet?command=reviewBoard" class="btn btn-default">목 록</a>
       <%--   <c:choose>
            <c:when test="${rvo.id==sessionScope.mvo.id}">
               <a href="DispatcherServlet?command=reviewUpdate&review_num=${rvo.review_num}"
               class = "btn btn-default">수 정</a>
               <a href="DispatcherServlet?command=reviewDelete&review_num=${rvo.review_num}
               &id=${sessionScope.mvo.id}" class="btn btn-default">삭 제</a>
            </c:when>
         </c:choose> --%>
         
         </div>
   </div>
   </div>
</div>
