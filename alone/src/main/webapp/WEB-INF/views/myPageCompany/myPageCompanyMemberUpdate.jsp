<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

	<!--  jquery 사용처입니다. -->
	<script type="text/javascript">
	$(document).ready(function(){
		
		var passwordCheck; // 패스워드 체크 변수
		var nicknameCheck; // nickName 체크 변수
		
		
		$("#updateCMemberForm").submit(function(){		
			if($("#password").val() != "" && $("#passwordCheck").val()== "" ){
				alert("비밀번호를 다시 한번 입력하세요");				
				return false;
			}
			if(passwordCheck==false){
				alert("비밀번호를 재확인하세요");				
				return false;
			}else if(nicknameCheck==false){
				alert("닉네임 중복 확인하세요");	
				return false;
			}		
		}); // submit function
	$("#password").keyup(function(){
			if($("#password").val() !=$("#passwordCheck").val()){
				$("#passwordCheckView").html("비밀번호를 불일치!").css("color", "red");
				passwordCheck=false; 
			}else{
				$("#passwordCheckView").html("비밀번호를 사용가능!").css("color", "lime");
				passwordCheck=false; 
			}
		});
		
		$("#passwordCheck").keyup(function(){
			
			if($("#password").val() !=$(this).val()){
				$("#passwordCheckView").html("비밀번호를 다시확인하세요!").css("color", "red");
				passwordCheck=false;
			}else{
				$("#passwordCheckView").html("비밀번호 일치!").css("color", "lime");		
				passwordCheck=true;
			}
		}); // 패스워드 체크 keyup
		
		$("#nickName").keyup(function(){
			var nickname=$("#nickName").val().trim();
			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/nickNamecheckAjax.do",				
				data:"nickname="+nickname,	
				success:function(data){						
					if(data=="fail"){
					$("#nickNameCheckView").html(nickname+" 사용불가!").css("color", "red");
					nicknameCheck=false;
					}else{						
						$("#nickNameCheckView").html(nickname+" 사용가능!").css("color", "lime");	  	
						nicknameCheck=true;
					}					
				}//callback			
			});//ajax
		});//key
	});

</script>

    <div class="container">
      <div class="row">
      <div class="col-sm-4 col-md-3 col-lg-2">
  
       <ul class="list-unstyled profile-social center-block">
          <li>
            <a href="${pageContext.request.contextPath}/showCmemberInfo.do" class="btn btn-default btn-block">내정보 보기 </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/showMileage.do" class="btn btn-default btn-block"> 마일리지</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/leave.do" class="btn btn-default btn-block"> 회원탈퇴</a>
          </li>
        </ul>
      </div>
        
        <div class="col-sm-8 col-md-9 col-lg-10">
         	<form action="${pageContext.request.contextPath}/CmemberUpdateInfo.do" method="post"
         	 id="updateCMemberForm">
          <!-- Tab content -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="personal-info">
              <h3 class="header header_plain">기업회원 정보 수정</h3> 
              <div class="table-responsive">
                <table class="table">
           <tbody>
                    <tr>
                      <th scope="row">아이디</th> 
                      <td><input type="text" id="id" name="id" value="${requestScope.id}" readonly></td>
                   </tr> 
                    <tr>
                      <th scope="row">비밀번호</th>
                      <td><input type="password" id="password" name="password"></td>
                    </tr>
                    <tr>
                      <th scope="row">비밀번호 확인</th>
                      <td><input type="password" id="passwordCheck" name="passwordCheck">
                       <span id="passwordCheckView"></span>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">대표명</th>
                      <td><input type="text" class="form-control" id="sign-up__name" name="name" placeholder="대표명"></td>
                    </tr>
                    <tr>
                      <th scope="row">사업자등록번호</th> 
                      <td> <input type="text" class="form-control" name="corporateRegistrationNumber" placeholder="사업자등록번호">
                     </td>
                    </tr>
                    <tr>
                      <th scope="row">주소</th>
                      <td>             
                     	<input type="text" class="form-control" name="address" placeholder="주소">
               		</td>
                    </tr>
                    <tr>
                      <th scope="row">기업명</th>
                      <td><input type="text" class="form-control" id="nickName"  name="nickName" placeholder="기업명">
                       <span id="nickNameCheckView"></span>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">대표번호</th>
                      <td>  <input type="text" class="form-control" id="sign-up__tel"  name="tel"  placeholder="대표번호"></td>
                    </tr>
   
                  </tbody>
                </table>
              </div> <!-- / .table-responsive -->
            </div>
           
          
            <input type="submit" class="btn btn-primary btn-block btn-lg" value="수정하기"><br>
            <a href="${pageContext.request.contextPath}/showCmemberInfo.do" class="btn btn-primary" >취소</a>
       
          </div> <!-- / .tab-content -->
           </form>
        </div>        
        
     
      </div> <!-- / .row -->
  
     </div><!-- / .container -->