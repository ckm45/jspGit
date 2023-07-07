<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init(""); // API 키값

	function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						var json = JSON.stringify(response);
						var xhr = new XMLHttpRequest();
						xhr.open("POST", "kakaoLogin.do");
						xhr.setRequestHeader("Content-Type", "application/json");
						xhr.onreadystatechange = function() {
							if (xhr.readyState === 4) {
								if (xhr.status === 200 || xhr.status === 201) {
									 if (JSON.parse(xhr.responseText).viewPage) {	                                     
	                                        location.href = JSON.parse(xhr.responseText).viewPage;
									} else {
										var responseData = JSON
												.parse(xhr.responseText);
										console.log(responseData);
										console.log(responseData.name);
										console.log("hi");
										// 이제 responseData를 사용해서 필요한 작업을 수행할 수 있습니다.
										// 이후 성공적으로 처리되었다면 페이지를 이동
										//var responseDataStr = JSON.stringify(responseData);
										//var encodedData = encodeURIComponent(responseDataStr);
										//var url = "loginOk.jsp?responseData=" + encodedData;
										location.href = "loginOk.jsp;"
									}
								} else {
									console.error(xhr.responseText);
								}
							}
						};
						xhr.send(json);
					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				});
			}
		});
	}
</script>
</head>
<body>
	<h1>로그인</h1>
	<form action="login.do" method="post">
		<label for="id">아이디:</label> <input type="text" name="id" id="id">
		<br /> <label for="pw">비밀번호:</label> <input type="password" name="pw"
			id="pw"> <br /> <input type="submit" value="로그인">
	</form>



	<a href="javascript:kakaoLogin()"><img
		src="<c:url value="/img/ko/kakao_login_medium_narrow.png"/>"
		style="width: 200px"></a>
</body>
</html>