<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="vo.MemberDTO" %> 
<%@ page import="org.json.JSONObject" %>


<!DOCTYPE html>
<html>
<head>
<title>웹 페이지</title>
<style>
/* CSS 스타일 지정 */
body {
    margin: 0;
    padding: 0;
}

.header {
    background-color: #FFFFFF;
    padding: 5px;
}

.section {
    padding: 50px;
}

.footer {
    background-color: #333;
    color: #fff;
    padding: 20px;
    text-align: center;
}

.navbar-nav .nav-item {
    margin-left: 50px;
}

.navbar-nav .nav-link {
    color: #000000;
}

.navbar {
    padding-top: 10px; /* 헤더 상단 여백 조절 */
    padding-bottom: 10px; /* 헤더 하단 여백 조절 */
}

.navbar-brand {
    margin-left: 50px; /* 로고 이미지와 메뉴 간격 조절 */
}

.navbar-nav {
    margin-left: -50px; /* 메뉴 간격 조절 */
}

.logo-img {
    margin-left: 80px;
    max-width: 100px;
    max-height: 100px;
}

.navbar {
    padding-top: 3px; /* 헤더 상단 여백 조절 */
    padding-bottom: 3px; /* 헤더 하단 여백 조절 */
}

.navbar-divider {
    border-top: 2px solid #009591;
    margin-top: 0;
    margin-bottom: 0;
    width: 100%;
}

.section1 {
    background-color: #FFFFFF;
    height: 800px;
}

.title {
    left: 180px;
    top: 180px;
    position: absolute;
    text-align: center;
    color: black;
    font-size: 30px;
    font-family: Noto Sans KR;
}

#product-table {
    width: 80%;
    margin: 0 auto;
    margin-top: -80px;
    ]
}

th, td {
    padding: 12px 20px;
    text-align: left;
    border-bottom: 1px solid #eee;
}

th {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #f9f9f9;
}

.product-buttons {
    list-style-type: none;
    padding: 0;
    margin: 140px 0;
    margin-left: 180px;
}

.product-buttons li {
    display: inline-block;
    margin-right: 10px;
}

.product-buttons button {
    background-color: #009490;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 30px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
}

.product-buttons button:hover {
    background-color: #00756d;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.show-all-button {
    background-color: #009490;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 30px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
}

