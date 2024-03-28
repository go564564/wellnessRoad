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
	width: 1800px;
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
</style>
</head>
<body>

	<div id="topMenu">
		<div id="menuContainer">
			<a href=""><img src="img/logo.png" alt="" id="logo" /></a>
			<ul>
				<li class="menu">혼자 여행하기</li>
				<li class="menu">여럿이 여행하기</li>
				<li class="menu">게시판</li>
			</ul>
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

	<div class="saveBox">저장</div>

	<script>

var suppliesArray =[];



//데이터 추가 함수 addItem()
function addItem() {
    var container = document.getElementById("main");
    var lastNum = container.getElementsByClassName("boxContainer").length;
    var newNum = lastNum;

    var newBox = document.createElement("div");
    newBox.classList.add("boxContainer");

    var num = document.createElement("div");
    num.classList.add("num");
    num.textContent = newNum;
    newBox.appendChild(num);
    
    
    
	
    //준비물이름 supply_name
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
    checkbox.addEventListener("change",function(){
    	updateCheckedStatus(con, checkbox.checked, checkbox);
    })
    

    
    check.appendChild(checkbox);
    newBox.appendChild(check);

    var deleteBtn = document.createElement("div");
    deleteBtn.classList.add("delete");
    deleteBtn.textContent = "삭제";
    deleteBtn.onclick = function() { deleteItem(this); };
    newBox.appendChild(deleteBtn);

    container.insertBefore(newBox, container.lastElementChild);
    
    //준비물 객체 생성
	var newItem = {
    	supply_name: con,
    	//준비완료 유/무(1:0)- 기본값 0 
    	checked: 0
    };
    suppliesArray.push(newItem);
    console.log(suppliesArray);
}


function updateCheckedStatus(con,isChcked, checkbox){
    // 체크박스가 변경될 때마다 해당 준비물 객체의 체크 여부를 업데이트
    var index = suppliesArray.findIndex(item => item.supply_name === con);
    if (index !== -1) {
        // 해당 준비물 객체가 배열 안에 존재하는 경우에만 업데이트 수행
        suppliesArray[index].checked = checkbox.checked ? 1 : 0;
        console.log(suppliesArray); // 업데이트된 배열 출력 (확인용)
    }
};




//준비물 삭제
function deleteItem(btn) {
    var container = document.getElementById("main");
    var box = btn.parentElement;
    //box에서 줄정보불러오기
    box.querySelector(".content").textContent;
    
    //줄 정보받아서 찾아서 삭제하기
    var index = suppliesArray.findIndex(itemn => item.supply_name === content);
    if(index !== -1){
		suppliesArray[index].checked = 0;
		console.log(suppliesArray);
    }
    
    container.removeChild(box);
    
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
