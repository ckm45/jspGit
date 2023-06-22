<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String sName = (String)session.getAttribute("name");%>
	<%=sName%>님 로그아웃하겠습니다.
	<% session.invalidate(); %>

</body>
</html>