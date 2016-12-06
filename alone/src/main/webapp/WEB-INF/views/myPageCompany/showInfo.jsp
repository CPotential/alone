<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <!-- PRELOADER (uncomment to enable)
    ============================== -->
    <!-- <div class="preloader">
      <img src="img/preloader.gif" alt="Loading..." class="preloader__img">
    </div> -->

    <div class="container">
      <div class="row">
      <div class="col-sm-4 col-md-3 col-lg-2">
  
         <ul class="list-unstyled profile-social center-block">
          <li>
            <a href="${pageContext.request.contextPath}/showCmemberInfo.do" class="btn btn-default btn-block">기업정보 </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/mileageDiscount.do" class="btn btn-default btn-block">마일리지 차감</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/leave.do" class="btn btn-default btn-block"> 회원탈퇴</a>
          </li>
              	<c:set var="write" value="${sessionScope.memberVO.write}" />
          	<c:choose>
    
				<c:when test="${write eq 0 }">
			  <li>
              <a href="${pageContext.request.contextPath}/myPageCompany/introduceWriteForm.do" class="btn btn-default btn-block"> 소개글쓰기</a>
             </li>
				</c:when>
        
				<c:otherwise>
				  <li>
              <a href="$#" class="btn btn-default btn-block"> 소개글수정</a>
             </li>

				</c:otherwise>
			</c:choose>
        </ul>
      </div>
        
        <div class="col-sm-8 col-md-9 col-lg-10">
         
          <!-- Tab content -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="personal-info">
              <h3 class="header header_plain">기업정보</h3> 
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <th scope="row">아이디</th> 
                      <td>${requestScope.cvo.id}</td> 
                    </tr>
                    <tr>
                      <th scope="row">대표명</th>
                      <td>${requestScope.cvo.name}</td>
                    </tr>
                    <tr>
                      <th scope="row">사업자등록번호</th>
                      <td>${requestScope.cvo.corporateRegistrationNumber}</td> 
                    </tr>
                    <tr>
                      <th scope="row">주소</th>
                      <td>${requestScope.cvo.address}</td>
                    </tr>
                    <tr>
                      <th scope="row">기업명</th>
                      <td>${requestScope.cvo.nickName}</td>
                    </tr>
                    <tr>
                      <th scope="row">대표번호</th>
                      <td>${requestScope.cvo.tel}</td> 
                    </tr>
     			 </tbody>
                </table>
              </div> <!-- / .table-responsive -->
            </div>
            <a href="${pageContext.request.contextPath}/MypageCmemberUpdateForm.do?id=${requestScope.cvo.id}" class="btn btn-primary" >수정하기</a>
          </div> <!-- / .tab-content -->
        </div>        
     
      </div> <!-- / .row -->
  
    </div> <!-- / .container -->
    
