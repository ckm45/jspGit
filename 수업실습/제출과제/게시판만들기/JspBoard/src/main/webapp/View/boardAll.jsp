<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beach Board</title>
<style>
    .indent-icon {
        display: inline-block;
        font-size: 16px;
        color: #FF4081; /* 들여쓰기 아이콘의 색상 설정 */
    }
    .indent-level-1 {
        margin-left: 10px;
    }
    .indent-level-2 {
        margin-left: 20px;
    }

body {
    background-color: #ECEFF1;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
}
table {
    width: 100%;
    border-collapse: collapse;
    background-color: #FFFFFF;
}
th, td {
    padding: 10px;
    border: 1px solid #CCCCCC;
}
tr:nth-child(even) {
    background-color: #F5F5F5;
}
a {
    color: #1E88E5;
    text-decoration: none;
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
<form action="delete.do" method="post">
    <table>
        <tr>
            <th colspan="7">게시글</th>
        </tr>
        <tr>
            <th><input type="checkbox" id="selectAll" onclick="toggleCheckboxes()"></th>
            <th>id</th>
            <th>이름</th>
            <th>제목</th>
            <th>날짜</th>
            <th>조회수</th>
        </tr>

    <c:forEach items="${dtos}" var="dto">
    <tr>
        <td><input type="checkbox" name="selectedIds" value="${dto.id}"></td>
        <td>${dto.id}</td>
        <td>${dto.name}</td>
        <td>
            <c:forEach begin="1" end="${dto.indent}">
                <span class="indent-icon">-</span>
            </c:forEach>
            <a href="subBoard.do?id=${dto.id}&group=${dto.group}">${dto.title}</a>
        </td>
        <td>${dto.date}</td>
        <td>${dto.view}</td>
    </tr>
    </c:forEach>
</table>
<input type="submit" value="선택된 항목 삭제">
</form>
<button onclick="location.href='boardMenu.jsp'">뒤로 돌아가기</button>
<script>
    function toggleCheckboxes() {
        var checkboxes = document.getElementsByName("selectedIds");
        var selectAllCheckbox = document.getElementById("selectAll");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = selectAllCheckbox.checked;
        }
    }
</script>
</body>
</html>
