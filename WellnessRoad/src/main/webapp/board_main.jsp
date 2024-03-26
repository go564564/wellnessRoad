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
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)
    {
        userID = (String)session.getAttribute("userID");
    }
 
%>
<div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num" name="indx">번호</div>
                    <div class="title" name="title">제목</div>
                    <div class="writer" name="writer">글쓴이</div>
                    <div class="date" name="date">작성일</div>
                    <div class="count" name="count">조회</div>
                </div>
                <div>
                    <div class="num">5</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">이oo</div>
                    <div class="date">2024-01-15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">4</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">최oo</div>
                    <div class="date">2024-01-15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">3</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">박oo</div>
                    <div class="date">2024-01-15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">2</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">이oo</div>
                    <div class="date">2024-01-15</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">1</div>
                    <div class="title"><a href="view.html">글 제목이 들어갑니다.</a></div>
                    <div class="writer">김oo</div>
                    <div class="date">2024-01-06</div>
                    <div class="count">33</div>
                </div>
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
                <a href="board_write.jsp" class="on">등록</a>
                <!--<a href="#">수정</a>-->
            </div>
        </div>
    </div>
</body>
</html>