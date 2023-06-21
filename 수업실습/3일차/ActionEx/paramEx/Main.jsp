<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Main.jsp 페이지입니다.</h1>
	<jsp:forward page="Sub.jsp">
		<jsp:param value="test" name="id"/>
		<jsp:param value="1234" name="passwd"/>
	</jsp:forward>
	
</body>
</html>