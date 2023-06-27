<%@page import="com.daodto.MemberDTO"%>
<%@page import="com.daodto.MemberDAO"%>
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

h1 {
    color: #333;
    margin-top: 0;
}

.welcome-message {
    margin-top: 20px;
    font-size: 18px;
    color: #555;
}

.menu {
    margin-top: 30px;
}

.menu a {
    display: block;
    margin: 10px 0;
    padding: 10px 20px;
    background-color: #4caf50;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.menu a:hover {
    background-color: #45a049;
}
</style>
</head>
<body>
    <div class="container">
        <%
        String id = (String)session.getAttribute("id"); 
        String pw = (String)session.getAttribute("pw");
        MemberDAO memberDAO = new MemberDAO();
        MemberDTO member = memberDAO.memberSelect(id);
        String welcomeMessage = member.getName() + "님, 환영합니다.";
        %>

    <h1>개인 정보</h1>
    <p class="welcome-message"><%= welcomeMessage %></p>
    <div class="menu">
        <a href="selectMember.jsp">개인정보 관리 페이지</a>
        <a href="delete.jsp">회원 탈퇴 요청</a>
        <a href="logout.jsp">로그아웃</a>
    </div>
</div>
</body>
</html>