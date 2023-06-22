<%@page import="java.util.Enumeration"%>
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
		session.setAttribute(id,password);
		
		Enumeration enums = session.getAttributeNames();
		
		while(enums.hasMoreElements()){
		    //String s_id = session.getAttributeNames().toString();
		    String s_id = enums.nextElement().toString();
		    String s_password = session.getAttribute(s_id).toString();
		    int time = session.getMaxInactiveInterval();
		    
		    out.println(s_id + "님 로그인을 환영합니다.<br/>");
		    out.println("session 유효시간: " + time + "<br/>");
		    out.println("<hr/>");
		  }
		
	%>
	<br />
	<a href=logout.jsp>로그아웃</a>

</body>
</html>