<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

wrap {
	display: grid;
	grid-template-rows: 50px auto;
	grid-template-areas: "logo" "main";
}

logo {
	grid-area: logo;
	width: 100%;
}

header img {
	width: 200px;
	height: 50px;
}

main {
	grid-area: main;
	width: 100%;
	height: 900px;
	display: flex;
	justify-content: center;
	/* 내부 요소들을 수평으로 가운데 정렬 */
}

main>div:first-child {
	margin-top: 500px;
	width: 300px;
}

main>div:nth-child(2) {
	width: 329px;
	margin-top: 200px;
}

main>div:nth-child(3) {
	width: 500px;
	margin-top: 50px;
}

main>div:nth-child(3) input, button {
	margin-top: 20px;
}

input {
	width: 400px;
	height: 60px;
	background-color: #EFFFF2;
	border: none;
	border-radius: 30px;
	padding: 0 20px;
	font-size: 18px;
	outline: none;
	/* 포커스 효과 제거 */
}

input::placeholder {
	color: #888;
	/* placeholder 텍스트 색상 */
}

input:focus {
	background-color: #D4F5E9;
	/* 포커스 시 배경색 변경 */
	border: 2px solid #48BB78;
	/* 포커스 시 테두리 스타일 변경 */
}

input[type="submit"], button {
	width: 200px;
	height: 40px;
	background-color: #48BB78;
	color: white;
	border: none;
	border-radius: 30px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
	background-color: #38A169;
}

button:hover {
	background-color: #38A169;
}
</style>
</head>

<body>
	<wrap> <header>
		<img src="./img/logo.png">
	</header>
	<main>
		<div>


			<h1>회원가입</h1>
			<h2>Wellness Road</h2>
			<br>
			<h3>이미 등록된 아이디가 있다면</h3>
			<h3>
				<b><a href="Login.jsp">여기를!</a></b> 누르세요!
			</h3>
		</div>
		<div>
			<img src="./img/loginpeople.png">
		</div>
		<div>
			<br> <br>
			<form action="JoinService" method="post" name="inputForm" onsubmit="return checkField();">
				<h1>회원가입</h1>
				<input type="text" name="mem_id" id="inputId" placeholder="Enter ID"> <br>
				<button type="button" id="inputID">ID Check</button>
				<span id="resultCheckID"></span><br> 
				
				<input type="text" name="mem_nick" id="inputNickA"
					placeholder="Enter NickName"> <br>
				<button type="button" id="inputNick">Nick Check</button>
				<span id="resultCheckNick"></span><br> 
				<input type="text" name="mem_email"
					placeholder="Enter Email" id="mem_email"> <br> 
				<input type="password" name="mem_pw" id="mem_pw" oninput="pwCheck()"placeholder="password"> <br>
				<input type="password" name="mem_pw_check" id="mem_pw_check" oninput="pwCheck()" placeholder="Confirm password"> 
				<br>
				<span id="pwConfirm"></span>
				<br> <input
					type="submit" class="join_submit" value="Join">
			</form>
		</div>
	</main>
	</wrap>
	<script src="assets/js/jquery.min.js"></script>
	
	
	
	
	<script>
	
	//null값 입력시 alert 출력
	function checkField(){
		let inputs = document.inputForm;
		if(!inputs.inputId.value){
			alert("아이디를 입력하세요");
			return false;
		}
		if(!inputs.inputNickA.value){
			alert("닉네임을 입력하세요")
			return false;
		}
		if(!inputs.mem_email.value){
			alert("이메일을 입력하세요")
			return false;
		}
		if(!inputs.mem_pw.value){
			alert("비밀번호를 입력하세요")
			return false;
		}
		if(!inputs.mem_pw_check.value){
			alert("비밀번호 확인란을 입력하세요")
			return false;
		}
		
	}
	
	
	
	
	
	
		
	// 아이디 중복체크
	$(document).ready(function() {
	    $('#inputID').click(function() {
	        var input_id = $('#inputId').val();
	        $.ajax({
	            url: "IdCheckService",
	            data: { "inputID": input_id },
	            type: 'get',
	            success: function(data) {
	                if (data == 'true') {
	                    $('#resultCheckID').text("사용할 수 없는 아이디").css('color','red');
	                } else if (data == 'false') {
	                    $('#resultCheckID').text("사용할 수 있는 아이디").css('color','green');
	                }
	            },
	            error: function() {
	                alert("통신실패");
	            }
	        });
	    });
	});

	//닉네임 중복체크
		$(document).ready(function() {
	    $('#inputNick').click(function() {
	        var input_nick = $('#inputNickA').val();
	        $.ajax({
	            url: "NickCheckService",
	            data: { "inputNick": input_nick },
	            type: 'get',
	            success: function(data) {
	                if (data == 'true') {
	                    $('#resultCheckNick').text("사용할 수 없는 닉네임").css('color','red');
	                } else if (data == 'false') {
	                    $('#resultCheckNick').text("사용할 수 있는 닉네임").css('color','green');
	                }
	            },
	            error: function() {
	                alert("통신실패");
	            }
	        });
	    });
	});
		
	//비밀번호 일치 체크 - 실시간 버전
	function pwCheck(){
		if($('#mem_pw').val()==$('#mem_pw_check').val()){
			$('#pwConfirm').text("비밀번호가 일치합니다").css('color','green')
		}else{
			$('#pwConfirm').text('비밀번호가 일치하지 않습니다.').css('color','red')			
		}
	}
		
	
	
	
	
	
		//비밀번호 일치 체크 -alert 버전
//		document
//				.querySelector('.join_submit')
//				.addEventListener(
//						"click",
//						function(e) {
//							var pwValue = document.querySelector("#mem_pw").value;
//							var pwValueCheck = document
//									.querySelector("#mem_pw_check").value;
//
	//						if (pwValue !== pwValueCheck) {
		//						alert("비밀번호가 일치하지 않습니다.");
			//					e.preventDefault(); // 폼 전송 중단
				//			}
					//	});
	</script>


</body>

</html>