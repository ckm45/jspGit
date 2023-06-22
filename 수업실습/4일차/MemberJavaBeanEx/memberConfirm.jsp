<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id = "MemberBean" class="bean.ex.MemberBean" scope = "application" />
	
	회원 아이디 : <jsp:getProperty name="MemberBean" property="id"/>
	<br/>
	회원 비밀번호 : <jsp:getProperty name="MemberBean" property="password"/>
	<br/>
	회원 이름 :<jsp:getProperty name="MemberBean" property="name"/>
	<br/>
	회원 이메일 :<jsp:getProperty name="MemberBean" property="email"/>
	<br/>
	
	<a href="member.jsp">처음으로</a>
</body>
</html>