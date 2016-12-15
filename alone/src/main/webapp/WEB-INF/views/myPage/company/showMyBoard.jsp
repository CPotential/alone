<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#introduceUpdate").click(function() {
			location.href = "${pageContext.request.contextPath}/introduceUpdateForm.do?boardNo=${requestScope.introVO.boardNo}";
		});//click
		$("#introduceDelete").click(function() {
			if (confirm("삭제 하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/introduceDelete.do?boardNo=${requestScope.introVO.boardNo}";
			}
		}); //click
	});//ready
</script>
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

								<c:forEach items="${requestScope.introVO.imageVO}" var="imgVO">
									<!--  다운로드시는 서버에 저장되는 실제 이름과 같아야함/ 원래 저장했던 이미지로 다운로드하기!!! -->
									<a
										href="${pageContext.request.contextPath}/fileDownload.do?fileName=${imgVO.imageName}&originalFileName=${imgVO.originalFileName}">${imgVO.originalFileName}</a>
									<br>

									<img src="${pageContext.request.contextPath}/resources/upload/${imgVO.imageName}" width="100%" height="100%">

									<br>
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
								${requestScope.introVO.content}<br> <br>
								장소:${requestScope.introVO.location}<br>
								영업시간:${requestScope.introVO.businessHours}<br>
								전화번호:${requestScope.introVO.tel}<br> 키워드:
								<c:forEach items="${requestScope.introVO.keyWordVO}" var="keyVO">
                  		#${keyVO.keyWordName}
                  	</c:forEach>
								<br>
							</div>

						</div>
					</div>
					<div class="panel-footer">
					<!-- 	<div class="btn-group btn-group-justified"> -->

							<button type="button" class="btn btn-primary"
								id="introduceUpdate">수정</button>
							<button type="button" class="btn btn-primary"
								id="introduceDelete">삭제</button>
				<!-- 		</div> -->
					</div>

				</div>
				<!-- / row -->
			</div>
			<!-- / ui__section -->

		</div>
	</div>
</div>
