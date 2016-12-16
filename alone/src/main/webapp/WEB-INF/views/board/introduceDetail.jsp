<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(function(){
		$("#like").click(function(){
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/likeUpAjax.do",
				data : "command=introduce&boardNo="+'${param.boardNo}',
				dataType : "json",
				success : function(result) {
					$("#likeNum").html("<i class='fa fa-check fa-fw text-primary'></i>좋아요 : "+ result);
				}
			}) // ajax
		}); // click
	});//ready
</script>

 <!-- Panels -->
	 <!-- PAGE CONTENT
    ============================== -->
    <div class="container">
      <div class="row">
        <div class="col-sm-8">
        <!-- Carousel -->
          <div id="product-item__carousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#product-item__carousel" data-slide-to="0" class="active"></li>
              <li data-target="#product-item__carousel" data-slide-to="1"></li>
              <li data-target="#product-item__carousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <c:set  var="introVO" value="${requestScope.introVO}"/>
            <div class="carousel-inner" role="listbox">
             <div class="item active">
            <img src="${pageContext.request.contextPath}/resources/upload/${introVO.mainImage.imageName}" width="100%" height="100%" alt="...">
    
                <div class="carousel-caption">
                 ${introVO.mainImage.originalFileName}
                </div>
              </div>
              
            <c:forEach items="${introVO.imageVO}" var="image">
             <div class="item">
				<img src="${pageContext.request.contextPath}/resources/upload/${image.imageName}" width="100%" height="100%" alt="...">
			
                <div class="carousel-caption">
                   ${image.originalFileName}
                </div>
                
             </div>
              </c:forEach>
        </div>
        


            <!-- Controls -->
            <a class="left carousel-control" href="#product-item__carousel" role="button" data-slide="prev">
              <i class="fa fa-angle-left" aria-hidden="true"></i>
              <i class="sr-only">Previous</i>
            </a>
            <a class="right carousel-control" href="#product-item__carousel" role="button" data-slide="next">
              <i class="fa fa-angle-right" aria-hidden="true"></i>
              <i class="sr-only">Next</i>
            </a>
          </div> <!-- / .carousel -->
        </div>
        <div class="col-sm-4">
          <h3 class="header header_plain">
               상세정보
          </h3>
          <ul class="rating_stars">
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star"></i></li>
            <li><i class="fa fa-star-half-o"></i></li>
            <li class="rating__comment">(3 reviews)</li>
          </ul>
          <p class="text-muted">
           ${requestScope.introVO.content}
          </p>
          <ul class="list-group">
            <li class="list-group-item"><i class="fa fa-check fa-fw text-primary"></i> 	장소:${introVO.location}</li>
            <li class="list-group-item"><i class="fa fa-check fa-fw text-primary"></i> 영업시간:${introVO.businessHours}</li>
            <li class="list-group-item"><i class="fa fa-check fa-fw text-primary"></i> 전화번호:${introVO.tel}</li>

            <li class="list-group-item"><i class="fa fa-check fa-fw text-primary"></i>
               <c:forEach items="${introVO.keyWordVO}" var="keyVO">
                #${keyVO.keyWordName}
            	</c:forEach></li>	
            <li class="list-group-item" id="likeNum"><i class="fa fa-check fa-fw text-primary"></i>좋아요 : ${introVO.likes}</li>

          </ul>
          	<sec:authorize ifNotGranted="ROLE_COMPANY_VERIFIED,ROLE_COMPANY_NON_VERIFIED">
				<div align="right" id="like">
					<img src="${pageContext.request.contextPath}/resources/img/좋아요.jpg">
				</div>
			</sec:authorize>

        </div>
    	<div class="panel-footer">
               <div class="btn-group btn-group-justified">
                  <a href="${pageContext.request.contextPath}/introduceList.do?categoryNo=${introVO.categoryVO.categoryNo}" class="btn btn-default">목 록</a>
               </div>
           </div>
      </div> <!-- / .row -->
<%--       <div class="row">
        <div class="col-sm-8">
          <!-- New review -->
          <div class="comment comment_new">
            <div class="comment__author_img">
              <img class="img-responsive" alt="..." src="${pageContext.request.contextPath}/resources/img/photo_4.jpg">
            </div>
            <div class="comment__content">
              <ul class="rating_stars rating-stars__new">
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
                <li><i class="fa fa-star-o"></i></li>
              </ul>
              <form>
                <div class="form-group">
                  <label for="comment-new__textarea" class="sr-only">Enter your review</label>
                  <textarea class="form-control" rows="2" id="comment-new__textarea" placeholder="Enter your review"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Review</button>
              </form>
            </div> <!-- / .comment__content -->
          </div> <!-- / .comment__new -->
    </div>
   </div> --%>
</div>