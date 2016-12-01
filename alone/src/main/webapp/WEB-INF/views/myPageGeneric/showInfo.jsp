<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
            <a href="${pageContext.request.contextPath}/myPageGeneric/showInfo.do" class="btn btn-default btn-block">내정보 보기 </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageGeneric/showMileage.do" class="btn btn-default btn-block"> 마일리지</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageGeneric/leave.do" class="btn btn-default btn-block"> 회원탈퇴</a>
          </li>
        </ul>
      </div>
        
        <div class="col-sm-8 col-md-9 col-lg-10">
         
          <!-- Tab content -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="personal-info">
              <h3 class="header header_plain">Personal Info</h3>
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <th scope="row">Location</th>
                      <td>Los Angeles, CA</td>
                    </tr>
                    <tr>
                      <th scope="row">Occupation</th>
                      <td>Designer</td>
                    </tr>
                    <tr>
                      <th scope="row">Skills</th>
                      <td>HTML, CSS, JS, Bootstrap</td>
                    </tr>
                    <tr>
                      <th scope="row">Experience</th>
                      <td>5 years</td>
                    </tr>
                    <tr>
                      <th scope="row">Education</th>
                      <td>California State University, Los Angeles</td>
                    </tr>
                    <tr>
                      <th scope="row">Username</th>
                      <td>@SuperJohn</td>
                    </tr>
                    <tr>
                      <th scope="row">Type</th>
                      <td>Individual</td>
                    </tr>
                    <tr>
                      <th scope="row">Member Since</th>
                      <td>May 2012</td>
                    </tr>
                    <tr>
                      <th scope="row">Page URL</th>
                      <td>http://www.yoursite.com/profile</td>
                    </tr>
                    <tr>
                      <th scope="row">Verified User</th>
                      <td>Yes</td>
                    </tr>
                  </tbody>
                </table>
              </div> <!-- / .table-responsive -->
            </div>
            <a href="${pageContext.request.contextPath}/myPageGeneric/update.do" class="btn btn-primary" >수정하기</a>
          </div> <!-- / .tab-content -->
        </div>        
     
      </div> <!-- / .row -->
  
    </div> <!-- / .container -->
    
