
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%
 	request.setCharacterEncoding("utf-8");

 	Calendar cal=Calendar.getInstance(); //현재 시스템이 가지고 있는 날짜 데이터 가지고 오기
 	
 	int y=cal.get(Calendar.YEAR);
 	int m=cal.get(Calendar.MONTH)+1;
 	int d=cal.get(Calendar.DATE);
 	//System.out.println("Calendar:" + y+" "+m);
 	String _y=request.getParameter("y");
 	String _m=request.getParameter("m");
 	
 	if(_y!=null)
 		y=Integer.parseInt(_y);
 	if(_m!=null)
 		m=Integer.parseInt(_m);
 	
 	//y년 m월 1일의 요일
 	cal.set(y,m-1,1);
 	y=cal.get(Calendar.YEAR);
 	m=cal.get(Calendar.MONTH)+1;
 	//System.out.println("Calendar:" + y+" "+m);
 	int w=cal.get(Calendar.DAY_OF_WEEK); //1(일)~7(토) => 일요일일때 w에 1. 메소드를 외우면 된다.
	int sat=1;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin:0px; padding:0px;font-famaily: 돋움; font-size: 9pt;}
	td{font-size: 9pt;}
	a{text-decoration: none;}
	a:HOVER{text=decoration: underline;color:tomato;}
</style>

<script src="//code.jquery.com/jquery.min.js"></script>   
<script type="text/javascript">

function changeDate(){
	
	var y=document.getElementById("y").value;
	var m=document.getElementById("m").value;

	//var url="calendar-2.jsp?y="+y+"&m="+m;
	var url="${pageContext.request.contextPath}/showAttendanceMain.do?y="+y+"&m="+m;
	location.href=url; //url이 가지고 있는 값으로 이동
}



</script>
<script type="text/javascript">
	$(document).ready(function(){

	<c:set var="authority" value="${sessionScope.memberVO.authority}"/>
			var author='<c:out value="${authority}"/>'

   <c:set var="y" value="${param.y}"/>
			var y='<c:out value="${y}"/>'	
   <c:set var="m" value="${param.m}"/>
	        var m='<c:out value="${m}"/>'	

     $("#showAttendDay").click(function(){
    	 
    	   //회원가입 안되있을시
    	    if(author == "")
    	    {
    		if (confirm("로그인하셔야 이용가능합니다.")) {
    			location.href = "${pageContext.request.contextPath}/login.do";
    		} 
    	 
    	    }
    	    //기업회원일 경우 	
    	    else if(author == 'ROLE_COMPANY')
    	    {
    	    	 alert("기업회원은 이용 불가능 합니다.");
    	    	
    	    }
    	 
     });

    
     $("#stempCheck").click(function(){
    	 

   //회원가입 안되있을시
    if(author == "")
    {
    	
    	 	 if (confirm("로그인하셔야 이용가능합니다.")) {
     			location.href = "${pageContext.request.contextPath}/login.do";
     		}

    	 
    }
   //기업회원일 경우 	
    else if(author == 'ROLE_COMPANY')
    {
    	 alert("기업회원은 이용 불가능 합니다.");
    	
    }
   //일반 회원일 경우 서버로 이동
    else
    {
    	location.href = "${pageContext.request.contextPath}/attendanceCheck.do?y="+y+"&m="+m;
    	
    }
    	 
     });//click
     

	
});  //ready
 </script>
</head>
<body>

<c:set var="resultMap" value="${requestScope.resultMap}"/>
<c:set var="authority" value="${sessionScope.memberVO.authority}"/>
<center> 
	<div class="form-group">
	   <div class ="row">
	   		
                 <div class="col-sm-2 col-sm-offset-4">
                    <div class="form-group">
              
                      <!--  일반회원일 경우만 -->
						<c:choose>
						<c:when test="${authority eq 'ROLE_MEMBER'}">
						<input type="button" class="btn btn-ki btn-block btn-lg" value="나의 출석일수 ${resultMap.totalDay}">
						</c:when>
						<c:otherwise>
						 <input type="button" class="btn btn-ki btn-block btn-lg"  id="showAttendDay"value="나의 출석일수 보기"/>
						</c:otherwise>
						</c:choose>
                    </div>
                  </div>
                  
                  <div class="col-sm-2">
                    <div class="form-group">
                     <input type="button" class="btn btn-ki btn-block btn-lg" id="stempCheck" value="출석하기" />	
                    </div>
                  </div>
               
        </div>  
                  	<h3>
					<caption> <!--  style=height: "25px" -->
					<%

					if(m==1){%>
						<a href="${pageContext.request.contextPath}/showAttendanceMain.do?y=<%=y-1%>&m=<%=12%>">◀</a>
						
				  <%}else{%>
				  
						<a href="${pageContext.request.contextPath}/showAttendanceMain.do?y=<%=y%>&m=<%=m-1%>">◀</a>
					
			      
			       <%}%>
			       <%=y%>.<%=m%>
			       <%if(m==12){ %>
			       		<a href="${pageContext.request.contextPath}/showAttendanceMain.do?y=<%=y+1%>&m=<%=1%>">▶</a>
					
					
					<%}else{%>
						<a href="${pageContext.request.contextPath}/showAttendanceMain.do?y=<%=y%>&m=<%=m+1%>">▶</a>
					
					<%} %></caption>
				</h3>
                   
   
