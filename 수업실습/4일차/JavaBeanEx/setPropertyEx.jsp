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
	<jsp:setProperty name="student" property="name" value="ckm"/>
	<jsp:setProperty name="student" property="age" value="25"/>
	<jsp:setProperty name="student" property="grade" value="1"/>
	<jsp:setProperty name="student" property="studentNum" value="19"/>
	
	<a href="getPropertyEx.jsp">자바 빈 출력 및 가져오기</a>
</body>
</html>