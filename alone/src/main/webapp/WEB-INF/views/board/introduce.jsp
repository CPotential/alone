<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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


<!-- PAGE CONTENT
    ============================== -->
<div class="container">
	<div class="row">
		<div class="col-xs-12">
			<div class="portfolio__nav">
				<div class="row">
					<div class="col-sm-8 col-md-9">
						<!-- Categories -->
						<ul class="nav nav-tabs nav-justified filter__nav" role="tablist">
							<li role="presentation" class="active"><a href="#"
								role="tab" data-toggle="tab" data-filter="*">Food</a></li>
							<li role="presentation"><a href="#" role="tab"
								data-toggle="tab" data-filter=".filter_modernism">Drink</a></li>
							<li role="presentation"><a href="#" role="tab"
								data-toggle="tab" data-filter=".filter_impressionism">Art</a></li>
						</ul>
					</div>
					<!-- Columns -->
					<div class="col-sm-4 col-md-3">
						<ul class="nav nav-tabs nav-justified columns__nav hidden-xs"
							role="tablist">
							<li role="presentation"><a href="#" role="tab"
								data-toggle="tab" data-grid="col-sm-6"> <i
									class="fa fa-columns"></i> 2
							</a></li>
							<li role="presentation" class="active"><a href="#"
								role="tab" data-toggle="tab" data-grid="col-sm-4"> <i
									class="fa fa-columns"></i> 3
							</a></li>
							<li role="presentation"><a href="#" role="tab"
								data-toggle="tab" data-grid="col-sm-4 col-md-3"> <i
									class="fa fa-columns"></i> 4
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- / .portfolio__nav -->
		</div>
	</div>
	<!-- / .row -->

	<!-- Portfolio -->
	<div class="portfolio__items">
		<div class="row">
			<c:forEach items="${introduceList }" var="list">
				<div class="col-xs-12 col-sm-4 filter__item filter_modernism">
					<div class="portfolio__item">
						<!-- Image -->
						<div class="portfolio__img">
							<a href="portfolio-item.html"> <img src="img/general_1.jpg"
								alt="Portfolio Image">
							</a>
						</div>
						<!-- Captions -->
						<div class="portfolio__caption">
							<h3 class="portfolio__title">${list.memberVO.nickName }</h3>
							<div class="portfolio__intro">Morbi vulputate eget ipsum
								vel maximus. Morbi dictum blandit mattis.</div>
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

