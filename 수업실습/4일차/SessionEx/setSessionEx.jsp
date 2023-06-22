<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	session.setAttribute("name", "ckm");	
	%>
	<h2>세션을 생성합니다</h2>
	<a href="getSessionEx.jsp">세션 정보 확인하기</a>
	
</body>
</html>