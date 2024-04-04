<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글작성하기</title>
	<link rel="stylesheet" href="style.css">
	<style>
	 @import url(mxzedia.css);
	 
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
	background-image: url("./img/mokgoo.jpg");
	background-repeat: no-repeat;
	background-size:cover;
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
#rightMenu {
	padding-right:50px;
	display: flex;
	width:300px;
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
	justify-content: space-between;
}

	.submit{
  	background-color: rgb(0, 128,255);
 	border-radius:10%;
  	width: 5em;
 	height: 2em;;
  	font-size: 15px;
 	font-weight: bold;
 	color: aliceblue;
 	border: none;
 	margin-top: 10px;
}
	</style>
	<script type="text/javascript">
		
		function goToB_main() {
			  location.href = "board_main.jsp";
		}
		function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
            var output = document.getElementById('imagePreview');
            output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
	</script>
</head>
<body>
<%// mem_info 불러오기 (로그인정보-사용자)
		MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info");%>
	  <div id="topMenu">
		<div id="menuContainer">
			
			<div id="topLeftMenu">
				<a href="Main.jsp" ><img src="./img/logoBus.png" alt="로고" id="logo" /></a>
				
				<div class="menu"><a href="board_main.jsp">게시판</a></div>
				<div class="menu"><a href="viewAll.jsp">여행계획보기</a></div>
					
				</div>
			
				<div id="rightMenu">
					<%
					if (mem_info == null) {
					%>
					<div onclick="location.href='Login.jsp';">로그인</div>
					<div onclick="location.href='register.jsp';">회원가입</div>
					<%
					} else {
					%>
					<div onclick="location.href='realMyPage.jsp';">마이페이지</div>
					<div onclick="location.href='LogoutService';">로그아웃</div>
					<%
					}
					%>
				</div>
			
		</div>
	</div>





	<form action="BoardWriteService" method= "post" enctype="multipart/form-data">
      <div class="board_wrap">
         <div class="board_title">
            <strong>게시판</strong>
         </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt style="font-weight: bolder; font-size:large;">제목</dt>
                        <dd><input type="text" name="b_title" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <!-- 이미지첨부 -->
                <div class="img_up">
                    <input type="file" name="filename" style="float: right;" accept="image/*" onchange="previewImage(event)">
                </div><br>
                <div class="cont" align="center">
                    <textarea placeholder="내용 입력" name="b_content"></textarea>   			    
    			    <img id="imagePreview" src="#" alt="이미지 미리보기" style="max-width: 300px; max-height: 300px;"><br>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="등록" onclick="checkValue()" class="submit">
                <input type="reset" value="초기화" class="submit">               
                <input type="button"value="취소" onclick="goToB_main()" class="submit"></input>
           
            </div>
        </div>
    </div>
    </form>
</body>
</html>