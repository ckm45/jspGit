<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 회원 승인</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f2f2f2;
        padding-top: 50px;
    }

    h2 {
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }

    hr {
        width: 80%;
        margin: 30px auto;
        border: none;
        border-top: 1px solid #ccc;
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 30px;
    }

    label {
        font-size: 14px;
        color: #333;
        margin-bottom: 5px;
    }

    input[type="text"] {
        width: 200px;
        padding: 8px;
        margin-bottom: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    input[type="submit"] {
        padding: 8px 16px;
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
        color: #4caf50;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 14px;
    }

    .back-link i {
        margin-right: 5px;
    }

    .back-link:hover {
        color: #45a049;
    }

    table {
        width: 80%;
        margin: 0 auto;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        border-bottom: 1px solid #ccc;
        font-size: 14px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
        font-weight: bold;
        color: #333;
    }

    td {
        color: #666;
    }
</style>
</head>
<body>
    <h2>탈퇴 회원 승인</h2>
    <table>
        <thead>
            <tr>
                <th>이름</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>가입 상태</th>
                <th>권한</th>
            </tr>
        </thead>
        <tbody>
            <% 
            MemberDAO memberDAO = new MemberDAO();
            ArrayList<MemberDTO> dtos = memberDAO.memberBeforeDelete();
            for(int i = 0; i < dtos.size(); i++) {
                MemberDTO dto = dtos.get(i);
                String name = dto.getName();
                String id = dto.getId();
                String pw = dto.getPw();
                String phone = dto.getPhone();
                String email = dto.getEmail();
                String status = dto.getStatus();
                String auth = dto.getAuth();
            %>
            <tr>
                <td><%= name %></td>
                <td><%= id %></td>
                <td><%= pw %></td>
                <td><%= phone %></td>
                <td><%= email %></td>
                <td><%= status %></td>
                <td><%= auth %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <form action="deleteOkFunction.jsp" method="post">
        <label for="id">탈퇴 승인할 회원의 아이디를 입력하세요:</label>
        <input type="text" name="id">
        <input type="submit" value="승인">
    </form>
    <a href="adminMenu.jsp" class="back-link"><i class="fas fa-chevron-left"></i> 메뉴 화면으로 돌아가기</a>
</body>
</html>
