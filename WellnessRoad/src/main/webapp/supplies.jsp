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
.boxContainer{
width:90%;
display:flex;
flex-wrap: nowrap;
height:60px;
background-color: white;
margin:auto;
border-radius: 20px;
box-shadow: 2px 2px 2px;
line-height:60px;
margin-top:15px;
margin-bottom:15px;
}

.input>input{
width:90%;
height:60px;
margin-top:15px;
}
.plusBox{
width:90%;
height:60px;
background-color: white;
margin:auto;
border-radius: 20px;
box-shadow: 2px 2px 2px;
line-height:60px;
text-align:center;
cursor: pointer; /* 추가 버튼에 커서 스타일 변경 */
margin-top:15px;
}


.plusBox:hover {
	background-color: #f0f0f0; /* 추가 버튼에 호버 효과 추가 */
}

.saveBox{
width:90%;
height:60px;
background-color: gray;
margin:auto;
border-radius: 20px;
box-shadow: 2px 2px 2px;
line-height:60px;
text-align:center;
cursor: pointer; /* 추가 버튼에 커서 스타일 변경 */
margin-top:15px;
}

.saveBox:hover {
	background-color: #f0f0f0; /* 추가 버튼에 호버 효과 추가 */
}




.num{
width:20%;
height:60px;
align-self: left;
background-color: #8CB9BD;
line-height:60px;
border-radius: 20px;
}
.content{
width:60%;
height:60px;
align-self: left;
line-height:60px;
}
.check{
width:10%;
height:60px;
line-height: 60px;
text-align: center; /* 체크박스 가운데 정렬 */
vertical-align: middle;
}

.check>input{
  width:30px;
  height:30px;
  border:2px solid #F47C7C;
  border-radius: 4px;
  vertical-align:middle;
}

.delete{
width:10%;
height:60px;
line-height:60px;
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
		
		<div class="plusBox" onclick="addItem()">
		추가
		</div>
	
	</div>
	
	<div class="saveBox" onclick="saveItems()">
		저장
		</div>
		
<script>

var suppliesArray =[];



//데이터 추가 함수 addItem()
function addItem() {
    // main 요소를 찾아옵니다.
    var container = document.getElementById("main");
    // 현재 준비물 상자의 개수를 가져옵니다.
    var lastNum = container.getElementsByClassName("boxContainer").length;
    // 새로운 준비물 상자의 번호를 설정합니다.
    var newNum = lastNum;

    // 새로운 준비물 상자를 생성합니다.
    var newBox = document.createElement("div");
    newBox.classList.add("boxContainer");

    // 번호 요소를 생성하고 추가합니다.
    var num = document.createElement("div");
    num.classList.add("num");
    num.textContent = newNum;
    newBox.appendChild(num);

    // 내용물 요소를 생성하고 추가합니다.
    var content = document.createElement("div");
    content.classList.add("content");
    // 입력된 준비물 이름을 가져와서 텍스트로 설정합니다.
    var supplyName = document.getElementById("inputItem").value;
    content.textContent = supplyName;
    newBox.appendChild(content);

    // 체크 요소를 생성하고 추가합니다.
    var check = document.createElement("div");
    check.classList.add("check");

    // 준비완료 텍스트를 생성하고 추가합니다.
    var checkText = document.createElement("span");
    checkText.textContent = "준비완료";
    check.appendChild(checkText);

    // 체크박스를 생성하고 추가합니다.
    var checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.addEventListener("change", function() {
        updateCompletion(this);
    });
    check.appendChild(checkbox);
    
    newBox.appendChild(check);

    // 삭제 버튼을 생성하고 추가합니다.
    var deleteBtn = document.createElement("div");
    deleteBtn.classList.add("delete");
    deleteBtn.textContent = "삭제";
    deleteBtn.onclick = function() { deleteItem(this); };
    newBox.appendChild(deleteBtn);

    // supply_name과 completion을 객체에 담아 배열에 추가합니다.
    var newItem = {
        supply_name: supplyName,
        completion: 0 // 초기값은 0으로 설정
    };
    suppliesArray.push(newItem);

    // 새로운 준비물 상자를 main 요소의 마지막 자식으로 추가합니다.
    container.insertBefore(newBox, container.lastElementChild);
    console.log(suppliesArray);
}


//체크박스 누르면 1 안누르면 0 //실험중
//function checkCheck(checkbox){
	//체크됐을떄?  1 체크안되면 0
//	var completion = checkbox.checked ? 1: 0;
	
//}



function updateCompletion(checkbox) {
    var container = document.getElementById("main");
    var index = Array.from(container.children).indexOf(checkbox.parentElement.parentElement);

    if (!isNaN(index) && index >= 0 && index < suppliesArray.length) {
        suppliesArray[index].completion = checkbox.checked ? 1 : 0;
    } else {
        console.error("Invalid index:", index);
    }
}



//준비물 삭제
function deleteItem(btn) {
    var container = document.getElementById("main");
    var box = btn.parentElement;
    container.removeChild(box);
    
    //삭제 준비물 인덱스찾기
    var index = Array.from(container.children).indexOf(box);
    //indexOf()는 해당요소가 배열에서 발견되지않을때 -1 뽑힘
    //그니깐 index가 -1이 아닌 경우에만 해당요소를 삭제하는걸로 작업
    
    
    //suppliesArray 배열에서 해당 요소 삭제하기
    if(index !== -1){
    	suppliesArray.splice(index, 1);
    }
}


document.getElementById("inputItem").addEventListener("keypress", function(event) {
    if (event.keyCode === 13&&document.getElementById("inputItem").value!="") { // 엔터 키 눌렀을 때
        addItem();
        document.getElementById("inputItem").value="";
    }
});


function saveItems(){
	console.log();
}

</script>



</body>
</html>
    