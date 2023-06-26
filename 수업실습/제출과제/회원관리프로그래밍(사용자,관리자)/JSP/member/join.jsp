<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
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

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
    }

    input[type="text"],
    input[type="password"] {
        width: 300px;
        padding: 10px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    input[type="submit"] {
        padding: 12px 20px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
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
    <h1>회원 가입</h1>
    <form action="joinOk.jsp" method="post">
        <label for="name">이름:</label>
        <input type="text" name="name" id="name">

        <label for="id">아이디:</label>
        <input type="text" name="id" id="id">

        <label for="pw">비밀번호:</label>
        <input type="password" name="pw" id="pw">

        <label for="phone">전화번호:</label>
        <input type="text" name="phone" id="phone">

        <label for="email">이메일:</label>
        <input type="text" name="email" id="email">

        <input type="submit" value="회원가입요청">
    </form>
    <br>
    <a href="/JspClass/com/day0625/main.jsp" class="back-link">뒤로 가기</a>
</body>
</html>
