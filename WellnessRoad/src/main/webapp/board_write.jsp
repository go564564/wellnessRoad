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
	<form action="BoardWriteService" method= "post">
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
                <div class="img_up">
                    <input type="file" name="filename" style="float: right;">
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" name="b_content"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="등록">
                <a href="board_main.jsp">취소</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>