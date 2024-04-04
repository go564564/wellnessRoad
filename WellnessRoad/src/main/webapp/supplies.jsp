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


#logo {
	width: 200px;
	height: 50px;
}

#main {
	width: 100%;
	min-height: 100vh;
	background-color: #FEFBF6;
	text-align: center;
	font-family: "Sunflower", sans-serif;
	font-weight: 300;
	font-style: normal;
	color: #333;
	font-size: 20px;
}

hr {
	width: 95%;
	height: 3px;
	background-color: #8CB9BD;
	margin: auto;
}

table {
	width: 90%;
	margin: auto;
	fomt-size: 25px;
}

.boxContainer {
	width: 90%;
	display: flex;
	flex-wrap: nowrap;
	height: 60px;
	background-color: white;
	margin: auto;
	border-radius: 20px;
	box-shadow: 2px 2px 2px;
	line-height: 60px;
	margin-top: 15px;
	margin-bottom: 15px;
}

.input>input {
	width: 90%;
	height: 60px;
	margin-top: 15px;
}

.plusBox {
	width: 90%;
	height: 60px;
	background-color: white;
	margin: auto;
	border-radius: 20px;
	box-shadow: 2px 2px 2px;
	line-height: 60px;
	text-align: center;
	cursor: pointer; /* 추가 버튼에 커서 스타일 변경 */
	margin-top: 15px;
}

.plusBox:hover {
	background-color: #f0f0f0; /* 추가 버튼에 호버 효과 추가 */
}

.saveBox {
	width: 90%;
	height: 60px;
	background-color: gray;
	margin: auto;
	border-radius: 20px;
	box-shadow: 2px 2px 2px;
	line-height: 60px;
	text-align: center;
	cursor: pointer; /* 추가 버튼에 커서 스타일 변경 */
	margin-top: 15px;
}

.saveBox:hover {
	background-color: #f0f0f0; /* 추가 버튼에 호버 효과 추가 */
}

.num {
	width: 20%;
	height: 60px;
	align-self: left;
	background-color: #8CB9BD;
	line-height: 60px;
	border-radius: 20px;
}

.content {
	width: 60%;
	height: 60px;
	align-self: left;
	line-height: 60px;
}

.check {
	width: 10%;
	height: 60px;
	line-height: 60px;
	text-align: center; /* 체크박스 가운데 정렬 */
	vertical-align: middle;
}

.check>input {
	width: 30px;
	height: 30px;
	border: 2px solid #F47C7C;
	border-radius: 4px;
	vertical-align: middle;
}

.delete {
	width: 10%;
	height: 60px;
	line-height: 60px;
	cursor: pointer; /* 삭제 버튼에 커서 스타일 변경 */
	color: red; /* 삭제 버튼 텍스트 색상 변경 */
}

.delete:hover {
	color: darkred; /* 삭제 버튼에 호버 효과 추가 */
}
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
				<img src="./img/logoBus.png" alt="로고" id="logo" />
				
					<div class="menu"><a href="Main.jsp">메인메뉴</a></div>
					<div class="menu"><a href="viewAll.jsp">여행계획보기</a></div>					
					
				</div>
			
			<div id="ropRightMenu">
				<div class="menu"><a href="LogoutService">로그아웃</a></div>
			</div>
			
		</div>
	</div>

	<div id="main">
		<br>
		<h1>여행 준비물</h1>
		<hr>
		<br>
		<table>
			<tr>
				<th>번호</th>
				<th>내용물</th>
				<th>완료여부</th>
			</tr>

		</table>
		<br>
		<hr>

		<div class="input">
			<input type="text" placeholder="엔터키를 눌러도 추가됩니다." id="inputItem">
		</div>

		<div class="plusBox" onclick="addItem()">추가</div>

	</div>

	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script>
	//여긴 이제 trip_idx를 나중에받아야함 메인파일완성되면
	var temp_idx = '<%=session.getAttribute("trip_idx")%>';
	var suppliesArray =[];
	//======================
	$(document).ready(function() {
    // 서블릿을 통해 DB에서 받은 데이터를 화면에 표시하는 함수
   function displaySupplies(suppliesArray) {
   	var container = document.getElementById("main");
    
    suppliesArray.forEach(function(supply, index) {
    	
    	var newBox = document.createElement("div");
        newBox.classList.add("boxContainer");

        var num = document.createElement("div");
        num.classList.add("num");
        num.textContent = index + 1;
        newBox.appendChild(num);

        var content = document.createElement("div");
        content.classList.add("content");
        content.textContent = supply.supply_name;
        newBox.appendChild(content);

        var check = document.createElement("div");
        check.classList.add("check");
        check.textContent = "준비완료";
        var checkbox = document.createElement("input");
        checkbox.type = "checkbox";

        // 데이터베이스에서 가져온 값에 따라 체크박스 상태 설정
        //checkbox.checked = supply.checked === 1 ? true : false;
		checkbox.checked = supply.supply_status === 1 ? true : false;
        checkbox.addEventListener("change", function() {
            updateCheckedStatus(supply.supply_name, checkbox.checked, checkbox);
        });
        check.appendChild(checkbox);
        newBox.appendChild(check);

        var deleteBtn = document.createElement("div");
        deleteBtn.classList.add("delete");
        deleteBtn.textContent = "삭제";
        deleteBtn.onclick = function() { deleteItem(this); };
        newBox.appendChild(deleteBtn);

        container.insertBefore(newBox, container.lastElementChild);
        console.log(suppliesArray);
        
    });
}


    // 페이지 로드 시 DB에서 준비물을 가져와서 화면에 표시
    $.ajax({
        url: "GetSuppliesService", // 여행에 대한 준비물을 불러오는 서블릿 주소
        method: "GET",
        data: {trip_idx: temp_idx},
        success: function(response) {
            // 성공 시 받은 데이터를 화면에 표시
            suppliesArray = response;
            displaySupplies(response);
            //callbackFunc 콜백함수?? 를 써야하나 response를 callbackFunc로?
        },
        error: function(xhr, status, error) {
            console.error("DB로부터 준비물을 불러오는데 실패했습니다.", status, error);
        }
    });
});
		
		
		//======================
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




