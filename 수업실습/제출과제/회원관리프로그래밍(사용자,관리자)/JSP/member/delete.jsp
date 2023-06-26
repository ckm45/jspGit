<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
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
    String sId = (String)session.getAttribute("id");
    MemberDAO memberDAO = new MemberDAO();
    
    MemberDTO dto = memberDAO.memberSelect(sId);
    memberDAO.memberDelete(dto.getId());
    String message = dto.getName() + "님 회원 탈퇴 요청이 완료되었습니다.";
    %>
    
    <script>
        alert("<%= message %>");
        location.href = "/JspClass/com/day0625/main.jsp";
    </script>
</body>
</html>
