<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beach Board</title>
<style>
    body {
        background-image: url('beach-background.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .title {
        margin-bottom: 20px;
        font-size: 36px;
        color: #fff;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }
    .menu-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .menu-item {
        margin: 10px;
        padding: 10px 20px;
        font-size: 16px;
        text-decoration: none;
        color: #fff;
        border-radius: 50px;
        background-color: #aed6f1;
        transition: background-color 0.3s;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }
    .menu-item:hover {
        background-color: #85c1e9;
    }
</style>
</head>
<body>
    <div class="container">
        <h1 class="title">게시판</h1>
        <div class="menu-container">
            <a class="menu-item" href="select.do">게시글 전체보기</a>
            <a class="menu-item" href="boardWrite.jsp">게시글 작성하기</a>
        </div>
    </div>
</body>
</html>
