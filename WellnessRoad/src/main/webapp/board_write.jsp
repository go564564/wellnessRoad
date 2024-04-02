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
	</style>
	<script type="text/javascript">
		function checkValue(){
			const form = document.boardForm;
			const b_title = form.b_title.value;
			const b_content = form.b_content.value;
			
			 if(!b_title){
			    alert("제목을 입력해주세요.");
			    return false;
			  } 
			   else if(!b_content){
			     alert("내용을 입력해주세요.");
			     return false;
			    }
		}
		function goToB_main() {
			  location.href = "board_main.jsp";
		}
	</script>
</head>
<body>
	<form action="BoardWriteService" method= "post" enctype="multipart/form-data" onsubmit="return checkValue()">
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
                    <input type="file" name="filename" style="float: right;">
                </div>
                <div class="cont" align="center">
                    <textarea placeholder="내용 입력" name="b_content"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="등록">
                <input type="reset" value="초기화">               
                <input type="button"value="취소" onclick="goToB_main()"></input>
            </div>
        </div>
    </div>
    </form>
</body>
</html>