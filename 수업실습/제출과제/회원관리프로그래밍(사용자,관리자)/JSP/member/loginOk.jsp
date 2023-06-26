<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 체크

    <%
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    MemberDAO memberDAO = new MemberDAO();
    boolean loginResult = memberDAO.memberLoginCheck(id, pw);
    String alertMessage = "";
    String redirectPage = "memberMenu.jsp";
    String redirectPage2 = "login.jsp";
    if(loginResult){
        session.setAttribute("id", id);
        session.setAttribute("pw", pw);
        alertMessage = "로그인 성공하였습니다.";
        redirectPage = "memberMenu.jsp";

    }
    else{
        alertMessage = "로그인 실패하였습니다.";
        redirectPage = "login.jsp";
    }

    %>
    
    <script>
        var alertMessage = "<%= alertMessage %>";
        var redirectPage = "<%= redirectPage %>";

        alert(alertMessage);
        location.href = redirectPage;
    </script>
</body>
</html>
