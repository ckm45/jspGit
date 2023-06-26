<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 승인 페이지</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f2f2f2;
    }

    h2 {
        color: #333;
        margin-top: 50px;
        font-size: 24px;
    }

    .member-list {
        margin-top: 30px;
        text-align: left;
    }

    .member-list-item {
        margin-bottom: 20px;
        padding: 10px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    }

    .member-list-item h3 {
        margin: 0;
        font-size: 18px;
        color: #333;
    }

    .member-list-item p {
        margin-top: 10px;
        font-size: 14px;
        color: #777;
    }

    .approve-form {
        margin-top: 30px;
    }

    .approve-form label {
        display: block;
        margin-bottom: 10px;
        font-size: 16px;
        color: #333;
    }

    .approve-form input[type="text"] {
        width: 300px;
        padding: 8px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .approve-form input[type="submit"] {
        margin-top: 10px;
        padding: 10px 20px;
        background-color: #4caf50;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    .return-link {
        display: inline-block;
        margin-top: 20px;
        color: #4caf50;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 14px;
    }

    .return-link:hover {
        color: #45a049;
    }
</style>
</head>
<body>
    <h2>회원가입 승인 페이지</h2>
    <div class="member-list">
        <% MemberDAO memberDAO = new MemberDAO();
           ArrayList<MemberDTO> dtos = memberDAO.memberBeforeSelect();
           for(int i = 0; i < dtos.size();i++) {
               MemberDTO dto = dtos.get(i);
               String name = dto.getName();
               String id = dto.getId();
               String pw = dto.getPw();
               String phone = dto.getPhone();
               String email = dto.getEmail();
               String status = dto.getStatus();
               String auth = dto.getAuth();
        %>
        <div class="member-list-item">
            <h3><%= name %>님</h3>
            <p>아이디: <%= id %></p>
            <p>비밀번호: <%= pw %></p>
            <p>연락처: <%= phone %></p>
            <p>이메일: <%= email %></p>
            <p>가입 상태: <%= status %></p>
            <p>권한: <%= auth %></p>
        </div>
        <% } %>
    </div>
    <hr/>
    <div class="approve-form">
        <form action="joinOkFunction.jsp" method="post">
            <label for="id">가입 승인할 회원의 아이디를 입력하세요:</label>
            <input type="text" id="id" name="id"><br>
            <input type="submit" value="승인">
        </form>
    </div>
    <a href="adminMenu.jsp" class="return-link">메뉴 화면으로 돌아가기</a>
</body>
</html>
