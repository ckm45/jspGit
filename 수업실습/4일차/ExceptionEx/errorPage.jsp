<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage = "true" %>
	<%
		response.setStatus(200);	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>에러발생</h2>
	<br/>
	예외 유형 : <%= exception.getClass().getName() %><p>
	예외 메시지 : <%= exception.getMessage() %><p>
	예외 유형 및 메시지 : <%= exception.toString() %>

</body>
</html>