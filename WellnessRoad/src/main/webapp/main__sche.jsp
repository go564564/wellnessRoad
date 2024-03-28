<%@page import="com.smhrd.model.MembersDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.TripsDAO"%>
<%@page import="com.smhrd.model.TripsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.TripScheDAO"%>
<%@page import="com.smhrd.model.TripScheDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

#topMenu {
	width: 100%;
	height: 100px;
	background-image: url("./img/back.jpg");
}

#menuContainer {
	width: 100%;
	height: 50px;
	display: flex;
	flex-wrap: nowrap;
	margin: auto;
	padding-top: 25px;
}

#logo {
	width: 200px;
	height: 50px;
}

.menu {
	width: 200px;
	height: 50px;
	display: inline-block;
	line-height: 50px; /* 텍스트 수직 가운데 정렬을 위한 줄 높이 조절 */
	text-align: center;
	font-family: "Bagel Fat One", system-ui;
	color: white;
	font-size: 25px;
}

.menu:hover {
	text-decoration: underline;
}

#main {
	width: 100%;
	height: 800px;
	background-color: #FEFBF6;
	text-align: center;
	font-family: "Sunflower", sans-serif;
	font-weight: 300;
	font-style: normal;
	color: #333;
	font-size: 20px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #b0ff61;
}

.dropbtn {
	width: 5rem;
	height: 2rem;
	text-align: center;
	line-height: 2rem;
	margin-top: 1rem;
	margin-left: 1rem;
	border-radius: 1rem;
	background-color: #e8ffd1;
}

.dayContainer {
	height: 150px;
	display: flex;
	margin-left: 3rem;
}

.img img {
	height: 4rem;
	width: 4rem;
	border-radius: 10%;
	margin-top: 0.5rem;
	box-shadow: 0.2rem 0.2rem 0.4rem #D0D0D0;
	margin: auto;
}

.img {
	display: flex; /* 내부 요소들을 행으로 표시하기 위해 */
	flex-direction: column;
	width: 5rem;
	height: 6rem;
	border-radius: 1rem;
	box-shadow: 0.2rem 0.2rem 0.4rem #D0D0D0;
	border-style: solid;
	border-width: 1px;
	border-color: #D0D0D0;
}

.separator {
	width: 1rem;
	height: 3px; /* 선의 높이 설정 */
	background-color: #D0D0D0; /* 선의 색상 설정 */
	margin-top: 3rem; /* 선 위쪽 여백 설정 */
}

.name {
	font-size: 0.5rem;
	text-align: center;
	line-height: 1.5rem;
	overflow: hidden; /* 텍스트가 넘칠 때 숨김 */
	white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
	text-overflow: ellipsis; /* 텍스트가 넘칠 때 생략 부호 (...) 표시 */
}

.name:hover {
	overflow: visible; /* 마우스를 올리면 텍스트가 다시 보이도록 함 */
}

.day {
	line-height: 6rem;
	margin-right: 1rem;
}
</style>
</head>
<body>
	<%
	// TripSchedules 테이블 정보를 담아놓은 객체
	TripScheDTO dto = new TripScheDTO();
	TripScheDAO dao = new TripScheDAO();
	ArrayList<TripScheDTO> list = new ArrayList<TripScheDTO>();
	list = dao.all_info();
	%>
	<%
	// TRIPS 테이블 정보를 담아놓은 객체
	TripsDTO tdto = new TripsDTO();
	TripsDAO tdao = new TripsDAO();
	ArrayList<TripsDTO> triplist = new ArrayList<>();
	triplist = tdao.iwanttoseetripsname();
	%>
	<div id="topMenu">
		<div id="menuContainer">
			<a href=""><img src="img/logo.JPG" alt="" id="logo" /></a>
			<ul>
				<li class="menu">혼자 여행하기</li>
				<li class="menu">여럿이 여행하기</li>
				<li class="menu">게시판</li>
			</ul>
		</div>
	</div>

	<div id="schedule"></div>
	<div id="day"></div>

	<div class="dropdown">
		<div class="dropbtn" name="schedule">일정선택</div>
		<div class="dropdown-content">
			<a href="#"><%=triplist.get(0).getTrip_name()%></a>
			 <a href="#">링크2</a> <a href="#">링크 3</a>
		</div>
	</div>
	<!-- N일차별 데이터 나열 -->
	<div class="dayContainer">
		<div class="day"><%=list.get(0).getSche_day()%></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
	</div>

	<div class="dayContainer">
		<div class="day">1일차</div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹ</div>
		</div>
		<div class="separator"></div>
		<div class="img">
			<img src="./img/1.jpg" class="imgUrl">
			<div class="name">ㅇㄹㄴㅇㄹsdfefwe</div>
		</div>
	</div>


	<script>
		
	</script>
</body>
</html>
