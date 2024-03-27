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
</style>
</head>
<body>
	<%
		// mem_info 불러오기 (로그인정보-사용자)
		MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info");
	%>
	<%
		BoardsDAO dao = new BoardsDAO();
		ArrayList<BoardsDTO> list = new ArrayList<BoardsDTO>();
		list = dao.Show_allBoard();
	%>
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
                    <div class="count">조회</div>
                </div>
					<%
					for (int i = 0; i < list.size(); i++) {
					%>
				<div>
					<div class="num" name="b_idx"><%=list.get(i).getB_idx()%></div>
					<div class="title"> <a href="board_view.jsp?b_idx=<%=list.get(i).getB_idx()%>"><%=list.get(i).getB_title()%></a></div>
					<div class="writer"><%=list.get(i).getMem_id()%></div>
					<div class="date"><%=list.get(i).getCreated_at()%></div>
					<div class="count"><%=list.get(i).getB_views()%></div>
				</div>
					<% } %>
            </div>
            <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div>
            <div class="bt_wrap">
                <a href="board_write.jsp" class="on" id="writePost">글쓰기</a>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
</body>


<script>





</script>


</html>