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
    <%
    String id = request.getParameter("id");
    MemberDAO memberDAO = new MemberDAO();
    boolean joinResult = memberDAO.joinOkfunction(id);
    String alertMessage = "";
    String redirectPage = "adminJoinOk.jsp";
    if (joinResult) {
        alertMessage = "가입승인이 완료되었습니다.";
    } else {
        alertMessage = "ID를 다시 입력해주세요.";
    }
    %>
    
    <script>
        alert("<%= alertMessage %>");
        location.href = "<%= redirectPage %>";
    </script>
</body>
</html>
