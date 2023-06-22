<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="ModifyOk" method="post">
		회원정보 수정<br/>
		비밀번호 : <input type="password" name="pw"> <br/>
		전화번호 1 : <input type="text" name="phone1"> <br/> 
		전화번호 2 : <input type="text" name="phone2"> <br/> 
		전화번호 3 : <input type="text" name="phone3"> <br/>
		성별 : <input type="text" name="gender"> <br/> 
		<input type="submit" value="전송">
	</form>
</body>
</html>