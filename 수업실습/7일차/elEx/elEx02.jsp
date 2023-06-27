<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "member" class="bean.ex.MemberBean"></jsp:useBean>
<jsp:setProperty name = "member" property = "name" value = "홍길동"/>
<jsp:setProperty name = "member" property = "id" value = "test"/>
<jsp:setProperty name = "member" property = "password" value = "1234"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    Jsp 표현식
    이름 : <jsp:getProperty property="name" name="member"/><br/>
    아이디 : <jsp:getProperty property="id" name="member"/><br/>
    비밀번호 : <jsp:getProperty property="password" name="member"/><br/>
    
    <hr/>
    
    EL 표현식
    이름 : ${pageScope.member.name}<br/>
    아이디 : ${pageScope.member.id }<br/>
    비밀번호 : ${member.password }<br/>
    
</body>
</html>