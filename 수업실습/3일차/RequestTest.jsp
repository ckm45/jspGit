<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String name, id, password, major, protocol;
		String[] hobby;	
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		name = request.getParameter("name");
		id = request.getParameter("id");
		password = request.getParameter("passwd");
		major = request.getParameter("major");
		protocol = request.getParameter("protocol");	
		
		hobby = request.getParameterValues("hobby");
	%>
	
		이름 : <%= name %> <br/>
		아이디 : <%= id %> <br/>
		비밀번호 : <%= password %> <br/>
		취미 : <%= Arrays.toString(hobby) %> <br/>
		전공 : <%= major %> <br/>
		프로토콜 : <%= protocol %> <br/>

</body>
</html>