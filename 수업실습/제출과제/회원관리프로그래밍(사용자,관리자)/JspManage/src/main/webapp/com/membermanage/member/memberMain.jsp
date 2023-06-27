<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 및 로그인</title>
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

    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
    <div class="container">
        <h1>사용자 회원 가입 및 로그인</h1>
        <div class="menu">
            <a href="join.jsp">회원가입</a>
            <a href="login.jsp">로그인</a>
            <a href="/JspManage/com/membermanage/main.jsp">전체 메인 화면</a>
        </div>
    </div>
</body>
</html>