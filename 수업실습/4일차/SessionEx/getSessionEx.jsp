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
	<h2>세션 정보 확인하기</h2>
	<%
		Enumeration enums = session.getAttributeNames();
	
		while(enums.hasMoreElements()){
		    String name = enums.nextElement().toString();
		    String value = session.getAttribute(name).toString();
		    String id = session.getId();
		    int time = session.getMaxInactiveInterval();
		    
		    out.println("session 이름: " + name + "<br/>");
		    out.println("session 값: " + value + "<br/>");
		    out.println("session ID: " + id + "<br/>");
		    out.println("session 유효시간: " + time + "<br/>");
		    out.println("<hr/>");
		  }
	%>
	<a href="removeSessionEx.jsp">세션 삭제하기</a>
</body>
</html>