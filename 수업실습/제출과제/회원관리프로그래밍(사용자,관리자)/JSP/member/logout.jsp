<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <% String sId = (String)session.getAttribute("id");%>
    <%=sId%>님 로그아웃하겠습니다.
    <% session.invalidate(); %>
    <br/>
    <a href="/JspClass/com/day0625/main.jsp">처음으로</a>
</body>
</html>