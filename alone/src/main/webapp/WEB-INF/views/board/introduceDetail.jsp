<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="icon" href="img/favicon.ico">-->

    <title>Beatrix :: Timeline</title> 

    <!-- CSS Global -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- CSS Plugins -->
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
 <!-- Panels -->
          <div class="ui__section" id="ui_panels">
            <h3 class="header">Details</h3>
            <div class="row">
              <div class="col-sm-6">
                <div class="panel panel-primary">
                  <div class="panel-heading">사진</div>
                  <div class="panel-body">
                   이미지 넣어주세여
                  </div>
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
            </div> <!-- / row -->
          </div> <!-- / ui__section -->
</body>
</html>