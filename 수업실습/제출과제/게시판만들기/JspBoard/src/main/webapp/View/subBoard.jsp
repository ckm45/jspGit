<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제목을 입력하세요</title>
<style>
    body {
        background-color: #ECEFF1;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
    }
    form {
        max-width: 500px;
        margin: 0 auto;
    }
    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
    }
    input[type="text"],
    textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #CCCCCC;
        border-radius: 4px;
    }
    textarea {
        height: 200px;
    }
    input[type="submit"] {
        margin-top: 10px;
        padding: 8px 16px;
        font-size: 16px;
        background-color: #FF4081;
        color: #FFFFFF;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #D81B60;
    }
    .link {
        margin-top: 20px;
        text-align: center;
    }
    .link a {
        display: inline-block;
        padding: 8px 16px;
        font-size: 16px;
        background-color: #1E88E5;
        color: #FFFFFF;
        text-decoration: none;
        border-radius: 4px;
    }
    .link a:hover {
        background-color: #0D47A1;
    }
    .go-back {
        margin-top: 20px;
        text-align: center;
    }
    .go-back a {
        display: inline-block;
        padding: 8px 16px;
        font-size: 16px;
        background-color: #FF9800;
        color: #FFFFFF;
        text-decoration: none;
        border-radius: 4px;
    }
    .go-back a:hover {
        background-color: #F57C00;
    }
</style>
</head>
<body>
<form action="update.do" method="post">
    <h2>회원정보 수정</h2>
    <label for="id">아이디:</label>
    <span><c:out value="${dto.id}" /></span><br/>
    <label for="view">조회수:</label>
    <span><c:out value="${dto.view}" /></span><br/>
    <input type="hidden" name="id" value="<c:out value='${dto.id}' />">
    <label for="name">이름:</label>
    <input type="text" name="name" value="<c:out value='${dto.name}' />"><br/>
    <label for="title">제목:</label>
    <input type="text" name="title" value="<c:out value='${dto.title}' />"><br/> 
    <label for="content">내용:</label>
    <textarea rows="10" cols="50" name="content" id="content"><c:out value='${dto.content}' /></textarea><br/>
    <input type="hidden" name="group" value="<c:out value='${dto.group}' />">
    <input type="submit" value="수정">
</form>
<div class="link">
    <a href="boardSubWrite.jsp?group=${dto.id}&level=${dto.level}&indent=${dto.indent}&id=${dto.id}">답글</a>
</div>
<div class="go-back">
    <a href="boardMenu.jsp">돌아가기</a>
</div>
</body>
</html>
