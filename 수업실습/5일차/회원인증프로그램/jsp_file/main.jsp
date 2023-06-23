<%@page import="com.daotoex.MemberDTO"%>
<%@page import="com.daotoex.MemberDAO"%>
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
		String id = (String)session.getAttribute("id"); 
		out.println(id);
		String pw = (String)session.getAttribute("pw");
		MemberDAO memberDAO = new MemberDAO();
		out.println(memberDAO.memberSelect(id).getName() + "님 환영합니다.");		
	%>
	<br/>
	<a href="/JspClass/com/day0623/MemberEx/LoginEx/logout.jsp">로그아웃</a>
	<br/>
	<a href="/JspClass/com/day0623/MemberEx/ModifyEx/modify.jsp">회원정보수정</a>
</body>
</html>