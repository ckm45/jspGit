<%@page import="com.day0625.MemberDTO"%>
<%@page import="com.day0625.MemberDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
  String field = request.getParameter("field");
  String context = request.getParameter("context");
  String id = request.getParameter("id");
  
  MemberDAO memberDAO = new MemberDAO();
  memberDAO.memberUpdate(id, field, context);
  out.println(memberDAO.memberSelect(id).getName() + "의 " + field + "값이 " + context + "로 변경되었습니다.");
  // 여기서 field와 context 값을 사용하여 원하는 작업을 수행합니다.
  // 예를 들어, 데이터베이스 업데이트 작업 등을 수행할 수 있습니다.
    %>
  <br/>
  <a href="selectMembers.jsp">이전으로 돌아오기</a>

</body>
</html>