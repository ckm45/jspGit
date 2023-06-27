<%@page import="com.daodto.MemberDTO"%>
<%@page import="com.daodto.MemberDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    function validatePasswordJS(pw) {
        // 패스워드는 4글자 이상이며 숫자와 문자로만 이루어져야 합니다.
        if (pw.length < 4) {
            alert("패스워드는 4글자 이상이어야 합니다.");
            return false;
        }

        var regex = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9]+$/;
        if (!regex.test(pw)) {
            alert("패스워드는 숫자와 문자로만 이루어져야 합니다.");
            return false;
        }

        return true;
    }

    function validateForm() {
        var pw = document.getElementById("pw").value;

        return validatePasswordJS(pw);
    }
</script>
</head>
<body>
    <%
    String name = request.getParameter("name");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    out.println(name + id + pw + phone + email);
    MemberDAO memberDAO = new MemberDAO();
    MemberDTO memberDTO = new MemberDTO(name, id, pw, phone, email);
    boolean joinResult = memberDAO.joinCheck(name, id, pw, phone, email);
    if (joinResult) {
        memberDAO.memberInsert(memberDTO);
    %>
    <script>
        alert("회원가입 요청 완료");
        location.href = "memberMain.jsp";
    </script>
    <%
    } else {
    %>
    <script>
        alert("다시 입력해주세요.");
        location.href = "join.jsp";
    </script>
    <%
    }
    %>
</body>
</html>
