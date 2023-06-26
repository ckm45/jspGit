<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f2f2f2;
    }
.container {
max-width: 600px;
margin: 0 auto;
padding: 40px;
background-color: #fff;
border-radius: 10px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
color: #333;
margin-top: 0;
}

.form-container {
margin-top: 20px;
text-align: left;
}

.form-container label {
display: block;
font-weight: bold;
margin-bottom: 5px;
}

.form-container input[type="text"] {
width: 100%;
padding: 8px;
margin-bottom: 10px;
border-radius: 5px;
border: 1px solid #ccc;
}

.form-container select {
width: 100%;
padding: 8px;
margin-bottom: 10px;
border-radius: 5px;
border: 1px solid #ccc;
}

.form-container input[type="submit"] {
padding: 10px 20px;
background-color: #4caf50;
color: #fff;
border: none;
border-radius: 5px;
cursor: pointer;
}

.back-link {
margin-top: 20px;
display: inline-block;
color: #4caf50;
text-decoration: none;
transition: color 0.3s ease;
}

.back-link:hover {
color: #45a049;
}
</style>

</head>
<body>
    <div class="container">
        <%
        String id = (String)session.getAttribute("id");
        out.println("<h2>" + id + "님의 회원정보 수정 페이지</h2>");

MemberDAO memberDAO = new MemberDAO();
MemberDTO dto = memberDAO.memberSelect(id);
String dtoName = dto.getName();
String dtoId = dto.getId();
String dtoPw = dto.getPw();
String dtoPhone = dto.getPhone();
String dtoEmail = dto.getEmail();
String dtoStatus = dto.getStatus();
String dtoAuth = dto.getAuth();

%>
<div class="form-container">
    <h3>회원 정보</h3>
    <ul>
        <li><strong>이름:</strong> <%= dtoName %></li>
        <li><strong>아이디:</strong> <%= dtoId %></li>
        <li><strong>비밀번호:</strong> <%= dtoPw %></li>
        <li><strong>연락처:</strong> <%= dtoPhone %></li>
        <li><strong>이메일:</strong> <%= dtoEmail %></li>
        <li><strong>가입 상태:</strong> <%= dtoStatus %></li>
        <li><strong>권한:</strong> <%= dtoAuth %></li>
    </ul>
</div>
<form action="memberUpdate.jsp" method="post" class="form-container">
    <h3>정보 수정</h3>
    <label for="field">수정하고 싶은 정보:</label>
    <select name="field" id="field">
        <option value="name">이름</option>
        <option value="password">비밀번호</option>
        <option value="phone">연락처</option>
        <option value="email">이메일</option>
    </select>
    <br />
    <label for="context">수정하고 싶은 내용:</label>
    <input type="text" name="context" id="context">
    <input type="hidden" name="id" value="<%= dtoId %>">
    <br />
    <input type="submit" value="수정">
</form>
<br />
<a href="memberMenu.jsp" class="back-link">메뉴 화면으로 돌아가기</a>
</div>
</body>
</html>