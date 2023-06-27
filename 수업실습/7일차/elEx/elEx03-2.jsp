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
        String pw = request.getParameter("pw");
        
    %>
    Jsp 표기 <br/>
    아이디 : <%= id %><br/>
    비밀번호 : <%= pw %><br/>
    
    <hr/>
    
    El 표기 1<br/>
    아이디 : ${param.id }<br/>
    비밀번호 : ${param.pw }<br/>
    
    <hr/>
    
    El 표기 2 (대괄호 사용) <br/>
    아이디 : ${param["id"] }<br/>
    비밀번호 : ${param["pw"] }<br/>
    
    <hr/>
    
    applicationScope : ${applicationScope.application_name }<br/>
    sessionScope : ${sessionScope.session_name }<br/>
    pageScope : ${pageScope.page_name }<br/>
    reqeustScope : ${requestScope.request_name }<br/>
    
    <hr/>
    
    context 초기화 파라미터<br/>
    dbId : ${initParam.dbId }<br/>
    dbPwd : ${initParam.dbPwd }<br/>
    dbSid : ${initParam.dbSid }<br/>
    
        
    
</body>
</html>