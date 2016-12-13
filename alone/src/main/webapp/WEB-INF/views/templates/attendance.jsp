

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 
 	Calendar cal=Calendar.getInstance(); //현재 시스템이 가지고 있는 날짜 데이터 가지고 오기
 	
 	int y=cal.get(Calendar.YEAR);
 	int m=cal.get(Calendar.MONTH)+1;
 	int d=cal.get(Calendar.DATE);
 	
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
 	
 	int w=cal.get(Calendar.DAY_OF_WEEK); //1(일)~7(토) => 일요일일때 w에 1. 메소드를 외우면 된다.
 
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


<script type="text/javascript">

function changeDate(){
	var y=document.getElementById("y").value;
	var m=document.getElementById("m").value;
	//var url="calendar-2.jsp?y="+y+"&m="+m;
	var url="${pageContext.request.contextPath}/templates/attendance.do?y="+y+"&m="+m;
	location.href=url; //url이 가지고 있는 값으로 이동
}



</script>
</head>
<body>



<center> 
	<div class="form-group">
	   <div class ="row">
                 <div class="col-sm-2 col-sm-offset-4">
                    <div class="form-group">
                      <input type="submit" class="btn btn-ki btn-block btn-lg" id="##" value="내 출석일수 확인 >">
                    </div>
                  </div>
                  <div class="col-sm-2">
                    <div class="form-group">
                      <input type="submit" class="btn btn-ki btn-block btn-lg" id="##" value="출석체크 하기 >">
                    </div>
                  </div>
                  </div>  
                  	<h3>
					<caption> <!--  style=height: "25px" -->
						<a href="${pageContext.request.contextPath}/templates/attendance.do?y=<%=y%>&m=<%=m-1%>">◀</a>
						<%=y%>.<%=m%>
						<a href="${pageContext.request.contextPath}/templates/attendance.do?y=<%=y%>&m=<%=m+1%>">▶</a>
					</caption>
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
	//1일 앞부분 공백처리
	out.println("<tr height='25'>");
	for(int i=1; i<w; i++){ // 6월의 1일은 토요일이라 w=7 따라서 공백 6번을 써준다.
		out.println("<td bgcolor='#ffffff'>&nbsp;</td>" );
	}
	//1~마지막일 계산
	String fc;
	for(int i=1; i<=cal.getActualMaximum(Calendar.DATE); i++){
		fc=w%7==1?"red":(w%7==0?"blue":"black");
		out.println("<td align='center' bgcolor='#ffffff' style='color:"+fc+";'>");
		out.print(i+"</td>");
		
		w++;
		if(w%7==1&&i!=cal.getActualMaximum(Calendar.DATE)){
			out.println("</tr>");
			out.println("<tr height='100'>"); // 공백 부분
			for(int j=1; j<=7;j++)
			{%>
			
		<td align='center' bgcolor='#ffffff';>&nbsp;
	       <img src="${pageContext.request.contextPath}/resources/img/출석도장.png">
		</td>
		<% 
			}
			out.println("</tr>");					//  공백 부분
			out.println("<tr height='25'>");
		}
	}
	
	// 뒷부분 공백처리
	if(w%7!=1){
		if(w%7==0){
			out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
		}else{
		for(int i=w%7; i<=7; i++)
			out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
	}
	out.println("</tr>");
		out.println("<tr height='100'>");// 맨아랫 부분 공백 
		for(int j=1; j<=7;j++){
	
		%>
		<td align='center' bgcolor='#ffffff';>&nbsp;
	      <%--  <img src="${pageContext.request.contextPath}/resources/img/출석도장.png"> --%>
	      test
		</td>
		<%
		}
		
		out.println("</tr>");
	}
%>
</table>
</div><!-- 달력 날짜 -->

</center>

</body>
</html>