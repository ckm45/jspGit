<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
    Kakao.init(""); //api 키값     
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        var json = JSON.stringify(response);
                        var xhr = new XMLHttpRequest();
                        xhr.open("POST", "kakaoLogin.do");
                        xhr.setRequestHeader("Content-Type", "application/json");
                        xhr.send(json);
                        //결과가 정상 처리 하면 다음 페이지로 이동 
                        //alert(JSON.stringify(response))
                        
                        location.href="loginSuccess.jsp"
                        //location.href="login.do"
                    },
                    fail: function (error) {
                        alert(JSON.stringify(error))
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            },
        })
    }
</script>
</head>
<body>
    <h1>로그인</h1>
    <form action="login.do" method="post">
        <label for="id">아이디:</label>
        <input type="text" name="id" id="id">
        <br/>
        <label for="pw">비밀번호:</label>
        <input type="password" name="pw" id="pw">
        <br/>
        <input type="submit" value="로그인">
    </form>
    
    <a href="javascript:kakaoLogin()"><img src="<c:url value="/img/ko/kakao_login_medium_narrow.png"/>" style="width: 200px"></a>
</body>
</html>