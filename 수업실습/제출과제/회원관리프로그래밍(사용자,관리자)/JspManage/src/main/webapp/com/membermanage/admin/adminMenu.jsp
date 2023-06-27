<%@page import="com.daodto.MemberDTO"%>
<%@page import="com.daodto.MemberDAO"%>
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
<title>관리자 메뉴 페이지</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f2f2f2;
    }

    h2 {
        color: #333;
        margin-top: 50px;
        font-size: 24px;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .welcome-message {
        margin-bottom: 20px;
        font-size: 18px;
    }

    .menu {
        margin-top: 30px;
    }

    .menu a {
        display: inline-block;
        margin: 10px;
        padding: 12px 30px;
        background-color: #4caf50;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        font-size: 16px;
    }

    .menu a:hover {
        background-color: #45a049;
    }

    .logout-link {
        display: inline-block;
        margin-top: 20px;
        color: #4caf50;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 14px;
    }

    .logout-link:hover {
        color: #45a049;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>관리자 메뉴 페이지</h2>
        <div class="welcome-message">
            <% String id = (String)session.getAttribute("id"); 
               String pw = (String)session.getAttribute("pw");
               MemberDAO memberDAO = new MemberDAO();
               out.println(memberDAO.memberSelect(id).getName() + "님 환영합니다."); %>
        </div>
        <div class="menu">
            <a href="adminJoinOk.jsp">회원가입 승인 관리 페이지</a>
            <br>
            <a href="selectMembers.jsp">회원 관리 페이지</a>
            <br>
            <a href="deleteOk.jsp">회원 탈퇴 승인 관리 페이지</a>
        </div>
        <a href="logout.jsp" class="logout-link">로그아웃</a>
    </div>
</body>
</html>
