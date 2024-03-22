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
				<b><a href="login.html">여기를!</a></b> 누르세요!
			</h3>
		</div>
		<div>
			<img src="./img/loginpeople.png">
		</div>
		<div>
			<br> <br>
			<form action="JoinService" method="post">
				<h1>회원가입</h1>
				<input type="text" name="mem_id" id="inputId" placeholder="Enter ID"> <br>
				<button type="button" id="inputID">ID Check</button>
				<span id="resultCheckID"></span><br> 
				<input type="text" name="mem_nick"
					placeholder="Enter NickName"> <br>
				<button type="button" id="inputNick">Nick Check</button>
				<span></span><br> <input type="text" name="mem_email"
					placeholder="Enter Email"> <br> <input type="password"
					name="mem_pw" id="mem_pw" placeholder="password"> <br>
				<input type="password" name="mem_pw_check" id="mem_pw_check"
					placeholder="Confirm password"> <br> <input
					type="submit" class="join_submit" value="Join">
			</form>
		</div>
	</main>
	</wrap>
	<script src="assets/js/jquery.min.js"></script>
	
	
	
	
	<script>
		
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
	                    $('#resultCheckID').text("사용할 수 없는 아이디");
	                } else if (data == 'false') {
	                    $('#resultCheckID').text("사용할 수 있는 아이디");
	                }
	            },
	            error: function() {
	                alert("통신실패");
	            }
	        });
	    });
	});
	
		
	
	//닉네임 중복체크
	
	
	
	
	
	
	
	
		//비밀번호 일치 체크
		document
				.querySelector('.join_submit')
				.addEventListener(
						"click",
						function(e) {
							var pwValue = document.querySelector("#mem_pw").value;
							var pwValueCheck = document
									.querySelector("#mem_pw_check").value;

							if (pwValue !== pwValueCheck) {
								alert("비밀번호가 일치하지 않습니다.");
								e.preventDefault(); // 폼 전송 중단
							}
						});
	</script>


</body>

</html>