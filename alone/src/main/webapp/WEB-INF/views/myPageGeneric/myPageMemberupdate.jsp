<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>

	<!--  jquery 사용처입니다. -->
	<script type="text/javascript">
	$(document).ready(function(){
		
		var passwordCheck; // 패스워드 체크 변수
		var nicknameCheck; // nickName 체크 변수
		
		
		$("#updateMamberForm").submit(function(){		
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
				$("#passwordCheckView").html("비밀번호를 사용가능!").css("color", "red");
				passwordCheck=false;
			}
		});
		
		$("#passwordCheck").keyup(function(){
			
			if($("#password").val() !=$(this).val()){
				$("#passwordCheckView").html("비밀번호를 사용불가!").css("color", "red");
				passwordCheck=false;
			}else{
				$("#passwordCheckView").html("비밀번호 사용가능!").css("color", "red");		
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
						$("#nickNameCheckView").html(nickname+" 사용가능!").css("color", "red");		
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
            <a href="${pageContext.request.contextPath}/myPageGeneric/showInfo.do" class="btn btn-default btn-block">내정보 보기 </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageGeneric/showMileage.do" class="btn btn-default btn-block"> 마일리지</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/myPageGeneric/leave.do" class="btn btn-default btn-block"> 회원탈퇴</a>
          </li>
        </ul>
      </div>
        
        <div class="col-sm-8 col-md-9 col-lg-10">
         	<form action="${pageContext.request.contextPath}/updateInfo.do" method="post"
         	 id="updateMamberForm">
          <!-- Tab content -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="personal-info">
              <h3 class="header header_plain">개인 정보 수정</h3>
              <div class="table-responsive">
                <table class="table">
           <tbody>
                    <tr>
                      <th scope="row">아이디</th>
                      <td>${mvo.id}<input type="hidden" id="id" name="id" value="${mvo.id}"></td>
                      
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
                      <th scope="row">이름</th>
                      <td><input type="text" class="form-control" id="sign-up__name" name="name" placeholder="이름"></td>
                    </tr>
                    <tr>
                      <th scope="row">닉네임</th>
                      <td> <input type="text" class="form-control" id="nickName"  name="nickName" placeholder="닉네임">
                      <span id="nickNameCheckView"></span>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">성별</th>
                      <td>             
                      	<input type="radio" id="sign-up__gender" name="gender" value="여성">여성
               			<input type="radio"  id="sign-up__gender" name="gender" value="남성">남성
               		</td>
                    </tr>
                    <tr>
                      <th scope="row">생년월일</th>
                      <td>${mvo.id}</td>
                    </tr>
                    <tr>
                      <th scope="row">전화번호</th>
                      <td>  <input type="text" class="form-control" id="sign-up__tel"  name="tel"  placeholder="연락처"></td>
                    </tr>
   
                  </tbody>
                </table>
              </div> <!-- / .table-responsive -->
            </div>
           
          
            <input type="submit" class="btn btn-primary btn-block btn-lg" value="수정하기"><br>
            <a href="${pageContext.request.contextPath}/myPageGeneric/showInfo.do" class="btn btn-primary" >취소</a>
       
          </div> <!-- / .tab-content -->
           </form>
        </div>        
        
     
      </div> <!-- / .row -->
  
     </div><!-- / .container -->
    
    
