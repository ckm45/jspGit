<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>서비스 사용을 위한 추가 정보</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.userSelectedType === 'R' ? data.roadAddress : data.jibunAddress;
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }

        function validatePersonalId() {
            var personalId1 = document.getElementById('personal_id_1').value;
            var personalId2 = document.getElementById('personal_id_2').value;

            if (personalId1.length !== 6 || personalId2.length !== 7) {
                alert("주민등록번호를 다시 입력해주세요.");
                return false;
            }

            var numericRegex = /^[0-9]+$/;
            if (!personalId1.match(numericRegex) || !personalId2.match(numericRegex)) {
                alert("주민등록번호는 숫자로만 입력해야 합니다.");
                return false;
            }

            return true;
        }

        function validateSimplePw() {
            var simplePwInput = document.getElementById('simplePw');
            if (simplePwInput.value.length !== 6) {
                alert("간편 비밀번호를 다시 입력해주세요.");
                return false;
            }

            return true;
        }

        function validateAddress() {
            var postcodeInput = document.getElementById('sample6_postcode');
            var addressInput = document.getElementById('sample6_address');
            var detailAddressInput = document.getElementById('sample6_detailAddress');
            if (postcodeInput.value.trim() === '' || addressInput.value.trim() === '' || detailAddressInput.value.trim() === '') {
                alert('주소를 모두 입력해주세요.');
                return false;
            }
            return true;
        }

        function limitPhoneNumber() {
            var phoneNumberInput = document.getElementById('phone');
            var phoneNumber = phoneNumberInput.value;
            if (!phoneNumber.startsWith('010')) {
                phoneNumberInput.value = '010' + phoneNumber;
            }
            if (phoneNumber.length > 11) {
                phoneNumberInput.value = phoneNumber.slice(0, 11);
            }
        }

        function limitSimplePw(input) {
            var digits = input.value.replace(/\D/g, '');
            digits = digits.substr(0, 6);
            input.value = digits;
        }

        function limitPersonalId(input) {
            var digits = input.value.replace(/\D/g, '');
            if (digits.length > 13) {
                digits = digits.substr(0, 13);
            }
            input.value = digits;
        }
    </script>
    <style>
        label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 200px;
            height: 25px;
            margin-top: 5px;
        }

        input[type="submit"] {
            margin-top: 20px;
            width: 100px;
            height: 30px;
        }

        .personal-id-input {
            margin-top: 5px;
        }

        .address-input {
            margin-top: 10px;
        }

        .address-input input[type="button"] {
            margin-top: 5px;
            width: 100px;
            height: 25px;
        }
    </style>
</head>
<body>
    <h1>서비스 사용을 위한 추가 정보</h1>

    <form action="kakaoJoin.do" method="post" onsubmit="return validatePersonalId() && validateSimplePw() && validateAddress()">
        <label for="simplePw">간편 비밀번호:</label>
        <input type="password" name="simplePw" id="simplePw" placeholder="간편 비밀번호 6자리를 입력해주세요." required value="${param.simplePw}" maxlength="6">
        
        <label for="personal_id">주민등록번호:</label>
        <div class="personal-id-input">
            <input type="text" name="personal_id_1" id="personal_id_1" placeholder="6자리" required maxlength="6" oninput="limitPersonalId(this)">
            <span>-</span>
            <input type="text" name="personal_id_2" id="personal_id_2" placeholder="7자리" required maxlength="7" oninput="limitPersonalId(this)">
        </div>
        
        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" pattern="[0-9]{11}" placeholder="전화번호를 입력해주세요." required value="${param.phone}" oninput="limitPhoneNumber()">
        
        <label for="address">주소:</label>
        <div class="address-input">
            <input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호">
            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
            <br>
            <input type="text" id="sample6_address" name="address" placeholder="주소">
            <br>
            <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
        </div>
        <input type="hidden" name="kakaoId" value="<%= session.getAttribute("kakaoId") %>"> <!-- 카카오 아이디 가져오기 -->
        <input type="submit" value="회원가입요청">
    </form>
    <a href="main.jsp">메인으로 가기</a>
</body>
</html>
