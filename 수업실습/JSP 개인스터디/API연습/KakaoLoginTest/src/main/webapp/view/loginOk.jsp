<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.json.JSONObject" %>
<%@ page import="daodto.MemberDto" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function showMessageAndRedirect() {
		alert("로그인 실패");
		location.href = "login.jsp";
	}
</script>
<Script>
    function showMessageAndRedirect2() {
        alert("로그인 성공");
        //location.href = "login.jsp";
    }
</script>

<script type="text/javascript"
    src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
Kakao.init(""); // API 키값
    
    
    function kakaoLogout() {
         if (Kakao.Auth.getAccessToken()) {
              Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                    location.href="main.jsp"
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
    
    <c:if test="${loginResult == true}">
       <%  
     // 세션에서 dto 객체를 가져옴
     MemberDto dto = (MemberDto) session.getAttribute("dto");
     // dto 객체가 null이라면 로그인이 실패한 것으로 판단하고 알림 메시지를 보여줌
     if(dto == null){
         
       %><script>showMessageAndRedirect2();</script><%
     }else{
         
       // 로그인이 성공했다면 환영 메시지를 출력함
       out.println(dto.getName() + "님 환영합니다.");
     }
   %>
    </c:if>
    <br/>
	<a href="main.jsp">메인으로 가기</a>
	<c:if test="${loginResult == false}">
		<script>
			showMessageAndRedirect();
		</script>
	</c:if> 
	
    <br/>
    <br/>
    <a href="memberUpdate.jsp">회원정보 수정</a>
    <button onclick="javascript:kakaoLogout()">카카오 로그아웃</button>
    <br/>
    <button onclick="logout()">일반 로그아웃</button>
    <script>function logout() {
        <% session.invalidate(); %>
        location.href = "main.jsp";
    }    
    </script>    
</body>
</html>