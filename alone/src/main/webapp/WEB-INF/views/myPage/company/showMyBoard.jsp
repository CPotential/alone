<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- Panels -->
 <div class="container">
	<div class="row">

 
          <div class="col-sm-8 col-md-9 col-lg-10">

 <!-- Panels -->
          <div class="ui__section" id="ui_panels">
            <h3 class="header">Details</h3>
            <div class="row">
              <div class="col-sm-6">
                <div class="panel panel-primary">
                  <div class="panel-heading"></div>
                  <div class="panel-body">
                  서버경로  : ${pageContext.request.contextPath}
        <%--   			<c:forEach items="${list.imageVO}" var="imageList">
<img src="${pageContext.request.contextPath}/resources/upload/${imageList.imageName}" alt="Portfolio Image">
general_1.jpg -> ${list.imageVO.imageName}
</c:forEach> --%>
<!-- fileOriginal name 따로 저장해야되는구나. -->
    <c:forEach items="${requestScope.introVO.imageVO}" var="imgVO">
     <a href="${pageContext.request.contextPath}/fileDownload.do?fileName=${imgVO.imageName}">${imgVO.imageName}</a>
	<img src="${pageContext.request.contextPath}/resources/upload/${imgVO.imageName}">
    </c:forEach>
                  </div>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">가게 상세정보</h3>
                  </div>
                  <div class="panel-body">  
                  	${requestScope.introVO.content}<br><br>
                  	장소:${requestScope.introVO.location}<br>
                  	영업시간:${requestScope.introVO.businessHours}<br>
                  	전화번호:${requestScope.introVO.tel}<br> 
                  	키워드:
                  	<c:forEach items="${requestScope.introVO.keyWordVO}" var="keyVO">
                  		#${keyVO.keyWordName}
                  	</c:forEach>
                  	<br>
                  </div>
    
                </div>
              </div>
                       <div class="panel-footer">
          <div class="btn-group btn-group-justified">
      <%--       <a href="${pageContext.request.contextPath}/reviewList.do" class="btn btn-default">목 록</a> --%>
            <a href="${pageContext.request.contextPath}/introduceUpdateForm.do?boardNo=${requestScope.introVO.boardNo}" class="btn btn-default">수 정</a>
            <a href="#" class="btn btn-default">삭 제</a>
      
          		</div>
        	</div>
              
            </div> <!-- / row -->
          </div> <!-- / ui__section -->

</div>
</div>
</div>
    