<table width="700" cellpadding="0" cellspacing="1" bgcolor="#ff22cc">
<tr height="25"  class="calendarday">
	<td width="200" align="center"><font color="red">Sun</font></td>
	<td width="200" align="center">Mon</td>
	<td width="200" align="center">Tue</td>
	<td width="200" align="center">Wed</td>
	<td width="200" align="center">Thu</td>
	<td width="200" align="center">Fri</td>
	<td width="200" align="center"><font color="blue">Sat</font></td>
</tr>

<%

 HashMap<String,Object> resultMap =null;
ArrayList<Object> mydayList=null;
resultMap=  (HashMap<String, Object>)request.getAttribute("resultMap");

//System.out.println("resultMap: "+resultMap);

if(resultMap!=null){
 mydayList= ( ArrayList<Object>  )resultMap.get("myDay");
}

	//1일 앞부분 공백처리
	out.println("<tr height='25'>");
	for(int i=1; i<w; i++){ // 6월의 1일은 토요일이라 w=7 따라서 공백 6번을 써준다.
		out.println("<td bgcolor='#ffffff'>&nbsp;</td>" );
		//System.out.println("공백 i :"+i);
	}

	//1~마지막일 계산
	String fc;
	//System.out.println("y/m"+y+m);
	for(int i=1; i<=cal.getActualMaximum(Calendar.DATE); i++){
	    int last=cal.getActualMaximum(Calendar.DATE);
		fc=w%7==1?"red":(w%7==0?"blue":"black");
	
		out.println("<td align='center' bgcolor='#ffffff' style='color:"+fc+";'>");
		out.print(i+"</td>");
		//System.out.println("i  :"+i);
		if(fc.equals("blue"))
		{
			sat=i;
		//System.out.println(sat);
		}
		w++;

		if(w%7==1&&i<=cal.getActualMaximum(Calendar.DATE)){
			out.println("</tr>");
			out.println("<tr height='100'>"); // 공백 부분
			int day;
			for(int j=1; j<=7;j++)
			{
				
		
				if((i-7+j)>0){
					
			//System.out.println("j  :"+(i-7+j)); //5-4 (j-first)
			day=(i-7+j);
			%>
			<td align='center' bgcolor='#ffffff';>&nbsp;
			<%
			if(mydayList!=null){
			for(int s=0; s<mydayList.size();s++){
		
				if((int)mydayList.get(s) == day){
					//내가출석한 데이와 달력의 데이가 같을때만 이미지출력 아니면 공백%>
				    <img src="${pageContext.request.contextPath}/resources/img/출석도장.png">
				<% }%>
			
			<%}
			
	
/* 		<td align='center' bgcolor='#ffffff';>&nbsp;
	       <img src="${pageContext.request.contextPath}/resources/img/출석도장.png">
		</td> */
            }%>
			</td><%}
				else{%>
					<td align='center' bgcolor='#ffffff';>&nbsp;
	
					</td>
					
				<% }
			
			}

			out.println("</tr>");
			out.println("<tr height='100'>"); // 공백 부분
		}
	}
	
	// 뒷부분 공백처리
	if(w%7!=1){

		//System.out.println(w);
		//System.out.println("뒷부분 공백 안먹음");
		int day2;
		if(w%7==0){
		
		
			out.println("<tr height='100'>");// 맨아랫 부분 공백 
		
			 for(int i=1; i<7;i++){	
				// System.out.println("뒷부분 나누어떨어진거  :"+ (sat+i) );
					day2=sat+i;
					%>
					<td align='center' bgcolor='#ffffff';>&nbsp;
							<%
					if(mydayList!=null){
			for(int s=0; s<mydayList.size();s++){
		
			
				if((int)mydayList.get(s) == day2){
					//내가출석한 데이와 달력의 데이가 같을때만 이미지출력 아니면 공백%>
				    <img src="${pageContext.request.contextPath}/resources/img/출석도장.png">
				<% }
			
			}
		
/* 			<td align='center' bgcolor='#ffffff';>&nbsp;

	       <img src="${pageContext.request.contextPath}/resources/img/출석도장.png">
		</td> 
 */
		
	     }%></td>
	     
	     
		<%}
			 out.println("</tr>");
	  }else{
		for(int i=w%7; i<=7; i++)
			out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
	}
	out.println("</tr>");
		out.println("<tr height='100'>");// 맨아랫 부분 공백 
		int day3;
		for(int j=1; j<(w%7);j++){
			//System.out.println("뒷부분 j   :"+(cal.getActualMaximum(Calendar.DATE)-7+j)); //5-4 (j-first)
			//System.out.println("뒷부분 j   :"+(sat+j));
			day3=sat+j;
			//(w%7
			//System.out.println(i+j);
		      %>
				<td align='center' bgcolor='#ffffff';>&nbsp;
				<%
				if(mydayList!=null){
			for(int s=0; s<mydayList.size();s++){
			
				if((int)mydayList.get(s) == day3){
					//내가출석한 데이와 달력의 데이가 같을때만 이미지출력 아니면 공백%>
				    <img src="${pageContext.request.contextPath}/resources/img/출석도장.png">
				<% }%>
				</td>
			<%}
			
/*		<td align='center' bgcolor='#ffffff';>&nbsp;

	       <img src="${pageContext.request.contextPath}/resources/img/출석도장.png">
		</td> */
		
	
		}%>
				</td>
	<% 	out.println("</tr>");
	}
	}
%>
</table>
</div><!-- 달력 날짜 -->

</center>

</body>
</html>