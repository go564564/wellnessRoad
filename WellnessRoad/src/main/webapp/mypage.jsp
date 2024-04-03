<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="mypage.css" />
<title>마이페이지</title>
</head>
<body>
	
	
	<%
	MembersDTO mem_info = (MembersDTO) session.getAttribute("mem_info");
	%>
	<form action="UpdateService" method="post">
	<div class="div-wrapper">
		<div class="div">
			<div class="overlap">
				<div class="text-wrapper">회원 정보 수정</div>
				<div class="top">
					<div class="description-top">프로필 사진</div>
				</div>
			</div>
			<div class="frame">
				<div class="frame-2">
					<div class="user-thumb">
						<img class="img" src="#" />
					</div>
					<div class="frame-3">
						<button class="button">
							<div class="text-container">
								<div class="button-text">프로필 사진 교체</div>
							</div>
						</button>
						<div class="text-wrapper-2">사진 지우기</div>
					</div>
				</div>
				<div class="frame-4">
					<div class="description-top-2">Image requirments:</div>
					<p class="p">
						Min.&nbsp;&nbsp;400 x 400px<br />Max. 2MB<br />
					</p>
				</div>
			</div>
			<div class="description-top-wrapper">
				<div class="description-top">
					User Details :
					<%=mem_info.getMem_id()%></div>
			</div>
			
			<div class="field-2">
				<input class="input" placeholder="현재 비밀번호" name="p_mem_pw" type="password" />
			</div>
			<div class="field-6">
				<input id="n_mem_pw" placeholder="비밀번호 수정" name="n_mem_pw" type="password"  oninput="pwCheck()" />
				<span id="pwConfirm" width="500px" ></span>
			</div>		
			<div class="field-7">
				<input id="n_mem_pw_Check" placeholder="비밀번호 확인" name="n_mem_pw_Check"type="password"  oninput="pwCheck()" />
				<br>
				<input type="submit" value="제출">
			</div>
			
			<div>
				
				
				
				
			</div>

		</div>
	</div>

</form>



	<script src="assets/js/jquery.min.js"></script>
<script>

function pwCheck(){
	if($('#n_mem_pw').val()==$('#n_mem_pw_Check').val()){
		$('#pwConfirm').text("비밀번호가 일치합니다").css('color','green')
	}else{
		$('#pwConfirm').text('비밀번호가 일치하지 않습니다.').css('color','red')			
	}
}

</script>
	
	
</body>
</html>