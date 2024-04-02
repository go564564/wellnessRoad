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
	background-color: rgba(255, 255, 255, 0.5);;
	display: flex;
	justify-content: space-between;
}

#topLeftMenu {
	height: 50px;
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
}

#toprightMenu {
	height: 50px;
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
}

#logo {
	width: 200px;
	height: 50px;
}

.menu {
	width: 200px;
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
	text-align: center;
	line-height: 50px;
}

.menu:focus, .menu:hover {
	color: #222;
}

.menu:focus:after, .menu:hover:after {
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
	height: 800px;
	background-color: #FEFBF6;
	text-align: center;
	font-family: "Sunflower", sans-serif;
	font-weight: 300;
	font-style: normal;
	color: #333;
	font-size: 20px;
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
	width: 6rem;
	height: 7rem;
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
	font-size: 0.7rem;
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

form {
	margin-left: 3rem;
}

.dayPrint {
	width: 10%;
	height: 30px;
	border-color: #D0D0D0;
	margin-left: 4rem;
	border-radius: 2rem;
	border-style: solid;
	margin-bottom: 0.7rem;
	line-height: 30px;
	text-align: center;
	box-shadow: 0.2rem 0.2rem 0.4rem #D0D0D0;
	border-width: 1px;
}

#select {
	width: 800px;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	border-radius: 10px;
	font-family: 'Roboto';
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
}

#select:focus {
	border: 1px solid #9B51E0;
	box-sizing: border-box;
	border-radius: 10px;
	outline: 3px solid #F8E4FF;
	border-radius: 10px;
}

#submit, #submitMenu {
	cursor: pointer;
	width: 10%;
	height: 20px;
	border-color: #D0D0D0;
	margin-left: 1rem;
	border-radius: 2rem;
	border-style: solid;
	margin-bottom: 0.7rem;
	line-height: 20px;
	text-align: center;
	box-shadow: 0.2rem 0.2rem 0.4rem #D0D0D0;
	border-width: 1px;
}

#submit:hover , #submitMenu:hover{
background-color: #333;
color:white;
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

				<div class="menu"><a href="#">메인메뉴</a></div>
				<div class="menu">여행계획보기</div>
				<div class="menu">준비물</div>

			</div>

			<div id="ropRightMenu">
				<div class="menu">로그아웃</div>
			</div>

		</div>
	</div>

	<div id="schedule"></div>
	<div id="day"></div>
	<br>
	<div class="dropdown">
		<div class="dropdown-content">
			<form action="">
				<select name="url" id="select">
					<option value="sample">여행계획 데이터가 없습니다.</option>					
				</select> <input type="submit" value="가져오기" id="submit">
				 <input type="submit" value="관광지 편집하기" id="submitMenu">
			</form>
		</div>
	</div>

	<br>

	<div class="wrapDayContainer">



		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

		<script>



		function formatDate(dateStr) {
		    var date = new Date(dateStr); // 문자열을 Date 객체로 변환
		    var year = date.getFullYear(); // 연도
		    var month = ('0' + (date.getMonth() + 1)).slice(-2); // 월
		    var day = ('0' + date.getDate()).slice(-2); // 일
		    return year + '-' + month + '-' + day; // yyyy-mm-dd 형식으로 반환
		}

		var mem_id = "kca"; // 여기에 실제 mem_id 값을 설정합니다.
		var tripIdxArray = [];

		$.ajax({
		    url: "GetIdNameDay", // 서버 URL을 설정합니다.
		    method: "POST", // POST 방식으로 요청합니다. 필요에 따라 변경 가능합니다.
		    data: { "mem_id": mem_id }, // mem_id를 서버에 전달합니다.
		    dataType: "json", // 서버에서 받아온 데이터 타입을 JSON으로 지정합니다.
		    success: function(response) {
		        var responseData = response;
		        var selectElement = document.getElementById('select');
		        selectElement.innerHTML = ''; // 기존 옵션을 지웁니다
		        responseData.forEach(function(trip) {
		            var optionElement = document.createElement('option');
		            // 날짜와 여행 이름을 텍스트로 설정합니다.
		            optionElement.text = trip.trip_name + ' ' + formatDate(trip.st_dt) + ' - ' + formatDate(trip.ed_dt);
		           
		            
		            optionElement.value = trip.st_dt + ' ~ ' + trip.ed_dt;
		            optionElement.dataset.tripIdx = trip.trip_idx; // trip_idx를 data 속성으로 설정합니다
		            optionElement.dataset.tripName = trip.trip_name; // trip_name을 data 속성으로 설정합니다
		            optionElement.dataset.stDt = formatDate(trip.st_dt); // st_dt를 data 속성으로 설정합니다
		            optionElement.dataset.edDt = formatDate(trip.ed_dt); // ed_dt를 data 속성으로 설정합니다
		            selectElement.appendChild(optionElement);
		            tripIdxArray.push(trip.trip_idx);
		        }); // forEach 메서드의 닫는 괄호  
		       
		        reDraw(tripIdxArray[0]);
		    },
		    error: function() {}
		});

