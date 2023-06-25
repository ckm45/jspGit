<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
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
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = new MemberDTO(name , id, pw, phone, email);
	if(memberDAO.joinCheck(name, id, pw, phone, email)){		
		memberDAO.memberInsert(memberDTO);
	}
	else{
	    response.sendRedirect("/JspClass/com/day0625/member/join.jsp");
	}
	
	
	%>


	<h2>회원가입 승인 완료</h2>
	<a href="/JspClass/com/day0625/member/login.jsp">로그인 하러가기</a>
</body>
</html>