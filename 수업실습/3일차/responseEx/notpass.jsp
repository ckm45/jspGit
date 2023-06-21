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
		String strAge = request.getParameter("age");
		
		int age = Integer.parseInt(strAge);
	%>
	당신의 나이는 <%= age %>세로 미성년자입니다.
	<form action = "requestex.html" method="post">
		<input type = "submit" value="처음으로">
	</form>
</body>
</html>