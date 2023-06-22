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
	Enumeration enums = session.getAttributeNames();
	
	while(enums.hasMoreElements()){
	    String s_id = enums.nextElement().toString();
	    int time = session.getMaxInactiveInterval();
	    
	    out.println(s_id + "님 로그아웃하겠습니다.<br/>");
	    out.println("session 유효시간: " + time + "<br/>");
	    out.println("<hr/>");
	    session.invalidate();
	  }
	%>
	<a href="login.jsp">다시 로그인</a>
</body>
</html>