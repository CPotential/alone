<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=5a5f74b55c137eef83dc34e43b7a72b7&libraries=services"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("#form_meetingWrite").submit(function(){
			if($("#form_meetingWrite :input[name=title]").val().trim()==""){
				alert("제목을 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=region]").val().trim()==""){
				alert("지역을 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=location]").val().trim()==""){
				alert("장소를 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=interest]").val().trim()==""){
				alert("관심사항을 입력하세요");				
				return false;
			}
			if($("#form_meetingWrite :input[name=content]").val().trim()==""){
				alert("정보를 입력하세요");				
				return false;
			}
		}); // submit
		
	}); // ready
</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                var sigungu = '';

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                    sigungu = data.sigungu;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                    sigungu = data.sigungu;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('location').value = fullAddr;
                document.getElementById('region').value=sigungu;
                
            	geocoder.addr2coord(fullAddr, function(status, result) {

        		    // 정상적으로 검색이 완료됐으면 
        		     if (status === daum.maps.services.Status.OK) {

        		        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        		        // 결과값으로 받은 위치를 마커로 표시합니다
        		        var marker = new daum.maps.Marker({
        		            map: map,
        		            position: coords
        		        });

        		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        		        map.setCenter(coords);
        		    } 
        		}); 
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('location').focus();
            }
        
        }).open();
    }

</script>



<!-- PAGE CONTENT
    ============================== -->
<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<h3 class="header">Meeting Write form</h3>
			<p class="text-muted">혼자가 심심해??
			그럼 나만의 이야기 주제로 
			대화할 사람들을 모아봐~</p>

			<!-- Alert message -->
			<div class="alert" id="form_message" role="alert"></div>
			<!-- Setting the custom theme for reCaptcha.
               Default themes and customization: 
               https://developers.google.com/recaptcha/docs/customization -->
               
			<script type="text/javascript">
				var RecaptchaOptions = {
					theme : 'custom',
					custom_theme_widget : 'recaptcha_widget'
				};
			</script>
			<!-- Please carefully read the README.txt file in order to setup
               the PHP contact form properly -->
			<form method="post" role="form" action="${pageContext.request.contextPath}/meetingWrite.do" id="form_meetingWrite" enctype="multipart/form-data">
				<!-- <div class="form-group">
					<label for="email">Your email address</label> 
					<input type="email" 	name="email" class="form-control" id="email" placeholder="E-mail" 	data-original-title="" title=""> 
					<span class="help-block"></span>
				</div> -->
				<div class="form-group">
					<label for="title">Title</label> 
					<input type="text" name="title" class="form-control" placeholder="meetin title"  data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<label for="region">Region</label> 
					<input type="text" id="region" name="region" class="form-control" placeholder="meeting region" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				
				<div id="map" style="width:500px;height:400px;"></div>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
					// 지도를 생성합니다    
					var map = new daum.maps.Map(mapContainer, mapOption); 
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();
				
					// 주소로 좌표를 검색합니다
					geocoder.addr2coord('경기 성남시 분당구 대왕판교로 670 (삼평동, 유스페이스2)', function(status, result) {
		
						// 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {
					        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new daum.maps.Marker({
					            map: map,
					            position: coords
					        });
				
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } 
					});  
				</script>
				<div class="form-group">
					<label for="location">Location</label> 
					<input type="text" name="location" class="form-control" id="location" placeholder="meeting location" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="interest">Interest</label> 
					<input type="text" name="interest" class="form-control" placeholder="Interest" data-original-title="" title=""> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>
					<textarea name="content" class="form-control" rows="3" placeholder="Content"></textarea>
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="uploadFile">UploadFile</label> 
					<input type="file" name="file" class="form-control" multiple="multiple">
					<span class="help-block"></span>
				</div>

				<button type="submit" class="btn btn-primary" id="meetingWrite">모임글 작성</button>
				<button type="button" class="btn btn-primary" id="meetingWriteCancel">작성 취소</button>
			</form>
		</div>
	</div>
	<!-- / .row -->
</div>
<!-- / .container -->