.show-all-button:hover {
    background-color: #00756d;
    transform: translateY(-2px);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.hide {
    display: none;
}

.BankFooter {
    background-color: #f7f7f7;
    padding: 20px;
    text-align: center;
}

.BankFooterContent {
    max-width: 800px;
    margin: 0 auto;
    margin-top: 30px;
    margin-left: -50px;
}

.FooterLinks {
    list-style: none;
    padding: 0;
    margin-bottom: 10px;
}

.FooterLinks li {
    display: inline-block;
    margin-right: 10px;
}

.FooterLinks li:last-child {
    margin-right: 0;
}

.FooterLinks a {
    color: #333;
    text-decoration: none;
    font-size: 14px;
}

.FooterDescription {
    color: #666;
    font-size: 12px;
}

.ContactItem {
    width: 250px;
    height: 40px;
    position: absolute;
    margin-right: 150px;
    right: 0;
}

.ContactTitle {
    width: 50px;
    height: 20px;
    text-align: right;
    color: #009591;
    font-size: 14px;
    font-family: Noto Sans KR;
    font-weight: 350;
    line-height: 10px; /* Increase line-height to add spacing */
    word-wrap: break-word;
    position: absolute;
    top: 2px;
    right: 30px;
}

.ContactNumber {
    width: 122.17px;
    height: 36px;
    text-align: right;
    color: #333333;
    font-size: 24px;
    font-family: Noto Sans KR;
    font-weight: 350;
    line-height: 24px;
    word-wrap: break-word;
    position: absolute;
    top: 19px;
}

.ContactNumber.Strong15881111 {
    left: 0;
    right: 30px;
}

.ContactSeparator {
    width: 9.12px;
    height: 36px;
    text-align: right;
    color: #DDDDDD;
    font-size: 24px;
    font-family: Noto Sans KR;
    font-weight: 350;
    line-height: 24px;
    word-wrap: break-word;
    position: absolute;
    top: 19px;
    left: 124.68px;
}

.ContactNumber.Strong15991111 {
    left: 105px;
}
</style>


<!-- 부트스트랩 연결 -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="header">
        <!-- 메뉴바 내용 -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <c:url var="logoUrl" value="/hanabank.jpg" />
                <a class="navbar-brand" href="mainHana.jsp"> <img
                    src="${logoUrl}" alt="로고" class="logo-img">
                </a>


                <div class="collapse navbar-collapse justify-content-center"
                    id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active"
                            aria-current="page" href="innerAccount.jsp">계좌조회</a></li>
                        <li class="nav-item"><a class="nav-link"
                            href="accountTransferInner.jsp">계좌이체</a></li>
                        <li class="nav-item"><a class="nav-link"
                            href="makeAccountSelect.jsp">계좌개설</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
                    </ul>

                </div>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search"
                        aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>

    </div>
    <hr class="navbar-divider">

    <div class="section1">

    <%
    MemberDTO dto = (MemberDTO)session.getAttribute("dto");
    out.println(dto.getName()+"님");
    %>


        <script>
            function showDetails(productType) {
                var table = document.getElementById("product-table");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) {
                    var row = rows[i];
                    var productTypeCell = row.cells[0];
                    if (productTypeCell.innerText === productType) {
                        row.style.display = "table-row";
                    } else {
                        row.style.display = "none";
                    }
                }
            }

            function showAll() {
                var table = document.getElementById("product-table");
                var rows = table.getElementsByTagName("tr");

                for (var i = 1; i < rows.length; i++) {
                    rows[i].style.display = "table-row";
                }
            }
        </script>

        <div class="title">계좌개설 / 상품목록</div>

        <ul class="product-buttons">
            <li><button onclick="showDetails('입출금상품')">입출금 상품</button></li>
            <li><button onclick="showDetails('예금적금상품')">예금적금 상품</button></li>
            <li><button onclick="showDetails('보험상품')">보험 상품</button></li>
            <li><button class="show-all-button" onclick="showAll()">전체
                    상품 보기</button></li>
        </ul>

<table id="product-table">
    <thead>
        <tr>
            <th>상품 종류</th>
            <th>세부 상품</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>입출금상품</td>
            <td><a href="#" onclick="passText(this, '입출금 상품 A')">입출금 상품 A</a></td>
        </tr>
        <tr>
            <td>입출금상품</td>
            <td><a href="#" onclick="passText(this, '입출금 상품 B')">입출금 상품 B</a></td>
        </tr>
        <tr>
            <td>예금적금상품</td>
            <td><a href="#" onclick="passText(this, '예금적금 상품 X')">예금적금 상품 X</a></td>
        </tr>
        <tr>
            <td>예금적금상품</td>
            <td><a href="#" onclick="passText(this, '예금적금 상품 Y')">예금적금 상품 Y</a></td>
        </tr>
        <tr>
            <td>보험상품</td>
            <td><a href="#" onclick="passText(this, '보험 상품 I')">보험 상품 I</a></td>
        </tr>
        <tr>
            <td>보험상품</td>
            <td><a href="#" onclick="passText(this, '보험 상품 II')">보험 상품 II</a></td>
        </tr>
    </tbody>
</table>

<script>
    function passText(element, text) {
        // 다음 페이지로 텍스트를 전달하는 방법 (예시)
        window.location.href = "/KakaoLoginTest/view/makeAccount.jsp?text=" + encodeURIComponent(text);
    }
</script>






    </div>

    <footer class="BankFooter">
        <div class="BankFooterContent">
            <ul class="FooterLinks">
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">보안정책</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
            <div class="ContactItem">
                <div class="ContactTitle">고객센터</div>
                <div class="ContactNumber Strong15881111">1588-1111</div>
                <div class="ContactSeparator">/</div>
                <div class="ContactNumber Strong15991111">1599-1111</div>
            </div>

            <p class="FooterDescription">하나은행오픈뱅킹입니다.</p>
        </div>

    </footer>

    <!-- 부트스트랩 JavaScript 연결 -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>