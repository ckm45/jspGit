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
		String name;
		String email;
	%>
	<%
	id = request.getParameter("id");
	password = request.getParameter("password");
	name = request.getParameter("name");
	email = request.getParameter("email");
	%>
	
	<jsp:useBean id = "MemberBean" class="bean.ex.MemberBean" scope = "application" />
	<jsp:setProperty name="MemberBean" property="id" value="<%=id%>"/>
	<jsp:setProperty name="MemberBean" property="password" value="<%=password%>"/>
	<jsp:setProperty name="MemberBean" property="name" value="<%=name%>"/>
	<jsp:setProperty name="MemberBean" property="email" value="<%=email%>"/>
	회원 정보를 저장했습니다
	<a href="memberConfirm.jsp">저장된 정보 출력하기</a>
</body>
</html>