<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <title>일반회원 가입</title>
    <script src="//code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript">

	$(document).ready(function(){
		var checkResultId="";
		$("#cancel").click(function(){
			location.href="${pageContext.request.contextPath}/home.do";
			return false;
		}); 
		
		$("#registerMamberForm").submit(function(){			
			if($(":input[name=id]").val().trim()==""){
				alert("아이디를 입력하세요");				
				return false;
			}
			if($(":input[name=password]").val().trim()==""){
				alert("패스워드를 입력하세요");				
				return false;
			}
			if($(":input[name=repeatPassword]").val().trim()==""){
				alert("패스워드를 재입력하세요");				
				return false;
			}
			if($(":input[name=name]").val().trim()==""){
				alert("이름을 입력하세요");				
				return false;
			}
			if($(":input[name=nickName]").val().trim()==""){
				alert("닉네임을 입력하세요");				
				return false;
			}
			if($(":input[name=birth]").val().trim()==""){
				alert("생년월일을 입력하세요");				
				return false;
			}
			if($(":input[name=tel]").val().trim()==""){
				alert("전화번호를 입력하세요");				
				return false;
			}
		});//submit
		
		$(":input[name=id]").keyup(function(){
			var id=$(this).val().trim();
			if(id.length<2 || id.length>10){
				$("#idCheckView").html("아이디는 2자이상 입력하세요").css("color", "red");
				checkResultId="";
				return;
			}
			$.ajax({
				type:"POST",
				url:"idcheckAjax.do",				
				data:"id="+id,	
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(" "+id+" 사용하고 있는 아이디 입니다!").css("color", "red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css("color", "red");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//key

	});//ready	


    </script>
    <!-- CSS Global -->
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet">

    <!-- CSS Plugins -->
    <link href="${pageContext.request.contextPath}/resources/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/animate.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body class="body_plain">

    <!-- PRELOADER (uncomment to enable)
    ============================== -->
    <!-- <div class="preloader">
      <img src="img/preloader.gif" alt="Loading..." class="preloader__img">
    </div> -->


    <!-- PAGE CONTENT
    ============================== -->
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <div class="body-plain__title">
            <h1 class="text-center">Sign Up</h1>
          </div>
        </div> 
   </div>
      <div class="row" >
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-4 col-sm-offset-3 col-md-offset-3 col-lg-offset-4">
          <div class="body-plain__form">

            <!-- Sign Up form -->
          <form role="form" action="${pageContext.request.contextPath}/registerMember.do" method="post" id="registerMamberForm">
               <div class="form-group">
                 <input type="text" class="form-control" id="sign-up__id" name="id" placeholder="아이디">
                 <span id="idCheckView"></span>
              </div>
              <div class="form-group">
               <label for="sign-up__password" class="sr-only">Password</label>
               <input type="password" class="form-control" id="sign-up__password" name="password" placeholder="패스워드">
              </div>
              <div class="form-group">
               <label for="sign-up__password_repeat" class="sr-only">Repeat Password</label>
               <input type="password" class="form-control" id="sign-up__password_repeat" name="repeatPassword" placeholder="패스워드확인">
              </div>
              <div class="form-group">
               <label for="sign-up__name" class="sr-only">name</label>
               <input type="text" class="form-control" id="sign-up__name" name="name" placeholder="이름">
              </div>
              <div class="form-group">
                 <label for="sign-up__name" class="sr-only">nickname</label>
                 <input type="text" class="form-control" id="sign-up__name"  name="nickName" placeholder="닉네임">
              </div>
              <div class="form-group">
                <label for="sign-up__username" class="sr-only">gender</label>
                <input type="radio" id="sign-up__gender" name="gender" value="여성">여성
                <input type="radio"  id="sign-up__gender" name="gender" value="남성">남성
              </div>
              <div class="form-group">
                <label for="sign-up__year" class="sr-only">birth</label>
                <input type="text" class="form-control" id="sign-up__year" name="birth" placeholder="ex) 950101">
              </div>
              <div class="form-group">
                <label for="sign-up__tel" class="sr-only">tel</label>
              	 <input type="text" class="form-control" id="sign-up__tel"  name="tel"  placeholder="연락처">
              </div>
              
              
              
              <input type="submit" class="btn btn-primary btn-block btn-lg" value="가입하기"><br>
             <button type="submit" class="btn btn-primary btn-block btn-lg"  id="cancel" >취소</button>
          </form>    
          </div> <!-- / .body-plain__form -->


          <!-- Footer -->
          <div class="body-plain__footer">
            Copyright 2015 <a href="http://simpleqode.com/">Simpleqode.com</a>. All Rights Reserved.
          </div>
        </div>
      </div> <!-- / .row -->
    </div> <!-- / .container -->


    <!-- Javascript
    ============================== -->

    <!-- JS Global -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>

    <!-- JS Plugins -->
    <script src="${pageContext.request.contextPath}/resources/js/scrolltopcontrol.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>

    <!-- JS Custom -->
    <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>


  </body>
</html>