<%@page import="com.daodto.MemberDTO"%>
<%@page import="com.daodto.MemberDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	background-color: #f2f2f2;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 40px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.success-message {
	color: #4caf50;
	font-weight: bold;
	margin-top: 20px;
}

.back-link {
	margin-top: 20px;
	display: inline-block;
	color: #4caf50;
	text-decoration: none;
	transition: color 0.3s ease;
}

.back-link:hover {
	color: #45a049;
}
</style>

</head>
<body>
	<div class="container">
		<%
        String field = request.getParameter("field");
        String context = request.getParameter("context");
        String id = request.getParameter("id");
    MemberDAO memberDAO = new MemberDAO();
    memberDAO.memberUpdate(id, field, context);
    String memberName = memberDAO.memberSelect(id).getName();
    %>
		<h2>회원 정보 수정 결과</h2>
		<p><%= memberName %>님의
			<%= field %>
			값이
			<%= context %>로 변경되었습니다.
		</p>
		<a href="selectMember.jsp" class="back-link">이전으로 돌아가기</a>
	</div>
</body>
</html>