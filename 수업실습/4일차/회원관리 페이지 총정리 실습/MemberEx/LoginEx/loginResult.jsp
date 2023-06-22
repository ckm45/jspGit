<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 성공</h2>
 <%= session.getAttribute("name") %>님 환영합니다.
 <br/>
 
<a href="/JspClass/com/day0622/MemberEx/ModifyEx/modify.jsp">회원 정보수정</a><br/>
<a href="/JspClass/com/day0622/MemberEx/LoginEx/logout.jsp">로그아웃</a><br/>
</body>
</html>