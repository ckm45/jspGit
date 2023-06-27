<%@page import="com.daodto.MemberDTO"%>
<%@page import="com.daodto.MemberDAO"%>
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
    boolean deletionResult = memberDAO.deleteOkfunction(id);
    String alertMessage = "";
    String redirectPage = "deleteOk.jsp";

    if (deletionResult) {
        alertMessage = "삭제가 완료되었습니다.";
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
