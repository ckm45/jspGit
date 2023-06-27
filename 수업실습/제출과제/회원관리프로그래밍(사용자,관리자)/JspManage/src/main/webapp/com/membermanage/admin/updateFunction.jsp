<%@page import="com.daodto.MemberDTO"%>
<%@page import="com.daodto.MemberDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f8f8;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            max-width: 400px;
            background-color: #fff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
        }

        .message {
            margin-bottom: 30px;
            text-align: center;
            color: #555;
        }

        .btn-container {
            text-align: center;
        }

        .btn {
            display: inline-block;
            padding: 12px 30px;
            background-color: #4caf50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원 정보 수정</h1>
        <div class="message">
            <%
                String field = request.getParameter("field");
                String context = request.getParameter("context");
                String id = request.getParameter("id");

                MemberDAO memberDAO = new MemberDAO();
                memberDAO.memberUpdate(id, field, context);
                out.println(memberDAO.memberSelect(id).getName() + "의 " + field + "값이 " + context + "로 변경되었습니다.");
                // 여기서 field와 context 값을 사용하여 원하는 작업을 수행합니다.
                // 예를 들어, 데이터베이스 업데이트 작업 등을 수행할 수 있습니다.
            %>
        </div>
        <div class="btn-container">
            <a href="selectMembers.jsp" class="btn">이전으로 돌아가기</a>
        </div>
    </div>
</body>
</html>
