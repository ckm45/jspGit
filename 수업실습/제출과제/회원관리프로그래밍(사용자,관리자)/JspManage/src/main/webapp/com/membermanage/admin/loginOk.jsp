<%@page import="com.daodto.MemberDTO"%>
<%@page import="com.daodto.MemberDAO"%>
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
    if(memberDAO.adminLoginCheck(id, pw)){
        out.println(id);
        out.println(pw);
        session.setAttribute("id", id);
        session.setAttribute("pw", pw);
        response.sendRedirect("adminMenu.jsp");

    }
    else{
        out.println("로그인 실패하였습니다.");
        response.sendRedirect("login.jsp");
    }

    %>
</body>
</html>