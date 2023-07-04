<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 가입</title>

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="button"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }

        input[type="button"]:hover,
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>

    <script>
        function limitPhoneNumber() {
            var phoneNumberInput = document.getElementById('phone');
            var phoneNumber = phoneNumberInput.value;

            // 010으로 시작하지 않으면 010을 추가
            if (!phoneNumber.startsWith('010')) {
                phoneNumberInput.value = '010' + phoneNumber;
            }

            // 11자리가 넘으면 자르기
            if (phoneNumber.length > 11) {
                phoneNumberInput.value = phoneNumber.slice(0, 11);
            }
        }
    </script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 패스워드 체크
        let passwd = document.querySelector("#pw");
        let passwdck = document.querySelector("#pwck");

        let message = document.createElement("p");
        message.style.color = "green";
        message.style.fontWeight = "bold";

        // 메시지 엘리먼트를 추가
        passwdck.insertAdjacentElement('afterend', message);

        passwdck.addEventListener("input", function () {
            if (passwd.value === passwdck.value) {
                message.textContent = "비밀번호가 일치합니다.";
                document.querySelector('input[type="submit"]').disabled = false; // 비밀번호 일치 시 회원가입 버튼 활성화
            } else {
                message.textContent = "비밀번호가 일치하지 않습니다.";
                
            }
        });

        // 회원가입 요청(submit) 시 비밀번호 일치 여부 확인
        document.querySelector('form').addEventListener("submit", function (event) {
            if (passwd.value !== passwdck.value) {
                event.preventDefault(); // submit 동작 중지
                alert("비밀번호가 일치하지 않습니다."); // 비밀번호 불일치 시 알림창 표시
            }
        });
    });
    
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


</script>

</head>
<body>
<h1>회원 가입</h1>
<form action="join.do" method="post" onsubmit="return validateAddress();">

    <label for="name">이름:</label>
    <input type="text" name="name" id="name" placeholder="이름을 입력해주세요." required value="${param.name}">

    <label for="id">아이디:</label>
    <input type="text" name="id" id = "id" placeholder="아이디를 입력해주세요." required value="${param.id}">

    <label for="pw">비밀번호:</label>
    <input type="password" name="pw" id="pw" placeholder="영문 숫자로 구성하며 최소 4글자 이상 필요합니다." required value="${param.pw}">
    <label for="pwck">비밀번호 확인</label>
    <input type="password" name="pwck" id="pwck" required value="${param.pwck}">
    
    <label for="simplePw">간편 비밀번호</label>
    <input type="password" name="simplePw" id="simplePw" placeholder="간편 비밀번호 6자리를 입력해주세요."  required value="${param.simplePw}">
    
    <label for="personal_id">주민등록번호</label>
    <input type="text" name="personal_id" id="personal_id" placeholder="주민등록번호를 입력해주세요."  required value="${param.personal_id}">
    
    <label for="phone">전화번호:</label>
    <input type="text" id="phone" name="phone" oninput="limitPhoneNumber()" pattern="[0-9]{11}"
           placeholder="전화번호를 입력해주세요." required value="${param.phone}">

    <label for="address">주소:</label>
    <input type="text" id="sample6_postcode" name = "zipcode" placeholder="우편번호">
    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
    <br>
    <input type="text" id="sample6_address" name = "address" placeholder="주소">
    <br>
    <input type="text" id="sample6_detailAddress" name = "detailAddress" placeholder="상세주소">


    <label for="email">이메일:</label>
    <input type="email" name="email" placeholder="이메일을 입력해주세요." required value="${param.email}">
    <button type="submit" formaction="mail.do" name="sendMail">인증 메일 발송</button>
    <br />인증번호: <input type="text" name="verifyCode">
    <button type="button" onclick="checkCode()">코드 확인</button>
        &nbsp;&nbsp;
    <input type="submit" value="회원가입요청">
</form>
    <script>
        function checkCode() {
            var verifyCode = "${verifyCode}";
            var inputCode = document.querySelector('input[name="verifyCode"]').value;
            if (verifyCode === inputCode) {
                alert("인증 성공");
            } else {
                alert("인증번호가 일치하지 않습니다.");
            }
        }
    </script>
</body>
</html>