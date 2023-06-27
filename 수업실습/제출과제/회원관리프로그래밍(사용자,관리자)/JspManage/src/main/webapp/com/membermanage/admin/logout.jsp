<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f2f2f2;
    }

    .logout-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }

    .logout-icon {
        color: #4caf50;
        font-size: 72px;
        margin-bottom: 30px;
    }

    .logout-message {
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    .return-link {
        color: #4caf50;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 18px;
    }

    .return-link i {
        margin-right: 5px;
    }

    .return-link:hover {
        color: #45a049;
    }
</style>
</head>
<body>
    <div class="logout-container">
        <i class="fas fa-sign-out-alt logout-icon"></i>
        <div class="logout-message">
            <% String sName = (String) session.getAttribute("id"); %>
            <%= sName %>님, 로그아웃 되었습니다.
        </div>
        <a href="/JspManage/com/membermanage/main.jsp" class="return-link"><i class="fas fa-chevron-left"></i> 처음으로</a>
    </div>
</body>
</html>
