<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action = "elEx03-2.jsp" method = "post">
        아이디 : <input type = "text" name = "id"><br/>
        비밀번호 : <input type = "password" name = "pw"><br/>
        <input type = "submit" value = "login">
    </form>
    
    <%
        application.setAttribute("application_name", "application_value");
        session.setAttribute("session_name", "session_value");
        pageContext.setAttribute("page_name", "page_value");
        request.setAttribute("request_name", "request_value");
    
    %><p><p>
    <hr/>
    
    
    <h3>pageScope, requestScope는 같은 page 및 request 에서 처리해야 함</h3>
    pageScope : ${pageScope.page_name }<br/>
    requestScope : ${requestScope.request_name }<br/>
    
    
    
    
</body>
</html>