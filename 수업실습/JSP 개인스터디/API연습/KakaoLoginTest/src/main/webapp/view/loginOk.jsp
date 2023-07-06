<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    로그인 성공
    
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