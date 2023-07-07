<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="daodto.MemberDto" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function showMessageAndRedirect() {
		alert("로그인 실패");
		location.href = "login.jsp";
	}
</script>
</head>
<body>
    <c:if test="${loginResult == true}">
       <%  
     // 세션에서 dto 객체를 가져옴
     MemberDto dto = (MemberDto) session.getAttribute("dto");
     // dto 객체가 null이라면 로그인이 실패한 것으로 판단하고 알림 메시지를 보여줌
     if(dto == null){
       %><script>showMessageAndRedirect();</script><%
     }else{
       // 로그인이 성공했다면 환영 메시지를 출력함
       out.println(dto.getName() + "님 환영합니다.");
     }
   %>
    </c:if>
    <br/>
	<a href="main.jsp">메인으로 가기</a>
	<c:if test="${loginResult == false}">
		<script>
			showMessageAndRedirect();
		</script>
	</c:if> 
	



</body>
</html>