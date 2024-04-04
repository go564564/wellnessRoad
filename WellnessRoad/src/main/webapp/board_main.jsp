<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.BoardsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.BoardsDAO"%>
<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style>
@import url(mxzedia.css);

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
}
</style>
</head>
<body>
	<%// mem_info 불러오기 (로그인정보-사용자)
		MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info");%>
		
	<%	
		BoardsDAO dao = new BoardsDAO();
		List<BoardsDTO> list = new ArrayList<BoardsDTO>();
		String vpage = request.getParameter("vpage");
		if(vpage==null){
			vpage="1";
		}
		int v_page=Integer.parseInt(vpage);
		int total=dao.BoardsTotal();
		int pageSize=10;
		int startRow=(v_page-1)*pageSize+1; //시작행
		int endRow=v_page*pageSize; //마지막행	
		list = dao.Show_allBoard(endRow);
	%>
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

	<div class="board_wrap">
		<div class="board_title">
			<strong>게시판</strong>
		</div>

		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">작성일</div>
					<div class="count">조회수</div>
				</div>

				<%
					for (int i = 0; i < list.size(); i++) {
							
						if(list.get(i).getFilename()!=null){
						%>
				<div id="file_yes">
					<div class="num" name="b_idx"><%=list.get(i).getB_idx()%></div>
					<div class="title">
						<a href="board_view.jsp?b_idx=<%=list.get(i).getB_idx()%>"><%=list.get(i).getB_title()%></a>
						<img src="./img/attach-file_Icon.png" width="16" height="16"
							border="0">
					</div>
					<div class="writer"><%=list.get(i).getMem_id()%></div>
					<div class="date"><%=list.get(i).getCreated_at()%></div>
					<div class="count"><%=list.get(i).getB_views()%></div>
				</div>
				<%}else{%>
				<div id="file_no">
					<div class="num" name="b_idx"><%=list.get(i).getB_idx()%></div>
					<div class="title">
						<a href="board_view.jsp?b_idx=<%=list.get(i).getB_idx()%>"><%=list.get(i).getB_title()%></a>
					</div>
					<div class="writer"><%=list.get(i).getMem_id()%></div>
					<div class="date"><%=list.get(i).getCreated_at()%></div>
					<div class="count"><%=list.get(i).getB_views()%></div>
				</div>
				<% } %>
			<% } %>
			</div>
		</div>
	</div>

	<div class="board_page">

		<% if(mem_info !=null){%>
		<div class="bt_wrap">
		   <button type="button" class="submit" id="writePost" onclick="location='board_write.jsp'">글쓰기</button>
		</div>
		
			<%}
			int lastpage=0;%>
			<a href="board_main.jsp?vpage=1" class="pnum"> << </a>
	
			<%	// 페이징  처리
				if(total > 0){
				// 총 페이지의 수
				int pageCount = total / pageSize + (total%pageSize == 0 ? 0 : 1);

				// 한 페이지에 보여줄 페이지 블럭(링크) 수
				int pageBlock = 10;

				// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
				int startPage = ((v_page-1)/pageBlock)*pageBlock+1;
				lastpage=(int)Math.ceil((double)total/10);	
				// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당	
				if(lastpage > pageCount){
					lastpage = pageCount;
				}						
					for(int i=startPage; i <= lastpage; i++){ // 페이지 블록 번호
						if(i == total){ // 현재 페이지에는 링크를 설정하지 않음%>
											
							<%=i%>
																	
						<%}else{ // 현재 페이지가 아닌 경우 링크 설정%>
											
							<a href="board_main.jsp?vpage=<%=i%>" class="pnum"><%=i%></a>
						<%} 
							
					  }

					}%>
			  <a href="board_main.jsp?vpage=<%=lastpage%>" class="pnum"> >> </a>		
		</div>

</body>

</html>