<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.smhrd.model.LinkDataDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

html {
	scroll-behavior: smooth;
}

#topMenu {
	width: 100%;
	height: 100px;
	background-image: url("./img/back.jpg");
	display: grid;
	grid-template-columns: 1fr 20fr 1fr;
	grid-template-rows: 1fr 3fr 1fr;
	grid-template-areas: ". . ." ". main ." ". . .";
}

#menuContainer {
	grid-area: main;
	height: 50px;
	background-color: rgba(255,255,255,0.5);;
	display: flex;
	justify-content: space-between;	
}

#topLeftMenu{	
	height:50px;
	 display: flex;
    align-items: center; /* 세로 중앙 정렬 */     
}
#toprightMenu{
	height:50px;
	 display: flex;
    align-items: center; /* 세로 중앙 정렬 */    
}


#logo {
	width: 200px;
	height: 50px;
}

.menu{
	width:200px;
	font-size: 23px;
	/* 글자 크기를 20px로 변경 */
	color: #333;
	font-family: inherit;
	font-weight: 800;
	cursor: pointer;
	position: relative;
	border: none;
	background: none;
	text-transform: uppercase;
	transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
	transition-duration: 400ms;
	transition-property: color;
	text-align:center;
	line-height:50px;
}

.menu:focus,
.menu:hover {
	color: #222;
}

.menu:focus:after,
.menu:hover:after {
	width: 100%;
	left: 0%;
}

.menu:after {
	content: "";
	pointer-events: none;
	bottom: 5px;
	left: 50%;
	position: absolute;
	width: 0%;
	height: 4px;
	background-color: #96E9C6;
	transition-timing-function: cubic-bezier(0.25, 0.8, 0.25, 1);
	transition-duration: 400ms;
	transition-property: width, left;
}



#main {
	width: 100%;
	height: calc(100vh - 100px);
	display: flex;
}

#leftMenu {
	width: 50%;
	margin: auto;
}

#map {
	width: 50%;
	height: 95%;
	margin-top: 10px;
	margin: auto;
}

#schedule {
	width: 97%;
	height: 400px;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	grid-template-rows: 200px 200px;
	column-gap: 10px;
	text-align: center;
	padding: 10px
}

#schedule img {
	cursor: pointer;
	display: block;
	width: 100%;
	height: 130px;
	border-radius: 20px 20px 0px 0px;
	transition: transform 0.5s ease;
	border-color: #AEAEAE;
	border-style: solid;
	border-width: thin;
	border-bottom: none; /* 아래쪽 선 없애기 */
	box-shadow: 2px 0px 4px #80BCBD;
}

#schedule img:hover {
	filter: brightness(0.5);
}

#schedule button {
	cursor: pointer;
}

.more,.insert {
	border: solid 0.5px #AEAEAE;
	background-color: whitesmoke;
	border-radius: 7px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	text-align: center;
	font-size: 15px;
	paddin: 0;
	vertical-align: middle;
}

.more:hover,.insert:hover {
	background-color: #1b273f;
	box-shadow: 0px 15px 20px rgba(27, 39, 63, 0.4);
	color: whitesmoke;
	transform: translateY(-5px);
}


.name {
	width: 100%;
	max-width: 100%;
	height: 30px;
	border-radius: 0px 0px 20px 20px;
	border-color: #AEAEAE;
	border-style: solid;
	border-width: thin;
	font-size: 14px;
	line-height: 30px;
	border-top: none;
	overflow: hidden;
	/*white-space: nowrap;  가로로만 텍스트 표시 */
    text-overflow: ellipsis; /* 글자가 너무 길 경우 ...으로 대체 */
	box-shadow: 2px 2px 4px #80BCBD;
	margin-bottom: 5px
}

.name:hover {
    overflow: visible;
    white-space: nowrap;
    text-overflow: clip; /* 텍스트가 요소의 영역을 벗어나면 잘림 처리하지 않음 */
}

#day {
	width: 99%;
	height: 90px;
	text-align: center;
}

#buttonsContainer {
	width: 99%;
	height: 50px;
	text-align: center;
}

#buttonsContainer>button {
	cursor: pointer;
	width: 30px;
	height: 30px;
	color: black;
	margin: 0 auto;
	border: solid 1px #AEAEAE;
	background-color: whitesmoke;
	border-radius: 5px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
}

#buttonsContainer>button:hover {
	background-color: #1b273f;
	box-shadow: 0px 15px 20px rgba(27, 39, 63, 0.4);
	color: whitesmoke;
	transform: translateY(-5px);
}

#prev, #next {
	cursor: pointer;
	width: 200px;
	height: 50px;
	color: black;
	margin: 0 auto;
	border: solid 1px #AEAEAE;
	background-color: whitesmoke;
	border-radius: 5px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
}

#prev:hover, #next:hover {
	background-color: #1b273f;
	box-shadow: 0px 15px 20px rgba(27, 39, 63, 0.4);
	color: whitesmoke;
	transform: translateY(-5px);
}

#swapBtn, #saveBtn, #deleteDayBtn {
	cursor: pointer;
	width: 130px;
	height: 40px;
	color: black;
	border: solid 1px #AEAEAE;
	background-color: whitesmoke;
	border-radius: 5px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
}

#swapBtn:hover, #saveBtn:hover, #deleteDayBtn:hover {
	background-color: #1b273f;
	box-shadow: 0px 15px 20px rgba(27, 39, 63, 0.4);
	color: whitesmoke;
	transform: translateY(-5px);
}

#modal {
	position: fixed;
	top: 50%; /* 화면 세로 중앙 */
	left: 50%; /* 화면 가로 중앙 */
	transform: translate(-50%, -50%); /* 가운데 정렬 */
	width: 600px;
	height: 700px;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	z-index: 101; /* 배경보다 위에 위치 */
	display: none;
}

#modalImgDiv {
	text-align: center;
}

#modalImg {
	width: 40%;
	height: 20%;
	border-radius: 30px;
	box-shadow: 2px 2px 4px black;
}

#modal>div {
	font-size: 17px;
}

