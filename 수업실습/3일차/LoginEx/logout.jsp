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
		if(str.equals("ckm")){
			cookies[i].setMaxAge(0);
		  response.addCookie(cookies[i]);
	
		  out.println(cookies[i].getName()+ "님 로그아웃하겠습니다.<br/>");
		}
	}
	%>
</body>
</html>