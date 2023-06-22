<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션을 삭제합니다</h2>
    <%
        // 세션 ID를 가져옴
        String sessionId = session.getId();

        // 세션을 삭제함
        session.invalidate();
    %>

    세션 <%= sessionId %>이(가) 삭제되었습니다.
    <br/>
    <a href="setSessionEx.jsp">처음으로</a>
</body>
</html>