function appendDayContainer() {
    // 부모 요소에 접근합니다.
    var parentElement = document.querySelector('.wrapDayContainer');

    // dayContainer를 생성합니다.
    var dayContainer = document.createElement('div');
    dayContainer.classList.add('dayContainer');

    // 부모 요소에 dayContainer를 추가합니다.
    parentElement.appendChild(dayContainer);

    return dayContainer; // 생성된 dayContainer를 반환합니다.
}

function reDraw(num){

var parentElement = document.querySelector('.wrapDayContainer');
    parentElement.innerHTML = '';

$.ajax({
    url: "GetDataAll",
    data: {
    	"id": num
        },
    dataType: "json",
    success: function(res) {
        if (res != null) {
            var jsonData = {};
            for (var i = 0; i < res.length; i++) {
                var item = res[i];
                var dayKey = "day" + item.sche_day;
                if (!jsonData[dayKey]) {
                    jsonData[dayKey] = [];
                }
                jsonData[dayKey].push({ poi_name: item.poi_name, poi_url: item.poi_url });
            }

            console.log(jsonData);

            var numberOfArrays = Object.keys(jsonData).length;
            console.log("생성된 배열의 개수:", numberOfArrays);

            for (var i = 1; i <= numberOfArrays; i++) {
                var dayKey = "day" + i;

                if (jsonData.hasOwnProperty(dayKey)) {
                    var dayData = jsonData[dayKey];

                    console.log(dayKey + "의 데이터:");

                    var parentElement = document.querySelector('.wrapDayContainer');
                    
                    var dayPrint = document.createElement('div');
                    dayPrint.classList.add('dayPrint');
                    dayPrint.textContent = dayKey+"일차";
                    parentElement.appendChild(dayPrint);
                    
                    var dayContainer = appendDayContainer(); // 일일 컨테이너 추가
					
                    var lastIndex = dayData.length - 1;
                    
                    for (var j = 0; j < dayData.length; j++) {
                        var data = dayData[j];
                        
                        
                        if (j/14>0&&j%14==0) {
                        	
                        	var parentElement = document.querySelector('.dayContainer');

                            // 부모 요소의 마지막 자식 요소를 가져옵니다.
                            var lastChild = parentElement.lastElementChild;

                            // 마지막 자식 요소가 구분선인 경우에만 제거합니다.
                            if (lastChild.classList.contains('separator')) {
                                parentElement.removeChild(lastChild);
                            }
                        	
                        	var dayContainer = appendDayContainer();                        	
                        }
                        
                        
                        if (j !== lastIndex) {
                        	insertSeparator(dayContainer, data.poi_name, data.poi_url);
                        
                        } else{
                        	insertBox(dayContainer, data.poi_name, data.poi_url);
                        }
                                                                        
                    }
                                      
                    
                } else {
                    console.log(dayKey + "의 데이터가 없습니다.");
                }
                
              
                
            }
        }
    },
    error: function() {}
});

} // 함수끝


function insertSeparator(parentElement, name, url) {
    var imgElement = document.createElement('div');
    imgElement.classList.add('img');

    var img = document.createElement('img');
    img.src = url;
    img.classList.add('imgUrl');

    var nameElement = document.createElement('div');
    nameElement.classList.add('name');
    nameElement.textContent = name;

    imgElement.appendChild(img);
    imgElement.appendChild(nameElement);

    var separatorElement = document.createElement('div');
    separatorElement.classList.add('separator');

    parentElement.appendChild(imgElement);
    parentElement.appendChild(separatorElement);
}

function insertBox(parentElement, name, url) {
    var imgElement = document.createElement('div');
    imgElement.classList.add('img');

    var img = document.createElement('img');
    img.src = url;
    img.classList.add('imgUrl');

    var nameElement = document.createElement('div');
    nameElement.classList.add('name');
    nameElement.textContent = name;

    imgElement.appendChild(img);
    imgElement.appendChild(nameElement);  

    parentElement.appendChild(imgElement);
}


document.getElementById('submit').addEventListener('click', function(event) {
    event.preventDefault(); // 기본 이벤트 동작 방지

    // 선택된 옵션의 인덱스 가져오기
    var selectElement = document.getElementById('select');
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var selectedIdx = selectedOption.dataset.tripIdx;
	
    // 선택된 옵션의 idx 값 콘솔에 출력
    reDraw(selectedIdx);
    
});

document.getElementById('submitMenu').addEventListener('click', function(event) {
    event.preventDefault(); // 기본 이벤트 동작 방지

    // 선택된 옵션의 인덱스 가져오기
    var selectElement = document.getElementById('select');
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var selectedTripIdx = selectedOption.dataset.tripIdx;
    var selectedTripName = selectedOption.dataset.tripName;
    var selectedStDt = selectedOption.dataset.stDt;
    var selectedEdDt = selectedOption.dataset.edDt;
	alert(selectedStDt)
    
    // 새로운 페이지 URL 구성
    var newPageURL = 'LinkDataMainSche?' +
        'id=' + encodeURIComponent(selectedTripIdx) +
        '&name=' + encodeURIComponent(selectedTripName) +
        '&st_dt=' + encodeURIComponent(selectedStDt) +
        '&ed_dt=' + encodeURIComponent(selectedEdDt);

    // 새로운 페이지로 이동
    window.location.href = newPageURL;
});







</script>
</body>
</html>
