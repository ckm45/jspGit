<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="JspClass/com/day0625/admin/joinOk.jsp" method="post">
		이름: <input type="text" name="name"> <br/>
		아이디 : <input type="text" name="id"> <br/> 
		비밀번호 : <input type="password" name="pw"> <br/>
		전화번호  : <input type="text" name="phone"> <br/> 
		이메일 : <input type="text" name="email"> <br/>
		<input type="submit" value="회원가입요청">
	</form>
</body>
</html>