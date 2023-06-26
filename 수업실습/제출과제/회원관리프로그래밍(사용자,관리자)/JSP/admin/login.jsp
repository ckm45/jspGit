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
        padding-top: 50px;
    }

    h1 {
        color: #333;
        font-size: 28px;
        margin-bottom: 20px;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 40px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-container {
        margin-top: 20px;
        text-align: left;
    }

    .form-container label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
    }

    .form-container input[type="text"],
    .form-container input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .form-container input[type="submit"] {
        padding: 12px 20px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-container input[type="submit"]:hover {
        background-color: #45a049;
    }

    .back-link {
        margin-top: 20px;
        display: inline-block;
        color: #4caf50;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 14px;
    }

    .back-link:hover {
        color: #45a049;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>로그인</h1>
        <form action="/JspClass/com/day0625/admin/loginOk.jsp" method="post" class="form-container">
            <label for="id">아이디:</label>
            <input type="text" name="id" id="id">
            <br>
            <label for="pw">비밀번호:</label>
            <input type="password" name="pw" id="pw">
            <br>
            <input type="submit" value="로그인">
        </form>
        <br>
        <a href="adminMain.jsp" class="back-link">뒤로 가기</a>
    </div>
</body>
</html>