.modalBtn {
	width: 150px;
	height: 30px;	
	color: black;
	border: solid 0.5px #AEAEAE;
	background-color: whitesmoke;
	border-radius: 5px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	text-align: center;
	font-size: 18px;
	paddin: 0;
	vertical-align: middle;
}
.modalBtn:hover{
	background-color: #1b273f;
	box-shadow: 0px 15px 20px rgba(27, 39, 63, 0.4);
	color: whitesmoke;
	transform: translateY(-5px);
}

.draggable {
	cursor: move;
	margin-bottom: 1rem;
	user-select: none;
	border-radius: 3rem;
	display: flex;
	height: 8rem;
	width: 80rem;
	border: 1px solid #cbd5e0;
	position: relative;
}

.listDelete {
	cursor: pointer;
	margin-left: 1rem;
	margin-bottom: 1rem;
	user-select: none;
	border-radius: 3rem;
	height: 8rem;
	width: 8rem;
	border: 1px solid #cbd5e0;
	position: relative;
	text-align: center;
	line-height: 8rem;
}

.listDelete:hover {
	background-color: gray;
}

.placeholder {
	background-color: #edf2f7;
	border: 2px dashed #cbd5e0;
	margin-bottom: 1rem;
}

.dragImg {
	width: 9rem;
	height: 6rem;
	pointer-events: none;
	justify-content: flex-start;
	margin-left: 3rem;
	margin-top: 1rem;
	border-radius: 2rem;
	box-shadow: 3px 3px 3px #262626
}

#detail {    /* 모달영역 디테일 */
	margin-top: 1rem;
	height: 150px; /* 예시로 200px로 설정 */
    /* 오버플로우가 발생하면 스크롤바가 표시됩니다. */
    overflow: auto;
}

.detail {
	pointer-events: none;
	margin-left: 3rem;
	margin-top: 1rem;
}  /* 드래그영역 디테일 */


.detail {
	margin-top: 1rem;
	height: 150px; /* 예시로 200px로 설정 */
    /* 오버플로우가 발생하면 스크롤바가 표시됩니다. */
    overflow: auto;
}

#swapBtnContainer {
	width: 100%;
	height: 4rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

#swapBtn, #saveBtn, #deleteDayBtn {
	width: 10rem;
	height: 2.5rem;
	text-align: center;
	line-height: 2.5rem;
	margin-left: 1rem;
}

#swapBtnContainer>a,#topBtnContainer>a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 기본 색상 상속 */
}

#modalName {
	text-align: center;
}

#listBoxContainer {
	display: flex;
	justify-content: center;
}

#tag {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 60px;
}

#select {
	width: 300px;
	height: 45px;
	border: solid 0.5px #AEAEAE;
	vertical-align: middle;
	border-radius:1rem;
}

#tagForm button {
	width: 150px;
	height: 45px;
	color: black;
	border: solid 0.5px #AEAEAE;
	background-color: whitesmoke;
	border-radius: 5px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	text-align: center;
	font-size: 18px;
	paddin: 0;
	vertical-align: middle;
}

#tagForm button:hover {
	background-color: #1b273f;
	box-shadow: 0px 15px 20px rgba(27, 39, 63, 0.4);
	color: whitesmoke;
	transform: translateY(-5px);
}
#scheduleName{
text-align: center;
}
#topBtnContainer{
width: 100%;
height:5rem;
display: flex;
justify-content: center;
	align-items: center;
}
#topBtn{
cursor:pointer;
	width: 600px;
	height: 50px;
	line-height:50px;
	color: black;
	border: solid 0.5px #AEAEAE;
	background-color: whitesmoke;
	border-radius: 5px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	text-align: center;
	font-size: 18px;
	paddin: 0;
	vertical-align: middle;
}
#topBtn:hover{
background-color: #1b273f;
	box-shadow: 0px 15px 20px rgba(27, 39, 63, 0.4);
	color: whitesmoke;
	transform: translateY(-5px);
}

#weather img{
weight:20px;
height:20px;
}
#weather{
font-size:16px;
}

a{
color: inherit;
text-decoration: none;
}



</style>
</head>
<body>


	<div id="topMenu">
		<div id="menuContainer">
			
			<div id="topLeftMenu">
				<img src="./img/logo.png" alt="로고" id="logo" />
				
					<div class="menu"><a href="Main.jsp">메인메뉴</a></div>
					<div class="menu"><a href="viewAll.jsp">여행계획보기</a></div>
					<div class="menu"><a href="">준비물</a></div>
					
				</div>
			
			<div id="ropRightMenu">
				<div class="menu"><a href="">로그아웃</a></div>
			</div>
			
		</div>
	</div>
	
	<%
	// 서블릿에서 전달된 데이터 받기
	LinkDataDTO linkdata = (LinkDataDTO)request.getAttribute("linkData");
	%>
	
	<% 
	String startDateStr = linkdata.getSt_dt();
    String endDateStr = linkdata.getEd_dt();
    
    System.out.println(linkdata.getSt_dt());
    System.out.println(linkdata.getEd_dt());
    
    
    // Date format (adjust according to your input format)
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    
    // Parse strings to LocalDate objects
    LocalDate startDate = LocalDate.parse(startDateStr, formatter);
    LocalDate endDate = LocalDate.parse(endDateStr, formatter);
    
    String startDateString = startDate.toString();
    
    
    // Calculate the difference between dates
    long daysDifference = ChronoUnit.DAYS.between(startDate, endDate)+1;
    int[] pageArray=linkdata.getData_count();
	        
    boolean weatherSwitch=false;
    
    // 3일부터 10일사이에 값이 있으면 데이터 계산
   // 현재 날짜에서 3일과 10일을 더한 날짜를 구함
    LocalDate today = LocalDate.now();
	LocalDate threeDaysLater = today.plusDays(3);
	LocalDate tenDaysLater = today.plusDays(10);

