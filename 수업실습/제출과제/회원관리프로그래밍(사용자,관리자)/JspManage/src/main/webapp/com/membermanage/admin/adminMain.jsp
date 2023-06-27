<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	text-align: center;
	background-color: #f2f2f2;
}

.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 40px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.link-container {
	margin-top: 20px;
}

.link-container a {
	display: inline-block;
	margin-bottom: 10px;
	padding: 10px 20px;
	background-color: #4caf50;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.link-container a:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="container">
		<h2>관리자 메뉴</h2>
		<p>다음 링크를 통해 이동하세요.</p>
		<div class="link-container">
			<a href="/JspManage/com/membermanage/admin/login.jsp">로그인</a> <br /> <a
				href="/JspManage/com/membermanage/main.jsp">메인화면</a>
		</div>
	</div>
</body>
</html>