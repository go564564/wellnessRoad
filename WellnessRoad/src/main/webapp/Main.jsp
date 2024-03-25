<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Main.css" />

<!-- Boot strap css 모달창 크기조절필요해서 가져옴 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Data ra -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/moment/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>


</head>
<body>
	<div id="container">

		<%
		MembersDTO mem_info = (MembersDTO) session.getAttribute("mem_info");
		%>

		<header>
			<div></div>
			<div id="menu">
				<div id="leftMenu">
					<a href=""><img src="./img/logo.png" id="logoImg"></a>



					<!-- 테스트중 -->
					<div class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModal">여행 계획하기</div>
					
					
					<div>게시판</div>
				</div>
				<div id="rightMenu">
					<%
					if (mem_info == null) {
					%>
					<div onclick="location.href='Login.jsp';">로그인</div>
					<div onclick="location.href='register.jsp'">회원가입</div>
					<%
					} else {
					%>
					<div>마이페이지</div>
					<div onclick="location.href='LogoutService';">로그아웃</div>
					<%
					}
					%>
				</div>

			</div>
			<div id="logo">
				<h1>Wellness</h1>
				<h3>Trip Planner</h3>
			</div>
		</header>
		<main>
			<div>
				<img src="./img/main_sample2.jpg">
				<img src="./img/고흥 이미지/거금생태숲_1_공공3유형.jpg">
			</div>
		</main>
		<footer>
			<div>
				<h4>Wellness Road</h4>
				<h5>건강한 전남여행</h5>
				<h5>행복한 전남여행</h5>
				<h5>즐거운 전남여행</h5>
			</div>
		</footer>
	</div>








			<!-- 모달창인데 테스트중 -->
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" style="max-width: 90vw; max-height: 90vh" role="document">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">새로운 일정 만들기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- Modal Body -->
				<div class="modal-body" style="max-width: 90%; overflow-y: auto;">
					<div class="form-group" >
						<label for="travelTitle">여행 제목:</label> <input type="text"
							class="form-control" id="travelTitle">
					</div>
					<div class="form-group">
						<label for="travelPeriod">여행 기간:</label> <input type="text"
							class="form-control" id="travelPeriod">
							
					</div>
					
				</div>
				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>










	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>