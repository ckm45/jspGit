<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberProc.jsp" method="get">
		아이디 : <input type="text" name="id"> <br/> 
		비밀번호 : <input type="password" name="password"> <br/>
		이름: <input type="text" name="name"> <br/>
		이메일 : <input type="text" name="email"> <br/> 
		<input type="submit" value="전송">
	</form>
</body>
</html>