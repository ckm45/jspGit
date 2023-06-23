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
		MemberDAO memberDAO = new MemberDAO();
		ArrayList<MemberDTO> dtos = memberDAO.memberAllSelect();
		
		for(int i = 0; i < dtos.size();i++) {
			MemberDTO dto = dtos.get(i);
			
			String name = dto.getName();
			String id = dto.getId();
			String pw = dto.getPw();
			String phone = dto.getPhone1() + " - " + dto.getPhone2() + " - " + dto.getPhone3();
			String gender = dto.getGender();
			
			out.println("이름: " + name + ", 아이디: " + id + ", 비밀번호: " + pw + ", 연락처: " + phone + ", 성별: " + gender + "<br/>");
		}
	%>
	<form action="memberUpdate.jsp" method="post">
		수정할 회원의 ID를 입력하시오 <br/>
		아이디 : <input type = "text" name = "id"> <br/>
		<input type="submit" value="전송">
	</form>
</body>
</html>