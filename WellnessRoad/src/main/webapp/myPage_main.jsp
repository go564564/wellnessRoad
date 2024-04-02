<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="mypage.css" />
</head>
<body>

	<%
	MembersDTO mem_info = (MembersDTO) session.getAttribute("mem_info");
	%>
<form action="UpdateService" method="post">
	<div class="div-wrapper">
		<div class="div">
			<div class="text-wrapper">회원정보 수정</div>
			<div class="text-wrapper-2">User ID</div>
			<div class="field">
				<input class="input" name="p_mem_pw" placeholder="현재 비밀번호"
					type="password" />
			</div>
		</div>
		<div class="field-2">
			<input id="n_mem_pw" placeholder="비밀번호 수정" name="n_mem_pw"
				type="password" oninput="pwCheck()" /> 
				<span id="pwConfirm"></span>
		</div>
		<div class="field-3">
			<input id="n_mem_pw_Check" placeholder="비밀번호 확인"
				name="n_mem_pw_Check" type="password" oninput="pwCheck()" />
		</div>
		<div class="rectangle"><%=mem_info.getMem_nick()%></div>
		<div class="btn">
			<input id="submit_btn" type="submit" value="수정">
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