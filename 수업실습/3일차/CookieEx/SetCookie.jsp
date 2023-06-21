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
		Cookie cookie = new Cookie("cookieName","cookieValue");
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
		Cookie cookie2 = new Cookie("cookieName2","cookieValue2");
		cookie2.setMaxAge(60*60);
		response.addCookie(cookie2);
	%>
	<a href="GetCookie.jsp">cookie get</a>
</body>
</html>