<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form class="form-horizontal">
	<fieldset>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-2 control-label" for="textinput"></label>
			<div class="col-md-3">
				<input id="textinput" name="textinput" type="text" value="${meetingVO.title}" placeholder="제목" class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="작성자" value="${meetingVO.memberVO.nickName}"
					class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="작성일" value="${meetingVO.timePosted}" class="form-control input-md">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label" for="textinput"></label>

			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="지역" value="${meetingVO.region}" class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="관심사항" value="${meetingVO.interest}" class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="조회수" value="${meetingVO.hits}" class="form-control input-md">
			</div>
		</div>

		<!-- Textarea -->
		<div class="form-group">
			<label class="col-md-2 control-label" for="textarea"></label>
			<div class="col-md-8">
				<textarea class="form-control" id="textarea" name="textarea">${meetingVO.content}</textarea>
			</div>
		</div>

		<!-- Button (Double) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="button1id"></label>
			<div class="col-md-8">
				<button id="button1id" name="button1id" class="btn btn-success">글목록 가기</button>
			</div>
		</div>

	</fieldset>
</form>

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
