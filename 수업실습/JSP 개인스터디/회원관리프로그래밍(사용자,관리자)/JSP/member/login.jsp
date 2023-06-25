<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginOk.jsp" method="post">
		로그인<br /> 아이디 : <input type="text" name="id"> <br /> 
		비밀번호 : <input type="password" name="pw"> <br /> 
		<input type="submit" value="로그인">
	</form>
</body>
</html>