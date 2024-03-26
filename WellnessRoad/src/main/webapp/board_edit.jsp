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
            <strong>글 수정</strong>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="img_up">
                    <input type="file" name="filename" style="float: right;">
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력">
                    </textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <a href="board_view.jsp" class="on">수정</a>
                <a href="board_view.jsp">취소</a>
            </div>
        </div>
    </div>
</body>
</html>