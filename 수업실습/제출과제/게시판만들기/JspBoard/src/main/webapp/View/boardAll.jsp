<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="delete.do" method="post">
    <table width="500" cellpadding="0" cellspacing="0" border="1">
        <tr>
            <td>id</td>
            <td>이름</td>
            <td>제목</td>
            <td>날짜</td>
            <td>체크박스</td>
        </tr>
        
        <c:forEach items="${list}" var="dto">
        <tr>
            <td>${dto.id}</td>
            <td>${dto.name}</td>
            <td><a href="subBoard.do?id=${dto.id}">${dto.title}</a></td>
            <td>${dto.date}</td>
            <td><input type="checkbox" name="selectedIds" value="${dto.id}"></td>
        </tr>
        </c:forEach>
    </table>
    <input type="submit" value="선택된 항목 삭제">
</form>
</body>
</html>