// 시작일과 종료일이 현재 날짜로부터 3일보다 모두 전에 있거나, 현재 날짜로부터 10일보다 모두 후에 있을 때 조건을 만족하는지 확인
	weatherSwitch = !(startDate.isBefore(threeDaysLater) & endDate.isBefore(threeDaysLater)) ||
                    !(startDate.isAfter(tenDaysLater) & endDate.isAfter(tenDaysLater));
	
	 	
	 // 시작 인덱스를 구해보자
	 long startIndex = startDate.isBefore(threeDaysLater) ? ChronoUnit.DAYS.between(threeDaysLater, startDate) : -ChronoUnit.DAYS.between(threeDaysLater, startDate);
	 
	 System.out.println(startIndex);
	 
	%>


	<%
	int[] javaArray=linkdata.getData_count();
	// JavaScript 배열에 자바 배열의 값을 담기 위한 코드 작성
	out.print("<script>");
	out.print("var javaScriptArray = [");
	for (int i = 0; i < javaArray.length; i++) {
	    out.print(javaArray[i]);
	    if (i < javaArray.length - 1) {
	        out.print(",");
	    }
	}
	out.print("];");
	out.print("</script>");
	%>
	
	
	
	<div id="main">
		<div id="leftMenu">
			<div id="scheduleName">
				<h3><%=linkdata.getTrip_name() %></h3>
			</div>
			<div id="day">
				<br>
				<h3>
					<span id="prev">◀</span>&nbsp;<span id="days">1일차</span>&nbsp;</span><span
						id="date"><%=startDate%></span>&nbsp;<span id="next">▶</span>
				</h3> 
				<div id="weather"></div>
			</div>

			<div id="tag">
				<form action="" id="tagForm">
					<select name="url" id="select">
						<option value="모두보기">모두보기</option>
						<option value="영광,장성">영광,장성</option>
						<option value="함평,무안,나주">함평,무안,나주</option>
						<option value="신안,목포,영암">신안,목포,영암</option>
						<option value="진도,해남,완도">진도,해남,완도</option>
						<option value="장흥,화순">장흥,화순</option>
						<option value="담양,곡성">담양,곡성</option>
						<option value="보성,순천,고흥">보성,순천,고흥</option>
						<option value="여수">여수</option>
						<option value="광양,구례">광양,구례</option>
						<option value="관광">관광</option>
						<option value="바다">바다</option>
						<option value="자연">자연</option>
						<option value="치유의 숲">치유의 숲</option>
						<option value="휴양림">휴양림</option>
						<option value="힐링">힐링</option>
					</select>
					<button type="button" id="tagBtn">가져오기</button>
				</form>
			</div>


			<div id="schedule">

				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="0">
					<div class="name" data-index="0"></div>
					<button class="more" data-index="0">자세히</button>
					<button class="insert" data-index="0">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="1">
					<div class="name" data-index="1"></div>
					<button class="more" data-index="1">자세히</button>
					<button class="insert" data-index="1">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="2">
					<div class="name" data-index="2"></div>
					<button class="more" data-index="2">자세히</button>
					<button class="insert" data-index="2">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="3">
					<div class="name" data-index="3"></div>
					<button class="more" data-index="3">자세히</button>
					<button class="insert" data-index="3">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="4">
					<div class="name" data-index="4"></div>
					<button class="more" data-index="4">자세히</button>
					<button class="insert" data-index="4">추가</button>
				</div>


				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="5">
					<div class="name" data-index="5"></div>
					<button class="more" data-index="5">자세히</button>
					<button class="insert" data-index="5">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="6">
					<div class="name" data-index="6"></div>
					<button class="more" data-index="6">자세히</button>
					<button class="insert" data-index="6">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="7">
					<div class="name" data-index="7"></div>
					<button class="more" data-index="7">자세히</button>
					<button class="insert" data-index="7">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="8">
					<div class="name" data-index="8"></div>
					<button class="more" data-index="8">자세히</button>
					<button class="insert" data-index="8">추가</button>
				</div>
				<div>
					<img src="./img/back_image.jpg" class="img" alt="" data-index="9">
					<div class="name" data-index="9"></div>
					<button class="more" data-index="9">자세히</button>
					<button class="insert" data-index="9">추가</button>
				</div>




			</div>
			<div id="buttonsContainer">
				<button id="prevBtn">&lt;</button>
				<!-- 이전 범위로 이동하는 버튼 -->
				<!-- 버튼 10개 생성 -->
				<button class="btn">1</button>
				<button class="btn">2</button>
				<button class="btn">3</button>
				<button class="btn">4</button>
				<button class="btn">5</button>
				<button class="btn">6</button>
				<button class="btn">7</button>
				<button class="btn">8</button>
				<button class="btn">9</button>
				<button class="btn">10</button>

				<button id="nextBtn">&gt;</button>
				<!-- 다음 범위로 이동하는 버튼 -->
			</div>
			<div id="swapBtnContainer">


				<a href="#section2"><div id="swapBtn">순서바꾸기</div></a>
				<div id="saveBtn">저장하기</div>
				<div id="deleteDayBtn">일차 지우기</div>


			</div>
		</div>

		<div id="map"></div>


	</div>

	<!-- 일차변경 -->
	<div id="section2"></div>
	<div id="topBtnContainer">
		<a href="#topMenu"><div id="topBtn">여행지 추가하기</div></a>			
	</div>

	<!-- 순서변경 -->
	<div id="listBoxContainer">
		<div
			style="align-items: center; display: flex; justify-content: center;">
			<div id="list"></div>
		</div>
		<div id="delList"></div>
	</div>
	<div id="modal">
		<h3 id="modalName"></h3>
		<br>
		<div id="modalImgDiv">
			<img src="" id="modalImg">
		</div>
		<br> ▶ 주소 :
		<div id="modal_addr"></div>
		▶ 운영시간 :
		<div id="modal_time"></div>
		▶ 주차시설 :
		<div id="modal_car"></div>
		▶ 쉬는날 :
		<div id="modal_rest"></div>
		<div id="detail"></div>
		<br>
		<button id="modalClose" class="modalBtn">닫기</button>
		<button id="modalInsert" class="modalBtn">추가하기</button>
	</div>	
	
	




	<!-- 맵 만들고 플랫폼 등록 필요 사이트 도메인 http://localhost:8081 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	9a9c35383dda876efdaa7d2c5d708933"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

		<script>
	
	document.addEventListener('DOMContentLoaded', function() {
	
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div

            mapOption = {
                center: new kakao.maps.LatLng(34.7980900, 126.7809294), // 지도의 중심좌표
                level: 10
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

       
        
        // 마커 스왑
		function swapMarkers() {
            
        	// 모든 마커 삭제   
            markers.forEach(markerData => {
			    markerData.marker.setMap(null); // 지도에서 마커 제거
			    markerData.infoWindow.close(); // 인포윈도우 닫기
			});                     
            
            

            // 남은 마커들 다시 표시  
            
          markers.forEach((markerData, index) => {
                
                    const markerPosition = new kakao.maps.LatLng(markerData.object.poi_lat,markerData.object.poi_lng );
                    const marker = new kakao.maps.Marker({
                        position: markerPosition
                    });

                    // 마커를 지도에 추가
                    marker.setMap(map);						
                    
                    // 인포윈도우 생성
                    const infoWindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:8px 0;">' + (index+1)+markerData.object.poi_name + '</div>'
                    });

                    // 인포윈도우를 지도에 표시
                    infoWindow.open(map, marker);
					
                    // 클릭 이벤트 추가
                    addClickEvent(marker, markerData.id);

                    // 마커 정보를 markers 배열에 추가
                    markers[index] = {
                            id: markerData.id,
                            marker: marker,
                            infoWindow: infoWindow,
                            object: markerData.object // 기존 object 속성 유지
                        };  
                 	
                    // 화면 다시 이동  
                    setCenter(markerData.object.poi_lat,markerData.object.poi_lng);
                    
                    panTo(markerData.object.poi_lat,markerData.object.poi_lng);
                    
                    
            }); 
        }
        
        
        
        
        function removeMarkerById(id) {
                    	       	
        	// 인덱스 id 를 찾아서 마커스에서 id에 해당하는 마커스 인덱스 찾기
        	const index = markers.findIndex(marker => marker.id === id);
        	
        	// 인덱스에 해당하는 아래쪽 박스 제거
        	removeBox(index);
        	delList.removeChild(delList.lastElementChild);
        	
        	// 모든 마커 삭제   
            markers.forEach(markerData => {
			    markerData.marker.setMap(null); // 지도에서 마커 제거
			    markerData.infoWindow.close(); // 인포윈도우 닫기
			});                     
            
            markers = markers.filter(markerData => markerData.id !== id);

            // 남은 마커들 다시 표시
          	  markers.forEach((markerData, index) => {
                
                    const markerPosition = new kakao.maps.LatLng(markerData.object.poi_lat,markerData.object.poi_lng );
                    const marker = new kakao.maps.Marker({
                        position: markerPosition
                    });

                    // 마커를 지도에 추가
                    marker.setMap(map);						
                    
                    // 인포윈도우 생성
                    const infoWindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:8px 0;">' + (index+1)+markerData.object.poi_name + '</div>'
                    });

                    // 인포윈도우를 지도에 표시
                    infoWindow.open(map, marker);
					
                    // 클릭 이벤트 추가
                    addClickEvent(marker, markerData.id);

                    // 마커 정보를 markers 배열에 추가
                    markers[index] = {
                            id: markerData.id,
                            marker: marker,
                            infoWindow: infoWindow,
                            object: markerData.object // 기존 object 속성 유지
                        };
                    
                 // 화면 다시 이동  
                  setCenter(markerData.object.poi_lat,markerData.object.poi_lng);
                  
                  panTo(markerData.object.poi_lat,markerData.object.poi_lng);
                    
                
            });           
    
            array = array.filter(element => element.poi_idx !== id);  
                    
            
        }
 

        function LocationObject(id, name, latitude, longitude) {
            this.id = id;
            this.name = name;
            this.latitude = latitude;
            this.longitude = longitude;
        };

        function markerObject(id, marker, infoWindow) {
            this.id = id;
            this.marker = marker;
            this.infoWindow = infoWindow;
        };

        // var obj;
        
        let locations;
        // locations = [];
        

        // db 연결 ajax
        function fetchData(num) {
        	
        $.ajax({
			url : "poiGet",
			data : {"num":num,
					"tag":currentTag	
			},			
			// 넘겨받는 값 gson -> json dataType
			dataType : "json",
			success:function(data){
				// res : 서블릿에서 반환받은 데이터
			        useObj(data);
				
			},
			error:function(){			
			}
		})		
        }
        
        
        
        function useObj(data) {
            if ($(`.img[data-index='9']`).css('visibility') === 'hidden') {
                $("[class='insert']").css('visibility', 'visible');
                $("[class='more']").css('visibility', 'visible');
                $("[class='img']").css('visibility', 'visible');
                $("[class='name']").css('visibility', 'visible');
            }

            names = document.querySelectorAll(".name");
            imgs = document.querySelectorAll(".img");
            
            locations = [];
        	for(var i =0;i<data.length;i++){        	
            locations.push(data[i]);
        	}
            
            if (data.length === 10) {
                for (var i = 0; i < data.length; i++) {
                    names[i].innerText = data[i].poi_name;
                    imgs[i].src = data[i].poi_img;
                }
            } else {
                for (var i = 0; i < 10; i++) {
                    if (i < data.length) {
                        names[i].innerText = data[i].poi_name;
                        imgs[i].src = data[i].poi_img;
                    } else {
                        names[i].innerText = "";
                        imgs[i].src = "./img/back_image.jpg";
                    }
                }
                
                // 데이터가 없는 경우 처리
                for (var i = data.length; i < 10; i++) {
                    $(`.insert[data-index='${i}']`).css('visibility', 'hidden');
                    $(`.more[data-index='${i}']`).css('visibility', 'hidden');
                    $(`.img[data-index='${i}']`).css('visibility', 'hidden');
                    $(`.name[data-index='${i}']`).css('visibility', 'hidden');
                }
            }
        } // 오브젝트 처리 끝

        function setCenter(latitude, longitude) {
            // 이동할 위도 경도 위치를 생성합니다 
            var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
            // 지도 중심을 이동 시킵니다
            map.setCenter(moveLatLon);
        }

        function panTo(latitude, longitude) {
            // 이동할 위도 경도 위치를 생성합니다 
            var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
            // 지도 중심을 부드럽게 이동시킵니다
            // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
            map.panTo(moveLatLon);

        }



        let array = []; // 객체저장

        let markers = []; // id 마커 객체 저장 
        
        //확인없이 바로 마커찍기
        function addMarkerId(selectedObject) {  
            
            const markerPosition = new kakao.maps.LatLng(selectedObject.poi_lat, selectedObject.poi_lng);
            const marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커를 지도에 추가
            marker.setMap(map);

            const indexPoi = array.indexOf(selectedObject);
            
            // 인포윈도우 생성
            const infoWindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:8px 0;">' +(indexPoi+1)+selectedObject.poi_name + '</div>'
            });

            // 인포윈도우를 지도에 표시
            infoWindow.open(map, marker);
            
            markers.push({ id: selectedObject.poi_idx, marker: marker, infoWindow: infoWindow ,object:selectedObject});
            
            addClickEvent(marker,selectedObject.poi_idx);   //마커에 클릭이벤트 추가
            
           
            
        }
        
        
        // 처음에 갱신하는 마커
        function addMarkerFirst(selectedObject) {            
            
            array.push(selectedObject);
            // 새로운 마커 추가
            
            // 아래 박스추가
            addBox(selectedObject);
            
            const markerPosition = new kakao.maps.LatLng(selectedObject.poi_lat, selectedObject.poi_lng);
            const marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커를 지도에 추가
            marker.setMap(map);

            const indexPoi = array.indexOf(selectedObject);
            console.log("indexPoi:"+indexPoi);
            // 인포윈도우 생성
            const infoWindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:8px 0;">' +(indexPoi+1)+selectedObject.poi_name + '</div>'
            });

            // 인포윈도우를 지도에 표시
            infoWindow.open(map, marker);
            
            markers.push({ id: selectedObject.poi_idx, marker: marker, infoWindow: infoWindow ,object:selectedObject});
            
            addClickEvent(marker,selectedObject.poi_idx);   //마커에 클릭이벤트 추가
            
            setCenter(selectedObject.poi_lat,selectedObject.poi_lng);
            
            panTo(selectedObject.poi_lat,selectedObject.poi_lng);
            
            
        }
        
        
        
        
        
        
        

        function addMarkerWithId(selectedObject) {
            // 이미 추가되어 있는지 확인
            
             const existingPoi = array.find(obj => obj.poi_idx === selectedObject.poi_idx);
			    if (existingPoi) {
			        return; // 이미 해당 id를 가진 마커가 있다면 중복 추가하지 않음
			    }
            array.push(selectedObject);
            // 새로운 마커 추가
            
            // 아래 박스추가
            addBox(selectedObject);
            
            const markerPosition = new kakao.maps.LatLng(selectedObject.poi_lat, selectedObject.poi_lng);
            const marker = new kakao.maps.Marker({
                position: markerPosition
            });

            // 마커를 지도에 추가
            marker.setMap(map);

            const indexPoi = array.indexOf(selectedObject);
            
            // 인포윈도우 생성
            const infoWindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:8px 0;">' +(indexPoi+1)+selectedObject.poi_name + '</div>'
            });

            // 인포윈도우를 지도에 표시
            infoWindow.open(map, marker);
            
            markers.push({ id: selectedObject.poi_idx, marker: marker, infoWindow: infoWindow ,object:selectedObject});
            
            addClickEvent(marker,selectedObject.poi_idx);   //마커에 클릭이벤트 추가
            
            
            
        }

        // 이미지들의 NodeList를 가져옴
        var btns = document.querySelectorAll('.insert');

        btns.forEach(function (btn) {
            btn.addEventListener('click', function () {

                var objectIndex = parseInt(btn.dataset.index);
                var selectedObject = locations[objectIndex];               

                setCenter(selectedObject.poi_lat, selectedObject.poi_lng);  // 선택된 위치에 중심 이동
                panTo(selectedObject.poi_lat, selectedObject.poi_lng);   // 선택된 위치에 화면 이동

                addMarkerWithId(selectedObject); // 새로운 마커 추가				
                
               
                
                
            });
        });

        // 마커를 클릭하여 삭제하는 함수
        function addClickEvent(marker, id) {
            kakao.maps.event.addListener(marker, 'click', function () {
                
            	removeMarkerById(id); // 해당 ID를 가진 마커 제거
               
            });
        }
                
        // 일차 만들기
        
        // 각 요소에 대한 참조를 가져옵니다.
		var prevButton = document.getElementById('prev');
		var nextButton = document.getElementById('next');
		var daysElement = document.getElementById('days');
		var dateElement = document.getElementById('date');
		
		// 현재 일차와 시작 날짜를 설정합니다.
		var currentDay = 1; // 현재 일차

		var startDate = new Date('<%= startDateString %>');

		// 시작일을 기준으로 현재 날짜를 설정합니다.
		var currentDate = new Date(startDate.getTime());
		currentDate.setDate(currentDate.getDate());

		// 이전 버튼에 클릭 이벤트 핸들러를 추가합니다.
		prevButton.addEventListener('click', function() {
		    if (currentDay > 1) {
		    	idxSave(currentDay);
		    	currentDay--;
		        currentDate.setDate(currentDate.getDate() - 1);
		        updateDayAndDate();
		        getData(currentDay);
		        
		        weatherIndex=weatherIndex-2;
		        if(weatherSwitchJs){
		        	displayWeather(weatherIndex);
		        }
		        
		    }
		});

		// 다음 버튼에 클릭 이벤트 핸들러를 추가합니다.
		nextButton.addEventListener('click', function() {
			if (currentDay < <%=daysDifference%>) {
			idxSave(currentDay);	
		    currentDay++;
		    currentDate.setDate(currentDate.getDate() + 1);
		    updateDayAndDate();
		    getData(currentDay);
		    //임시 저장
		    
		    weatherIndex=weatherIndex+2;
	        if(weatherSwitchJs){
	        	displayWeather(weatherIndex);
	        }
		    
	        
			}
		});
		
		// 일차와 날짜를 업데이트하는 함수를 정의합니다.
		function updateDayAndDate() {
			
		    daysElement.textContent = currentDay + '일차';
		    dateElement.textContent = currentDate.getFullYear() + '-' + ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' + ('0' + currentDate.getDate()).slice(-2);
		}

		
		
		
		
		
		const saveBtn = document.getElementById('saveBtn');

	    // 버튼에 클릭 이벤트를 추가합니다.
	   	saveBtn.addEventListener('click', function() {
    	// 현재 날짜를 가지고 idxSave 함수 호출
    	idxSave(currentDay);
    	
    	
		});
		
	   	const deleteDayBtn = document.getElementById('deleteDayBtn');
		
	   	
	    // 버튼에 클릭 이벤트를 추가합니다.
	   	deleteDayBtn.addEventListener('click', function() {
    	
	   		markers.forEach(markerData => {
			    markerData.marker.setMap(null); // 지도에서 마커 제거
			    markerData.infoWindow.close(); // 인포윈도우 닫기
			}); 
			
	        list.innerHTML = '';
			delList.innerHTML = '';
	        
			markers=[];
			array=[];
	   		
			idxDelete(currentDay);
			
	   		
		});
		
		
		// 여행지 페이징 간단구현
		
		var start = 1; // 시작 번호
    	var end = 10;  // 끝 번호
    	
    	//태그폼 만드는 중
        var currentTag="모두보기";
        var pageLimit = (javaScriptArray[0]%10==0) ? javaScriptArray[0]/10 : javaScriptArray[0]/10+1;;
        
        
        fetchData(start);
    	
    	
	    // 이전 버튼 클릭 이벤트 핸들러
	    $("#prevBtn").click(function() {
	        if (start > 1) {
	            start -= 10;
	            end -= 10;
	            updateButtons();
	            fetchData(start)
	        }
	    });
    
	    // 다음 버튼 클릭 이벤트 핸들러
	    $("#nextBtn").click(function() {
	        if (end < pageLimit) { // 총 28까지만 표시
	            start += 10;
	            end += 10;
	            updateButtons();
	            fetchData(start)
	        }
	    });
    
    
    // 버튼 클릭 이벤트 핸들러
	$(".btn").click(function() {
	    var btnText = $(this).text().trim();
	    if (!isNaN(btnText)) { // 숫자인 경우에만 호출
	        var btnNum = parseInt(btnText);
	        fetchData(btnNum);
	    }
	});
    
    // 버튼 업데이트 함수
    function updateButtons() {
        $(".btn").each(function(index) {
            // 각 버튼에 번호를 설정합니다. 단, 28까지만 표시합니다.
            var num = start + index;
            if (num <= pageLimit) {
                $(this).text(num);
            } else {
                $(this).text("-");
            }
        });
    }
	
    // 태그 이벤트 핸들러
    
            document.getElementById("tagBtn").addEventListener("click", function(event) {
            
            console.log(javaScriptArray)          
        	
            currentTag = document.getElementById("select").value;
            currentSelectTag = document.getElementById("select");
        	var selectedIndex = currentSelectTag.selectedIndex;
        	
        	
        	pageLimit = (javaScriptArray[selectedIndex]%10==0) ? javaScriptArray[selectedIndex]/10 : javaScriptArray[selectedIndex]/10+1;
        	
        	start = 1;
        	updateButtons();
        	
            fetchData(1);
            
            console.log(pageLimit);
            console.log(selectedIndex);
        }); 
    
    
 	// "more" 버튼 클릭 이벤트 핸들러 등록
    $(".more").click(function() {
        const index = $(this).data("index"); // 클릭한 버튼의 인덱스 가져오기
        showModalWithData(index); // 해당 인덱스의 데이터를 가지고 모달 표시
    });
   	    
    $(".img").click(function() {
        const index = $(this).data("index"); // 클릭한 버튼의 인덱스 가져오기
        showModalWithData(index); // 해당 인덱스의 데이터를 가지고 모달 표시
    });
 	
 	// "more" 버튼을 클릭했을 때 모달창을 표시하고 데이터를 표시하는 함수
    function showModalWithData(index) {
        // index에 해당하는 위치 데이터 가져오기
        const locationData = locations[index];
        
        // 모달에 데이터 표시
        $("#modalName").text(locationData.poi_name); // 모달 타이틀에 이름 표시
        $("#modal_addr").text(locationData.poi_addr); // 모달 내용에 추가 정보 표시
        $("#modal_time").text(locationData.poi_available); // 모달 내용에 추가 정보 표시
        $("#modal_car").text(locationData.poi_parking); // 모달 내용에 추가 정보 표시        
        $("#modal_rest").text(locationData.poi_closeDay);
        $("#detail").text(locationData.poi_info); // 모달 내용에 추가 정보 표시
       
        document.getElementById("modalImg").src = locationData.poi_img;
        
        // 모달 창 표시
        var modal = document.getElementById('modal');
        modal.style.display = 'block';
        
        const modalInsert = document.getElementById('modalInsert');
        modalInsert.addEventListener('click', function() {
        	
            var selectedObject = locations[index];               

            setCenter(selectedObject.poi_lat, selectedObject.poi_lng);  // 선택된 위치에 중심 이동
            panTo(selectedObject.poi_lat, selectedObject.poi_lng);   // 선택된 위치에 화면 이동

            addMarkerWithId(selectedObject); // 새로운 마커 추가	
            modal.style.display = 'none';
        	
        });
        
    }
 	
    const modalCloseBtn = document.getElementById('modalClose');
    modalCloseBtn.addEventListener('click', function() {
      // 모달 창 숨기기
      modal.style.display = 'none';
    });
 	
    
 // 순서변경 js
 	
 	let startIndex; // 마우스 다운 이벤트에서 선택된 요소의 인덱스
	let endIndex; // 마우스 업 이벤트에서 완료된 요소의 인덱스
 
    const list = document.getElementById('list');
    const delList = document.getElementById('delList');

    let draggingEle;
    let placeholder;
    let isDraggingStarted = false;

    // 마우스 위치값을 위해 선언
    let x = 0;
    let y = 0;

    // 스크롤된 상태에서 드래그 요소의 위치를 계산하는 함수
    const getDragPosition = function(e) {
        const rect = draggingEle.getBoundingClientRect();
        const posX = e.pageX - x;
        const posY = e.pageY - y + window.pageYOffset; // 스크롤 위치를 고려하여 y 위치 계산
        return { x: posX, y: posY };
    };

    // 노드의 위치를 바꾸는 함수
    const swap = function(nodeA, nodeB){
        const parentA = nodeA.parentNode;
        const siblingA = nodeA.nextSibling === nodeB ? nodeA : nodeA.nextSibling;

        nodeB.parentNode.insertBefore(nodeA,nodeB);
        parentA.insertBefore(nodeB,siblingA);
    };

    const isAbove = function(nodeA, nodeB){
        const rectA = nodeA.getBoundingClientRect();
        const rectB = nodeB.getBoundingClientRect();
        return rectA.top + rectA.height/2 < rectB.top + rectB.height /2 ;
    };

    const mouseDownHandler = function(e){
        draggingEle = e.target;
        const rect = draggingEle.getBoundingClientRect();
        x = e.pageX - rect.left;
        y = e.pageY - rect.top;
		
        startIndex = Array.from(list.children).indexOf(e.target);
        
        document.addEventListener('mousemove',mouseMoveHandler);
        document.addEventListener('mouseup',mouseUpHandler);
        
    };

    const mouseMoveHandler = function(e){
        const draggingRect = draggingEle.getBoundingClientRect();
        if(!isDraggingStarted){
            isDraggingStarted = true;
            placeholder = document.createElement('div');
            placeholder.classList.add('placeholder');
            draggingEle.parentNode.insertBefore(placeholder,draggingEle.nextSibling);
            placeholder.style.height = `${draggingRect.height}px`;
        }

        const { x: posX, y: posY } = getDragPosition(e);

        draggingEle.style.position = 'absolute';
        draggingEle.style.top = `${posY}px`;
        draggingEle.style.left = `${posX}px`;

        const prevEle = draggingEle.previousElementSibling;
        const nextEle = placeholder.nextElementSibling;

        if(prevEle && isAbove(draggingEle,prevEle)){
            swap(placeholder, draggingEle);
            swap(placeholder, prevEle);
            return;
        }

        if(nextEle && isAbove(nextEle,draggingEle)){
            swap(nextEle,placeholder);
            swap(nextEle,draggingEle);
        }
    };

    const mouseUpHandler = function(e){
        placeholder && placeholder.parentNode.removeChild(placeholder);
        draggingEle.style.removeProperty('top');
        draggingEle.style.removeProperty('left');
        draggingEle.style.removeProperty('position');
        x=null;
        y=null;
        draggingEle = null;
        isDraggingStarted = false;
        document.removeEventListener('mousemove',mouseMoveHandler);
        document.removeEventListener('mouseup',mouseUpHandler);  
        
        endIndex = Array.from(list.children).indexOf(e.target);
        
        if(startIndex!=endIndex){
        
        swapMarkerData(startIndex,endIndex);
        };
    };

    // 실제 데이터 스왑
    
	const swapMarkerData = function(indexA, indexB) {    	
        	
		const movedMarker = markers.splice(indexA, 1)[0]; // indexA 위치의 요소를 추출하여 저장
		markers.splice(indexB, 0, movedMarker); // indexB 위치에 추출한 요소를 삽입

		const movedArrayElement = array.splice(indexA, 1)[0]; // indexA 위치의 요소를 추출하여 저장
		array.splice(indexB, 0, movedArrayElement); // indexB 위치에 추출한 요소를 삽입

		swapMarkers();  
    
	};
    
    
    function addBox(selectPoi) {
        const newDiv = document.createElement('div');
        newDiv.classList.add('draggable');

        const newImg = document.createElement('img');
        newImg.src = selectPoi.poi_img;
        newImg.classList.add('dragImg');

        const newSpan = document.createElement('span');
        newSpan.classList.add('detail');
        newSpan.innerHTML = selectPoi.poi_name + "<br>" + "운영시간 : " + selectPoi.poi_available + "<br>주차시설 : " + selectPoi.poi_parking + "<br>쉬는날:" + selectPoi.poi_closeDay;

        newDiv.appendChild(newImg);
        newDiv.appendChild(newSpan);

        list.appendChild(newDiv);

        // 새로 추가된 요소에 드래그 앤 드롭 이벤트를 추가합니다.
        newDiv.addEventListener('mousedown', function(e) {
            mouseDownHandler(e);
        });
		
        // --------- 삭제버튼추가-----
        var deleteButton = document.createElement('div');
        deleteButton.textContent = '삭제';
        deleteButton.classList.add('listDelete'); // 클래스 이름을 문자열로 전달

        delList.appendChild(deleteButton);

        deleteButton.addEventListener('click', function() {
            // 삭제 버튼이 속한 부모 요소인 div(delList)의 자식들 중에서 삭제 버튼의 index를 찾습니다.
            const index = Array.from(delList.children).indexOf(deleteButton);
            // markers 배열에서 해당 인덱스의 요소를 찾아서 removeMarkerById 함수를 호출합니다.
            removeMarkerById(markers[index].id);
            
        });
        
        
    }
	
    function removeBox(index) {
        const divToRemove = list.children[index];
        list.removeChild(divToRemove);
    }

  
    
   
    
    [].slice.call(list.querySelectorAll('.draggable')).forEach(function (item) {
        item.addEventListener('mousedown', mouseDownHandler);
    });
    
    function idxDelete(num){ 
        // 저장 프로세스 현재 몇일차로 저장
     	    	
        let trip_idx=<%=linkdata.getTrip_idx()%>;
        day = num; 
     	    	
            $.ajax({
    			url : "deletePoi",
    			data : {"id": trip_idx,
    					"day":day,
    				},	
    			success:function(res){
    				
    				// res : 서블릿에서 반환받은 데이터			        
    				if(res>0){
    				alert(num+"일차 데이터가 삭제되었습니다.");
    				}
    			
    			},
    			error:function(){			
    			}
    		});	
        };   //저장 끝
    
    
    
    
    
    
 	// 저장 프로세스 현재 몇일차로 저장
    function idxSave(num){ 
    // 저장 프로세스 현재 몇일차로 저장
 	    	
    let trip_idx=<%=linkdata.getTrip_idx()%>;
    day = num; 
    
    // array에서 id만 추출
    var idxArray = array.map(item => item.poi_idx);

 	// 배열을 텍스트로 변환하여 구분자로 합치기
	var text = idxArray.join(',');
    
	if (idxArray.length===0) {
		idxDelete(num)
		return;
	} //저장할것 없으면 그냥 종료 
 	
        $.ajax({
			url : "insertPoi",
			data : {"id": trip_idx,
					"day":day,
					"schedule":text
				},	
			success:function(res){
				
				// res : 서블릿에서 반환받은 데이터			        
				if(res>0){
				alert(num+"일차 데이터가 저장되었습니다.");
				}
			
			},
			error:function(){			
			}
		});	
    };   //저장 끝
    
    
    // 1일차 데이터 가져오기   데이터 가져오기
    getData(1)
    
    function getData(num){ 
	    	
        let trip_idx=<%=linkdata.getTrip_idx()%>;
        day = num;                   
       
        markers.forEach(markerData => {
		    markerData.marker.setMap(null); // 지도에서 마커 제거
		    markerData.infoWindow.close(); // 인포윈도우 닫기
		}); 
		
        list.innerHTML = '';
		delList.innerHTML = '';
        
		markers=[];
		array=[];
        
		console.log(array);
		console.log(markers);
		
		
                
            $.ajax({
    			url : "getData",
    			data : {"id": trip_idx,
    					"day":day,
    				},	
    			dataType : "json",
    			success:function(res){ 
    				
    				// res : 서블릿에서 반환받은 데이터			        
    				if(res!=null){   
    					    					
    					
    					for (let i = 0; i < res.length; i++) {
    						addMarkerFirst(res[i]);
    					}
    					
    					}
    					
    				
    			},
    			error:function(){			
    			}
    		});	
        };    //데이터 가져오기
    	
        var weatherSwitchJs = <%=weatherSwitch%>;
        var weatherIndex=0;
        
        // 날짜가 3~10사이에 있으면 데이터 가져오기  
  		if(weatherSwitchJs){
                  			
  		weatherIndex = (<%=startIndex%>)*2;
                        
        // 날씨 데이터 가져오기
        var weatherData; // 전역 변수로 선언

        var xhr = new XMLHttpRequest();
        var url = 'http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst'; /*URL*/

        // 오늘 날짜의 0600 생성
        var currentDateWeather = new Date();
        var formattedDate = currentDateWeather.getFullYear().toString() + 
                             ('0' + (currentDateWeather.getMonth() + 1)).slice(-2) + 
                             ('0' + currentDateWeather.getDate()).slice(-2) + 
                             '0600';

        var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'V2jLg68b4QzcHu0yBsyBNO0Xb%2Bw0LsLWrYhYCt2tyWrC83zm7gpkN%2FAIYHMJa%2FkMQutUWfnXcO2dPLDC1dUSfg%3D%3D'; /*Service Key*/
        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('20'); /**/
        queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
        queryParams += '&' + encodeURIComponent('regId') + '=' + encodeURIComponent('11F20000'); /**/
        queryParams += '&' + encodeURIComponent('tmFc') + '=' + encodeURIComponent(formattedDate); /**/
        xhr.open('GET', url + queryParams);
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var responseData = JSON.parse(this.responseText);
                var item = responseData.response.body.items.item[0]; // 첫 번째 item 객체 선택
                var weatherArray = []; // 데이터를 저장할 배열 생성
                
                // "wf3Am"부터 "wf10"까지의 값을 배열에 추가
                for (var i = 3; i <= 7; i++) {
                    var wfAm = 'wf' + i + 'Am';
                    var wfPm = 'wf' + i + 'Pm';
                    var weather = item[wfAm];
                    weatherArray.push(weather);
                    var weather = item[wfPm];
                    weatherArray.push(weather);
                }
                for (var i = 8; i <= 10; i++) {
                    var wf = 'wf' + i
                    var weather = item[wf];
                    weatherArray.push(weather);
                    weatherArray.push(weather);
                }
                
                // 전역 변수에 배열 할당
                weatherData = weatherArray;
        		                               
               
		        	displayWeather(weatherIndex);     
               

              
              }                
                
            }
        
		xhr.send('');

  		} // 날씨 if 문 끝
        
        function displayWeather(index) {
            // 오전과 오후 날씨에 따라 이미지를 지정하여 출력
            var weatherImageAm, weatherImagePm;
            switch (weatherData[index]) {
                case '맑음':
                    weatherImageAm = './img/sun.png';
                    break;
                case '구름많음':
                    weatherImageAm = './img/cloud.png';
                    break;
                case '구름많고 비':
                    weatherImageAm = './img/littlerain.png';
                    break;
                case '구름많고 비/눈':
                    weatherImageAm = './img/NB22.png';
                    break;
                case '구름많고 소나기':
                    weatherImageAm = './img/rain.png';
                    break;
                case '흐림':
                    weatherImageAm = './img/cloud.png';
                    break;
                case '흐리고 비':
                    weatherImageAm = './img/littlerain.png';
                    break;
                case '흐리고 눈':
                    weatherImageAm = './img/snow.png';
                    break;
                case '비/눈':
                    weatherImageAm = './img/rainsnow.png';
                    break;
                case '소나기':
                    weatherImageAm = './img/rain.png';
                    break;
                default:
            }
            
            switch (weatherData[index+1]) {
                case '맑음':
                    weatherImagePm = './img/sun.png';
                    break;
                case '구름많음':
                    weatherImagePm = './img/cloud.png';
                    break;
                case '구름많고 비':
                    weatherImagePm = './img/littlerain.png';
                    break;
                case '구름많고 비/눈':
                    weatherImagePm = './img/NB22.png';
                    break;
                case '구름많고 소나기':
                    weatherImagePm = './img/rain.png';
                    break;
                case '흐림':
                    weatherImagePm = './img/cloud.png';
                    break;
                case '흐리고 비':
                    weatherImagePm = './img/littlerain.png';
                    break;
                case '흐리고 눈':
                    weatherImagePm = './img/snow.png';
                    break;
                case '비/눈':
                    weatherImagePm = './img/rainsnow.png';
                    break;
                case '소나기':
                    weatherImagePm = './img/rain.png';
                    break;
                default:
            }
            
            // 이미지 출력 
            
            if(index>=0&&index<=15){
            
            var weatherDiv = document.getElementById('weather');
            weatherDiv.innerHTML = 'AM<img src="' + weatherImageAm + '" alt="Morning Weather Image">'+weatherData[index]+
                                   '&ensp;PM<img src="' + weatherImagePm + '" alt="Afternoon Weather Image">'+weatherData[index+1];
        	
            }else{ 
            	var weatherDiv = document.getElementById('weather');
            	weatherDiv.innerHTML="";
            }
  		
  		
  		}
        
        
        
        
    
	}); // 로딩되면 출력
    
    </script>
</body>
</html>