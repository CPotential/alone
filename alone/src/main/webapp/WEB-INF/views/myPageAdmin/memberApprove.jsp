<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
    <div class="container">
        
    <div class="row">
    
      <div class="col-sm-4 col-md-3 col-lg-2">
         

        <ul class="list-unstyled profile-social center-block">
          <li>
            <a href="${pageContext.request.contextPath}/myPageAdmin/showInfo.do" class="btn btn-default btn-block">메인</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageAdmin/memberApprove.do" class="btn btn-default btn-block"> 회원승인</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageAdmin/memberRemove.do" class="btn btn-default btn-block"> 회원탈퇴</a>
          </li>
        </ul>
      </div>
        
           <div class="col-sm-8 col-md-9 col-lg-10">
           <!-- Tab content -->
               
       <div class="ui__section" id="ui_tables">
 
  <!-- Tables -->
  
  
    <!-- PAGE HEADER
    ============================== -->

           
   <div class="row">
          <div class="col-xs-12">
            <h2 class="page-header__title">Approve</h2>             
            <ol class="breadcrumb page-header__breadcrumb">
              <li><a href="#">Generic</a></li>
              <li><a href="#">Company</a></li>
              <li class="#">Main</li>
            </ol>
          </div>
     </div>
     
        <!--     <h3 class="header">승인 요청목록</h3> -->
            <!-- <div class="table-responsive"> -->
    
     
             <!--  <table class="table table-striped table-bordered"> -->
            <div class="table-responsive shopping-cart__table">
            <table class="table table-striped">
                <thead>
                  <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                   <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo </td>
                   <td> <a class="btn btn-primary">approve</a></td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                    <td> <a class="btn btn-primary">approve</a></td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                    <td> <a class="btn btn-primary">approve</a></td>
                  </tr>
                      <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                    <td> <a class="btn btn-primary">approve</a></td>
                  </tr>
                </tbody>
              </table>
            </div> <!-- / .table-responsive -->
          </div>  <!-- ui__section -->

 </div>
 </div>
 </div><!-- / .container -->