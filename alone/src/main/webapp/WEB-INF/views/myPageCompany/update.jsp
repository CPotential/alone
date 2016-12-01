<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



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
        </ul>
      </div>
    
  
    
    <!-- PAGE CONTENT
    ============================== -->
  
      
   
          <div class="col-sm-8 col-md-9 col-lg-10">
            
         <div class="body-plain__title">
           <h1 class="text-center">Sign Up</h1>
           </div>
   
          <div class="body-plain__form">

            <!-- Sign Up form -->
            <form role="form">
              <div class="form-group">
                <label for="sign-up__name" class="sr-only">Enter name</label>
                <input type="text" class="form-control" id="sign-up__name" placeholder="Your name">
              </div>
              <div class="form-group">
                <label for="sign-up__username" class="sr-only">Enter username</label>
                <input type="text" class="form-control" id="sign-up__username" placeholder="Username">
              </div>
              <div class="form-group">
                <label for="sign-up__email" class="sr-only">Enter email</label>
                <input type="email" class="form-control" id="sign-up__email" placeholder="Enter email">
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label for="sign-up__password" class="sr-only">Enter password</label>
                      <input type="password" class="form-control" id="sign-up__password" placeholder="Password">
                    </div>
                  </div>
                  <div class="col-sm-6">
                    <div class="form-group">
                      <label for="sign-up__password_repeat" class="sr-only">Repeat password</label>
                      <input type="password" class="form-control" id="sign-up__password_repeat" placeholder="Repeat Password">
                    </div>
                  </div>
                </div>
              </div>
              <div class="checkbox">
                <label>
                  <input type="checkbox"> I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
                </label>
              </div>
      <!--  
              <button type="submit" class="btn btn-lg btn-primary">수정</button>
              <a class="btn btn-lg btn-primary">취소</a>
          
 -->
           <nav>
              <ul class="pager">
                <li><a href="#">수정</a></li>
                <li><a href="#">취소</a></li>
              </ul>
            </nav>

</form>

            <!-- Sign In link -->
            <hr />
            <p>Already a member? <a href="sign-in.html">Sign into your account.</a></p>
          </div> <!-- / .body-plain__form -->

          <!-- Footer -->
          <div class="body-plain__footer">
            Copyright 2015 <a href="http://simpleqode.com/">Simpleqode.com</a>. All Rights Reserved.
          </div>
         </div>
            </div> <!-- / .row -->
  
    </div> <!-- / .container -->
