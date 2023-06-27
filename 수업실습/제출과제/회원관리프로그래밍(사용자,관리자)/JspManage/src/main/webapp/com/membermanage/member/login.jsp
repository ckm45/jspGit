<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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

    form {
        margin-top: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    input[type="text"],
    input[type="password"] {
        width: 300px;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
    }

    input[type="submit"] {
        padding: 10px 20px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .back-link {
        color: #4caf50;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 16px;
    }

    .back-link i {
        margin-right: 5px;
    }

    .back-link:hover {
        color: #45a049;
    }
</style>
</head>
<body>
    <h1>로그인</h1>
    <form action="loginOk.jsp" method="post">
        <label for="id">아이디:</label>
        <input type="text" name="id" id="id">

        <label for="pw">비밀번호:</label>
        <input type="password" name="pw" id="pw">

        <input type="submit" value="로그인">
    </form>
    <a href="memberMain.jsp" class="back-link"><i class="fas fa-chevron-left"></i> 뒤로 가기</a>
</body>
</html>
