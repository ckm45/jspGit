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
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0; i < cookies.length; i++){
		    out.println(cookies[i].getName() + "|" + cookies[i].getValue()+"<br/>");
		}
	%>
	<a href ="DeleteCookie.jsp">cookie delete</a>
</body>
</html>