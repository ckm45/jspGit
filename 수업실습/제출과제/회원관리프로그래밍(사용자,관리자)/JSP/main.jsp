<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 프로그램</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f2f2f2;
    }

    h1 {
        color: #333;
        margin-top: 50px;
        font-size: 28px;
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
        font-size: 18px;
    }

    .menu a:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>
    <h1>회원 관리 프로그램</h1>
    <div class="menu">
        <a href="/JspClass/com/day0625/member/memberMain.jsp">사용자 메뉴</a>
        <a href="/JspClass/com/day0625/admin/adminMain.jsp">관리자 메뉴</a>
    </div>
</body>
</html>
