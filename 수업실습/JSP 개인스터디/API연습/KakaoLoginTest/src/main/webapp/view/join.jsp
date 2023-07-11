<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

input[type="text"], input[type="password"], input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
}

input[type="button"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	font-size: 14px;
	border: none;
	cursor: pointer;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #45a049;
}

/* 주민등록번호 입력란 스타일 */
.personal-id-input {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.personal-id-input input[type="text"] {
	flex: 1;
	padding: 10px;
	margin-right: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
	text-align: center;
}

.personal-id-input span {
	font-size: 18px; /* 조정된 사이즈로 변경 */
	margin-right: 5px; /* 간격 조정 */
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
        
        function limitSimplePw(input) {
            // 입력 값에서 숫자만 추출
            var digits = input.value.replace(/\D/g, '');

            // 6자리 숫자로 제한
            digits = digits.substr(0, 6);

            // 입력 필드에 결과 값 반영
            input.value = digits;
        }

        function limitPersonalId(input) {
            // 입력 값에서 숫자만 추출
            var digits = input.value.replace(/\D/g, '');

            // 13자리 숫자로 제한
            if (digits.length > 13) {
                digits = digits.substr(0, 13);
            }
            // 입력 필드에 결과 값 반영
            input.value = digits;
        }
    </script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    
    
    function validatePersonalId() {
        var personalId1 = document.getElementById('personal_id_1').value;
        var personalId2 = document.getElementById('personal_id_2').value;

        // 각 입력 필드의 길이를 확인
        if (personalId1.length !== 6 || personalId2.length !== 7) {
            alert("주민등록번호를 다시 입력해주세요.");
            return false;
        }

        // 숫자로 이루어진지 확인
        var numericRegex = /^[0-9]+$/;
        if (!personalId1.match(numericRegex) || !personalId2.match(numericRegex)) {
            alert("주민등록번호는 숫자로만 입력해야 합니다.");
            return false;
        }

        // 여기에 추가적인 유효성 검사 규칙을 추가할 수 있습니다.

        return true;
    }
    
    /*
    function validatePersonalId(){
        var personalIdInput = document.getElementById('personal_id');
        if( personalIdInput.value.length !== 14){
           alert("주민등록번호를 다시 입력해주세요."); // 주민등록번호가 13자리가 아닐 경우 알림 메시지 표시
           return false;
        }
        return true;
     }*/
     
     function validateSimplePw(){
        var simplePwInput = document.getElementById('simplePw');
        if(simplePwInput.value.length !== 6){
           alert("간편 비밀번호를 다시 입력해주세요."); // 간편 비밀번호가 6자리가 아닐 경우 알림 메시지 표시
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
    
    // 추가 
/*     function checkFormEmailCode() {
    // 추가적인 유효성 검사 규칙을 여기에 작성합니다.
    // 이메일 인증번호를 입력하지 않았을 때 폼 제출이 안되도록 검사합니다.
    var verifyCodeInput = document.querySelector('input[name="verifyCode"]');
    if (verifyCodeInput.value.trim() === '') {
        alert("인증번호를 입력해주세요.");
        return false;
    }

    // 이메일 인증이 완료되었는지 확인합니다.
    if (verifyCodeInput.value.trim() === '' || verifyCode !== inputCode ) {
        alert("이메일 인증이 완료되지 않았습니다.");
        return false;
    }

    // 인증번호가 일치하는지 확인합니다.
    var verifyCode = "${verifyCode}";
    var inputCode = verifyCodeInput.value.trim();
    if (verifyCode !== inputCode) {
        alert("인증번호가 일치하지 않습니다.");
        return false;
    }

    return true;
}
 */

    
</script>

<script>
  var idCk = false;
  function checkDuplicateId() {
    var id = document.getElementById("id").value; // 입력된 아이디 가져오기
    
    // AJAX 요청 수행
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "checkId.member", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    console.log("readyState:", xhr.readyState, "status:", xhr.status);
    xhr.onreadystatechange = function() {
    	  console.log("readyState:", xhr.readyState, "status:", xhr.status);
    	  if (xhr.readyState === 4) {
    	    if (xhr.status === 200) {
    	      var response = xhr.responseText; // AJAX 응답 받기
    	     
    	      var ckResult = response === "true"; // 중복 결과에 따라 ckResult 설정

        // ckResult 값에 따른 로직 처리
        if (ckResult) {
          idCk = true;
/*           document.getElementById("id").disabled = true;
          document.getElementById("id").readOnly = true;
          document.getElementById("id").style.backgroundColor = "#f0f0f0";
          document.querySelector("button[type='button']").disabled = true; */
          
          alert("아이디 사용이 가능합니다.")
        } else {
          alert("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
        }
      }
    } else {
        console.log('Error:', xhr.status, xhr.statusText); // 추가된 에러 메시지
      }
    }
  
    xhr.send("id=" + encodeURIComponent(id)); // 요청 전달 데이터 설정
  }
  
  
  
  function validateId() {
	   // var idField = document.getElementById("id");
	   // var idButton = document.querySelector("button[type='button']");
	    
	    if (idCk) {
	      return true;
	    } else {
	    	alert("아이디 중복체크가 필요합니다.")
	      return false;
	    }
	  }
</script>
<script>
    var verifyCode = ""; // 인증 코드를 저장할 변수

    function sendMail() {
      alert("인증번호가 발송되었습니다.")  	
      var email = document.querySelector("input[name='email']").value; // 이메일 값 가져오기
      console.log(email);
      // 인증 메일 발송 동작 수행
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "mail.member", true);
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          verifyCode = xhr.responseText; // AJAX 응답 받기
          console.log(xhr.responseText);
          // 인증 코드를 받은 후에 다른 처리를 수행
          // 예: 화면에 인증 코드 입력 필드를 표시하거나, 인증 코드를 이용한 추가 동작 수행 등
        }
      };
      xhr.send("email=" + encodeURIComponent(email));

      // 인증 코드를 받은 후의 동작을 여기에 추가
    }
    var codeCk = false;
    function checkCode() {
        var inputCode = document.querySelector('input[name="verifyCode"]').value;
        if (verifyCode === inputCode) {
            alert("인증 성공");
            codeCk = true; // codeCk를 지역 변수로 변경
        } else {
            alert("인증번호가 일치하지 않습니다.");
            codeCk = false; // codeCk를 지역 변수로 변경
        }
        return codeCk; // codeCk 값을 반환
    }
    
    function validateEmail() {
    	if (codeCk) {
          return true;
        } else {
            alert("메일 인증이 필요합니다.")
          return false;
        }
      }
</script> 
</head>
<body>
	<h1>회원 가입</h1>
    <% String message = (String)session.getAttribute("message"); %>

<script>
    console.log('message:', '<%= message %>');
    console.log('typeof message:', typeof '<%= message %>');
</script>
    <%
        session.invalidate();
    %>
    <script>
        var message = '<%= message %>';
        if (message !== 'null' && message !== '') {
            alert(message);
        }
    </script>
	<form action="join.member" method="post"
        onsubmit="return validateId() && validatePersonalId() && validateSimplePw() && validateAddress() && validateEmail()">
		<label for="name">이름:</label>
	    <input type="text" name="name" id="name" placeholder="이름을 입력해주세요." required value="${param.name}"> 
	    <label for="id">아이디:</label> 
	    <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." required value="${param.id}">
		<button type="button" onclick="checkDuplicateId()">중복 확인</button>
		<label for="pw">비밀번호:</label> 
		<input type="password" name="pw" id="pw" placeholder="영문 숫자로 구성하며 최소 4글자 이상 필요합니다." required value="${param.pw}"> 
		<label for="pwck">비밀번호 확인</label> 
		<input type="password" name="pwck" id="pwck" required value="${param.pwck}">
		<label for="simplePw">간편 비밀번호</label> <input type="password" name="simplePw" id="simplePw" placeholder="간편 비밀번호 6자리를 입력해주세요." required value="${param.simplePw}" oninput="limitSimplePw(this)"
			maxlength="6"> 
		<label for="personal_id">주민등록번호</label>
		<div class="personal-id-input">
			<input type="text" name="personal_id_1" id="personal_id_1"
				placeholder="6자리" required maxlength="6"
				oninput="limitPersonalId(this)"> <span>-</span> <input
				type="text" name="personal_id_2" id="personal_id_2"
				placeholder="7자리" required maxlength="7"
				oninput="limitPersonalId(this)">
		</div>

		<label for="phone">전화번호:</label> <input type="text" id="phone"
			name="phone" oninput="limitPhoneNumber()" pattern="[0-9]{11}"
			placeholder="전화번호를 입력해주세요." required value="${param.phone}">

		<label for="address">주소:</label> <input type="text"
			id="sample6_postcode" name="zipcode" placeholder="우편번호"> <input
			type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		<br> <input type="text" id="sample6_address" name="address"
			placeholder="주소"> <br> <input type="text"
			id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">

		<label for="email">이메일:</label> <input type="email" name="email"
			placeholder="이메일을 입력해주세요." required value="${param.email}">
		<!-- <button type="submit" formaction="mail.do" name="sendMail">인증
			메일 발송</button>
			 -->
	    <button type="button" onclick="sendMail()">인증 메일 발송</button>		 
		<br />인증번호: <input type="text" name="verifyCode">
		<button type="button" onclick="checkCode()">코드 확인</button>
		&nbsp;&nbsp; <input type="submit" value="회원가입요청">
		
	</form>
    <a href="/KakaoLoginTest/view/main.jsp">메인으로</a>
</body>
    <!-- 부트스트랩 JavaScript 연결 -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</html>
