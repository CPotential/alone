<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert("이미 출석하셨습니다.");
location.href="${pageContext.request.contextPath}/showAttendanceMain.do?y="+${param.y}+"&m="+${param.m};

</script>