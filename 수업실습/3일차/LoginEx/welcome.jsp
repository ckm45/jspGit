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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		Cookie cookie = new Cookie(id,password);
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
		
		Cookie[] cookies = request.getCookies();
		
		
	%>
	<% 
	 for(int i = 0; i < cookies.length; i++){
	     if(cookies[i].getName().equals("ckm")){
	         out.println(cookies[i].getName() + "님 로그인을 환영합니다.");
	     }
	 }
	%>
	<br />
	<a href=logout.jsp>로그아웃</a>

</body>
</html>