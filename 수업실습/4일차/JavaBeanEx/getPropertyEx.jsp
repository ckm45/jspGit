<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id = "student" class="bean.ex.Student" scope = "application" />
	
	<jsp:getProperty name="student" property="name" />
	<jsp:getProperty name="student" property="age" />
	<jsp:getProperty name="student" property="grade" />
	<jsp:getProperty name="student" property="studentNum" />
	
	
</body>
</html>