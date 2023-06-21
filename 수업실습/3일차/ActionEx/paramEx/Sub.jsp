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
		String id, passwd;
	%>
	
	<%
		id = request.getParameter("id");
		passwd = request.getParameter("passwd");
	
	%>

	<h1>Sub.jsp param 실습 페이지입니다. </h1>
	아이디 : <%= id %>입니다. <br/>
	비밀번호 : <%= passwd %>입니다.
</body>
</html>