//데이터 추가 함수 addItem()
function addItem() {
    var container = document.getElementById("main");
    var trip_idx = temp_idx;
    // 여기가 화면에 보이는 숫자화면인 듯
    var lastNum = container.getElementsByClassName("boxContainer").length;
    var newNum = lastNum;

    var newBox = document.createElement("div");
    newBox.classList.add("boxContainer");

    var num = document.createElement("div");
    num.classList.add("num");
    num.textContent = newNum + 1;
    newBox.appendChild(num);

    // 준비물이름 supply_name
    var content = document.createElement("div");
    content.classList.add("content");

    var con = document.getElementById("inputItem").value;
    content.textContent = con;
    newBox.appendChild(content);

    var check = document.createElement("div");
    check.classList.add("check");
    check.textContent = "준비완료";
    var checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.addEventListener("change", function () {
        updateCheckedStatus(con, checkbox.checked, checkbox);
    });
    check.appendChild(checkbox);
    newBox.appendChild(check);

    var deleteBtn = document.createElement("div");
    deleteBtn.classList.add("delete");
    deleteBtn.textContent = "삭제";
    deleteBtn.onclick = function () {
        deleteItem(this);
    };
    newBox.appendChild(deleteBtn);

    container.insertBefore(newBox, container.lastElementChild);

    // AJAX 호출을 비동기적으로 처리
    $.ajax({
        url: 'AddSupply',
        method: 'POST',
        data: { name: con, status: 0, trip_idx: temp_idx },
        success: function (response) {
            console.log("새로운 준비물 추가 성공!");
            // 성공적으로 추가되면 suppliesArray에도 추가
            var newItem = {
                supply_name: con,
                supply_status: 0,
                trip_idx: temp_idx
            };
            suppliesArray.push(newItem);
            console.log(suppliesArray);
        },
        error: function (xhr, status, error) {
            console.error('Error', status, error);
            alert('준비물 추가 실패. 다시 시도하세요.');
        }
    });
}



	
	function updateCheckedStatus(supplyName, isChecked, checkbox){
	$.ajax({
		url: 'UpdateSupply',
		method: 'POST',
		data: { name: supplyName, status: isChecked },
		success: function(response){
				console.log(response);
			
				 if(response.success){
		                console.log("준비물 업데이트 성공! -ajax");
		            } else {
		                console.log("준비물 업데이트 실패! -ajax");
		                alert('준비물 업데이트 실패. 다시 시도하도록 하세요.');
		            }//if else
			
			
		},//func
		error: function(xhr, status, error){
			console.error('Error', status, error);
			alert('ajax 요청 실패');
		}
		
		
	});//ajax
	
	checkbox.addEventListener("change", function(){
		var supplyName = con;
		var isChecked = this.checked ? 1:0 //체크박스 상태 (1: 체크됨, 0: 체크 해제됨)
	});
	}//func
	
	
	

		



//준비물 삭제
function deleteItem(btn) {
    var container = document.getElementById("main");
    var box = btn.parentElement;
    
    //삭제할 준비물의 번호
    var num = box.querySelector(".num").textContent;
    
    //box에서 줄정보불러오기
    var content = box.querySelector(".content").textContent;
    
    //줄 정보받아서 찾아서 삭제하기
    var index = suppliesArray.findIndex(item => item.supply_name === content);
    if(index !== -1){
		suppliesArray.splice(index, 1);
		}
    container.removeChild(box);
    
    var boxes = container.getElementsByClassName("boxContainer");
    for(var i = 0; i<boxes.length;i++){
		//화면에보이는 숫자 업데이트    	
    	var currentNum = boxes[i].querySelector(".num");
    	currentNum.textContent = i+1;
    }
    
    
	console.log(suppliesArray);
	
	
	
	$.ajax({
		url: 'DeleteSupply',
		method: 'POST',
		data: { name: content },
		success: function(response){
			console.log("준비물 삭제 성공!");
		},
		error: function(xhr, status, error){
			console.error('Error', status, error);
			alert('준비물 삭제 실패. 다시 시도하세요.');
		}
	});
    
    
    }
    
    



document.getElementById("inputItem").addEventListener("keypress", function(event) {
    if (event.keyCode === 13&&document.getElementById("inputItem").value!="") { // 엔터 키 눌렀을 때
        addItem();
        document.getElementById("inputItem").value="";
    }
});







</script>



</body>
</html>
