<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	    <script src="//code.jquery.com/jquery.min.js"></script>
	    <script>
	    $(document).ready(function(){
	    	var memberId="";
	    	$("#idsearch").click(function(){
	    		memberId=$("#nav-search").val();
	    		
				$.ajax({
					type:"GET",
					url:"${pageContext.request.contextPath}/idsearch.do",	
					data:"id="+memberId,
					success:function(data){			
						if(data ==null){
							$("#memberidView").html("아이디가 없습니다.")
							$("#memberidView").html("0")
						}else{
						$("#memberidView").html(data.id);
						$("#memberMileageView").html(data.mileage);
						}
					}//callback			
				});//ajax
	    	});//click
	    	$("#mileageMinus").click(function(){
	    		var memberMileage = $("#memberMileageView").html();
	    		var mileageMinus =$("#product__quantity").val();
	    		var id=$("#memberidView").html().trim();
	    		alert(id);
	    		alert(memberId);

	    		if (id != memberId){
	    			alert("회원을 입력하세요");
	    		}else if(parseInt(mileageMinus) > parseInt(memberMileage)){
	    			alert("회원의 마일리지가 부족합니다.")
	    		}else{
	    			$.ajax({
						type:"GET",
						url:"${pageContext.request.contextPath}/mileageMinus.do",	
						data:"id="+id+"&mileage="+mileageMinus,
						success:function(data){			
							alert("성공");
			
						}//callback			
					});
	    		 	
	    			
	    		}
	    		
	    	});
	    	
	    });//ready
	    
	    </script>
<div class="container">
	<div class="row">

		<!-- Main -->
		<div class="col-sm-8 col-md-9 col-lg-10">
			<div class="topbar hidden-xs hidden-sm">
				<ul class="topbar-nav topbar-nav_right">
					<li>
						<!-- Search form -->
						<form class="form-inline topbar__search" role="form">
						<p> 아이디 검색
							<input
								type="search" class="form-control" id="nav-search"
								placeholder="Search here...">
								
							<button type="button" id="idsearch">
								<i class="fa fa-search"></i>
							</button>
							</p>
						</form>
					</li>
				</ul>

			</div>
			<!-- / .topbar -->

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
										<td id="memberidView">1000</td>
										<th scope="row">마일리지</th>
										<td id="memberMileageView">1000</td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- / .table-responsive -->
					</div>
				</div>
				<!-- tab-Content -->

				<div class="product__add-to-cart">
					<form class="form-inline">
						<div class="form-group">
							<label class="sr-only">Price</label>
							<p class="form-control-static">
								<strong>사용할 마일리지</strong>
							</p>
						</div>
						<div class="form-group">
							<label for="product__quantity" class="sr-only">Quantity</label> 
							<input type="number" id="product__quantity" value="1"
								class="form-control">
						</div>
						<button type="button" class="btn btn-default" id="mileageMinus">
							<i class="fa fa-cart-plus"></i> 차감하기
						</button>
					</form>
				</div>
				<!-- .product__add-to-cart -->
			</div>
			<!-- ui-section -->
		</div>
		<!-- 영역 -->
	</div>
	<!-- row -->
</div>
<!-- container -->