<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    <form action="insert.do" method="post">
        <label for="name">작성자 이름:</label>
        <input type="text" name="name" id="name">

        <label for="title">제목:</label>
        <input type="text" name="title" id="title">
        <br/>
        <br/>
        <br/>
        <label for="content">내용:</label>
        <textarea rows="10" cols="50"  type="content" name="content" id="content"></textarea>

        <input type="submit" value="작성">
    </form>
    

</body>
</html>