<%@page import="com.daotoex.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daotoex.MemberDAO"%>
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
		MemberDTO memberDTO = memberDAO.memberSelect(id);
	%>

	<form action="memberUpdateResult.jsp" method="post">
		회원정보 수정<br/>
		아이디 : <input type = "text" name = "id" value = "<%=memberDTO.getId()%>"> <br/>
		이름 : <input type = "text" name = "name" value = "<%=memberDTO.getName()%>"> <br/>
		비밀번호 : <input type="password" name="pw" value = "<%=memberDTO.getPw()%>"> <br/>
		전화번호 1 : <input type="text" name="phone1" value = "<%=memberDTO.getPhone1()%>"> <br/> 
		전화번호 2 : <input type="text" name="phone2" value = "<%=memberDTO.getPhone2()%>"> <br/> 
		전화번호 3 : <input type="text" name="phone3" value = "<%=memberDTO.getPhone3()%>"> <br/>
		성별 : <input type="text" name="gender" value = "<%=memberDTO.getGender()%>"> <br/> 
		<input type="submit" value="전송">
	</form>
</body>
</html>