<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<!-- PAGE HEADER
    ============================== -->
<div class="page__header">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<h3 class="page-header__title">Introduce</h3>
				<ol class="breadcrumb page-header__breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">Introduce</li>
				</ol>
			</div>
		</div>
	</div>
</div>
 --%>

<!-- PAGE CONTENT
    ============================== -->
<div class="container">
	<!-- Portfolio -->
	<div class="portfolio__items">
		<div class="row">

			<c:forEach items="${ListVO.list}" var="list">

				<div class="col-xs-12 col-sm-4 filter__item filter_modernism">
					<div class="portfolio__item">
						<!-- Image -->
						<div class="portfolio__img">
							<a href="portfolio-item.html"> 
							<c:forEach items="${list.imageVO}" var="imageList">
								<img src="${pageContext.request.contextPath}/resources/upload/${imageList.imageName}" alt="Portfolio Image">
								<%-- general_1.jpg -> ${list.imageVO.imageName} --%>
								</c:forEach>
							</a>
						</div>
						<!-- Captions -->
						<div class="portfolio__caption">
							<h3 class="portfolio__title">
								<a href="${pageContext.request.contextPath}/introduceDetail.do?boardNo=${list.boardNo}">
									${list.memberVO.nickName }
								</a></h3>
							<div class="portfolio__intro">
								${list.region }<br>
								<c:forEach items="${list.keyWordVO}" var="keyWordList">
									#${keyWordList.keyWordName}  
								</c:forEach><br>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
		<!-- / .row -->
	</div>
	<!-- / .portfolio__items -->
</div>
<!-- / .container -->
<!--페이징 -->
<div class="ui__section" id="ui_pagination" align="center">
	<nav>
		<ul class="pagination">   
		<c:if  test="${requestScope.ListVO.pagingBean.previousPageGroup}">
			<li><a href="${pageContext.request.contextPath}/introduceList.do?pageNo=${requestScope.ListVO.pagingBean.startPageOfPageGroup-1}&categoryNo=${requestScope.categoryNo}" aria-label="Previous"><span
					aria-hidden="true">«</span></a></li>  
		</c:if>
		<c:forEach var ="pb" begin = "${requestScope.ListVO.pagingBean.startPageOfPageGroup}" end = "${requestScope.ListVO.pagingBean.endPageOfPageGroup}">
			<li class="active"><a href="${pageContext.request.contextPath}/introduceList.do?pageNo=${pb}&categoryNo=${requestScope.categoryNo}">${pb}<span class="sr-only" >(current)</span></a></li> 
		</c:forEach>	  
		<c:if test= "${requestScope.ListVO.pagingBean.nextPageGroup}">  
			<li><a href="${pageContext.request.contextPath}/introduceList.do?pageNo=${requestScope.ListVO.pagingBean.endPageOfPageGroup+1}&categoryNo=${requestScope.categoryNo}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
		</c:if> 
		</ul>
	</nav>
</div>
