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
			<c:forEach items="${introduceList }" var="list">
				<div class="col-xs-12 col-sm-4 filter__item filter_modernism">
					<div class="portfolio__item">
						<!-- Image -->
						<div class="portfolio__img">
							<a href="portfolio-item.html"> 
								<img src="${pageContext.request.contextPath}/resources/img/general_1.jpg" alt="Portfolio Image">
								<%-- general_1.jpg -> ${list.imageVO.imageName} --%>
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
									${keyWordList.keyWordName}  
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

