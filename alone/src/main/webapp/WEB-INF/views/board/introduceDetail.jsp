<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Panels -->
<div class="ui__section" id="ui_panels">
	<h3 class="header">Details</h3>
	<div class="row">
		<div class="col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading">사진</div>
				<div class="panel-body">이미지 넣어주세여</div>
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
				</div>
			</div>
		</div>
	</div>
	<!-- / row -->
</div>
<!-- / ui__section -->
