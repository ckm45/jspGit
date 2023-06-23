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
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO(name,id,pw,phone1,phone2,phone3,gender);
		
		memberDAO.memberUpdate(memberDTO);
	%>
		회원정보 수정 완료 <br/>
		아이디 : <%=memberDTO.getId()%> <br/>
		이름 : <%=memberDTO.getName()%> <br/>
		비밀번호 : <%=memberDTO.getPw()%><br/>
		전화번호 1 : <%=memberDTO.getPhone1()%> <br/> 
		전화번호 2 : <%=memberDTO.getPhone2()%> <br/> 
		전화번호 3 : <%=memberDTO.getPhone3()%> <br/>
		성별 : <%=memberDTO.getGender()%> <br/> 
		<a href="memberSelect.jsp">처음으로</a>
</body>
</html>