<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- PRELOADER (uncomment to enable)
    ============================== -->
    <!-- <div class="preloader">
      <img src="img/preloader.gif" alt="Loading..." class="preloader__img">
    </div> -->


    <!-- PAGE CONTENT
    ============================== -->
    <div class="container">
         <div class="row">
      <div class="col-sm-4 col-md-3 col-lg-2">
         <ul class="list-unstyled profile-social center-block">
          <li>
            <a href="${pageContext.request.contextPath}/myPageCompany/showInfo.do" class="btn btn-default btn-block">기업정보 </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageCompany/mileageDiscount.do" class="btn btn-default btn-block">마일리지 차감</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageCompany/leave.do" class="btn btn-default btn-block"> 회원탈퇴</a>
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
    
  
    
    <!-- PAGE CONTENT
    ============================== -->
  
      
   
          <div class="col-sm-8 col-md-9 col-lg-10">
            
         <div class="body-plain__title">
           <h1 class="text-center">Sign Up</h1>
           </div>
           
     <div class="body-plain__form">

            <!-- Sign In form -->
            <form role="form">
              <label for="sign-in__email" class="sr-only">Enter email</label>
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="email" class="form-control" id="sign-in__email" placeholder="Enter email">
              </div>
              <br>
              <label for="sign-in__password" class="sr-only">Enter password</label>
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" id="sign-in__password" placeholder="Password">
              </div>
              <div class="checkbox">
                <label>
                  <input type="checkbox"> Remember me
                </label>
              </div>
              <button type="submit" class="btn btn-primary btn-block btn-lg">Submit</button>
            </form>

            <!-- Sign Up link -->
            <hr />
            <p>Not registered? <a href="sign-up.html">Create an Account.</a></p>

            <!-- Lost password form -->
            <p>
              Lost your password? <a href="#lost-password__form" data-toggle="collapse" aria-expanded="false" aria-controls="lost-password__form">Click here to recover.</a>
            </p>
            <div class="collapse" id="lost-password__form">
              <p class="text-muted">
                Enter your email address below and we will send you a link to reset your password.
              </p>
              <form class="form-inline" role="form">
                <div class="form-group">
                  <label class="sr-only" for="lost-password__email">Email address</label>
                  <input type="email" class="form-control" id="lost-password__email" placeholder="Enter email">
                </div>
                <button type="submit" class="btn btn-info">Send</button>
              </form>
            </div> <!-- lost-password__form -->
          </div> <!-- / .body-plain__form -->
          <!-- Footer -->
          <div class="body-plain__footer">
            Copyright 2015 <a href="http://simpleqode.com/">Simpleqode.com</a>. All Rights Reserved.
          </div>
         </div>
            </div> <!-- / .row -->
  
    </div> <!-- / .container -->

