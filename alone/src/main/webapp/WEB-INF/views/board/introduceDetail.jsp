<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(function(){
		$("#like").click(function(){
			$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/likeUpAjax.do",
				data : "command=introduce&boardNo="+'${param.boardNo}',
				dataType : "json",
				success : function(result) {
					$("#likeNum").html("좋아요 : "+ result);
				}
			}) // ajax
		}); // click
	});//ready
</script>

 <!-- Panels -->

<div class="ui__section" id="ui_panels">
	<h3 class="header">Details</h3>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">가게 사진</h3>
				</div>
				<div class="panel-body" >
					<c:forEach items="${requestScope.introVO.imageVO}" var="image">
						<img src="${pageContext.request.contextPath}/resources/upload/${image.imageName}" width="50%" height="40%"><br>
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
				<div align="right" id="like">
					<img src="${pageContext.request.contextPath}/resources/img/좋아요.jpg">
				</div>
				</div>
				<div class="panel-footer">
					<div class="btn-group btn-group-justified">
						<a href="${pageContext.request.contextPath}/introduceList.do?categoryNo=" class="btn btn-default">목 록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- / row -->
</div>
<!-- / ui__section -->

