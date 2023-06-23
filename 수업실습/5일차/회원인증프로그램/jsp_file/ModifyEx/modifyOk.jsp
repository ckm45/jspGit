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
<h2>회원 정보 정상 수정되었습니다.</h2>
<% 
	MemberDAO memberDAO = new MemberDAO();
	String id = (String)session.getAttribute("id");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");	

	MemberDTO memberDTO = new MemberDTO(name , id, pw, phone1, phone2, phone3, gender);
	memberDAO.memberUpdate(memberDTO);
	out.println(memberDAO.memberSelect(id).getName() + "님의 정보가 수정되었습니다.");
%>


<a href="/JspClass/com/day0623/MemberEx/main.jsp">메인 화면</a><br/>
</body>
</html>