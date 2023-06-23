<%@page import="com.daotoex.MemberDTO"%>
<%@page import="com.daotoex.MemberDAO"%>
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
	<%
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = new MemberDTO(name , id, pw, phone1, phone2, phone3, gender);
	
	memberDAO.memberInsert(memberDTO);
	out.println(memberDTO.getName() + "님 회원가입을 환영합니다.");
	%>
	
	
	
    <a href="/JspClass/com/day0623/MemberEx/LoginEx/login.jsp">로그인 하러가기</a>
</body>
</html>