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
   <div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    글 제목이 들어갑니다.
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>1</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>김oo</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2024.02.09</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>33</dd>
                    </dl>
                </div>
                <div class="cont">
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다
                </div>
            </div>
            <div class="bt_wrap">
                <a href="board_main.jsp" class="on">목록</a>
                <a href="board_edit.jsp">수정</a>
            </div>
        </div>
    </div>
</body>
</html>