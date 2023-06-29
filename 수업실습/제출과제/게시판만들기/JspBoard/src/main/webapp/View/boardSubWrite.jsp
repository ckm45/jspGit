<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
    
    <form action="subInsert.do?group=${param.group}&level=${param.level}&indent=${param.indent}&id=${param.id}" method="post">
        <label for="name">작성자 이름:</label>
        <input type="text" name="name" id="name">

        <label for="title">제목:</label>
        <input type="text" name="title" id="title"/>
        <!-- value="${dto.group} 의 답글"  -->
        <br/>
        <br/>
        <br/>
        <label for="content">내용:</label>
        <textarea rows="10" cols="50"  type="content" name="content" id="content"></textarea>

        <input type="submit" value="작성">
    </form>
    
</body>
</html>
