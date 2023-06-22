<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		String id;
		String password;
	%>
	<%
	id = request.getParameter("id");
	password = request.getParameter("password");
	
	if(id.equals("ckm") && password.equals("0123")){
	    response.sendRedirect("welcome.jsp?id=" + id + "&password=" + password);

	    
	}
	else{
	    response.sendRedirect("login.jsp");
	}
	
	%>
</body>
</html>