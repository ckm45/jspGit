<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원 정보 정상 수정되었습니다.</h2>
<% String sName = (String)session.getAttribute("name");%>
<%=sName%>님의 회원 정보가 수정되었습니다.

<a href="/JspClass/com/day0622/MemberEx/ModifyEx/modify.jsp">회원 정보수정</a><br/>
<a href="/JspClass/com/day0622/MemberEx/LoginEx/logout.jsp">로그아웃</a><br/>
</body>
</html>