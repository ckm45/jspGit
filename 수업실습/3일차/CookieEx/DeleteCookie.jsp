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
	Cookie[] cookies = request.getCookies();
	for(int i = 0; i < cookies.length; i++){
	    String str = cookies[i].getName();
		if(str.equals("cookieName")| str.equals("cookieName2")){
			cookies[i].setMaxAge(0);
		  response.addCookie(cookies[i]);
	
		  out.println("삭제된 쿠키의 속성 이름(name): " + cookies[i].getName()+ "<br/>");
		}
	}

	%>
	<a href="SetCookie.jsp">처음으로</a>
</body>
</html>