<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
    Kakao.init("24b135b96ea4820e030dd2802041d7bb");
    
    
    function kakaoLogout() {
    	 if (Kakao.Auth.getAccessToken()) {
    	      Kakao.API.request({
    	        url: '/v1/user/unlink',
    	        success: function (response) {
    	            console.log(response)
    	            location.href="loginTest.jsp"
    	            session.invalidate();
    	        },
    	        fail: function (error) {
    	          console.log(error)
    	        },
    	      })
    	      Kakao.Auth.setAccessToken(undefined)
    	    }
    	}

</script>

</head>
<body>
	<h2>로그인 성공</h2>
	<a href="javascript:kakaoLogout()">로그아웃</a>
</body>
</html>