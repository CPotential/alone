<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        
        
        <!-- Main -->
      <div class="col-sm-8 col-md-9 col-lg-10">
        
      <div class="topbar hidden-xs hidden-sm">

        <!-- Social links -->
        <ul class="topbar-nav topbar-nav_left">
          <li><a href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
          <li><a href="#"><i class="fa fa-vk"></i></a></li>
          <li><a href="#"><i class="fa fa-stumbleupon"></i></a></li>
        </ul>
        <ul class="topbar-nav topbar-nav_right">
          <li>
            <!-- Search form -->
            <form class="form-inline topbar__search" role="form">
              <label class="sr-only" for="nav-search">Search</label>
              <input type="search" class="form-control" id="nav-search" placeholder="Search here...">
              <button type="submit"><i class="fa fa-search"></i></button>
            </form>
          </li>
          <!-- Account links -->
          <li><a href="#">태그1</a></li>
          <li><a href="#">태그2</a></li>
          <li><a href="#">태그3</a></li>
        </ul>
 
    </div> <!-- / .topbar -->

  <!-- 검색 결과-->
      <div class="ui__section" id="ui_tables">
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="personal-info">
              <h3 class="header header_plain">Personal Info</h3>
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                      <tr>
                      <th scope="row">회원아이디</th>
                      <td>1000</td>
                       <th scope="row">마일리지</th>
                      <td>1000</td>
                    </tr>
           
                  </tbody>
                </table>
              </div> <!-- / .table-responsive -->
            </div>
            </div> <!-- tab-Content -->
            
             <div class="product__add-to-cart">
            <form class="form-inline">
              <div class="form-group">
                <label class="sr-only">Price</label>
                <p class="form-control-static"><strong>사용할 마일리지</strong></p>
              </div>
              <div class="form-group">
                <label for="product__quantity" class="sr-only">Quantity</label>
                <input type="number" id="product__quantity" value="1" class="form-control">
              </div>
              <button type="submit" class="btn btn-default"><i class="fa fa-cart-plus"></i> 확인</button>
            </form>
          </div> <!-- .product__add-to-cart -->
         </div> <!-- ui-section -->
          </div> <!-- 영역 -->
    </div> <!-- row -->
    </div> <!-- container -->