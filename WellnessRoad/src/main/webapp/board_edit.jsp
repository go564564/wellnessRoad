<%@page import="com.smhrd.model.BoardsDTO"%>
<%@page import="com.smhrd.model.BoardsDAO"%>
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
	<%  System.out.println("editboard 게시글수정jsp");
		int B_IDX = Integer.parseInt(request.getParameter("b_idx"));
	    System.out.println("수정-글번호"+B_IDX);
		BoardsDAO dao = new BoardsDAO();
		BoardsDTO result= dao.show_DetailBoard(B_IDX);
	%>
       <form action="Board_edit" method="post" enctype="multipart/form-data">
		 <div class="board_wrap">
            <div class="board_title">
               <strong>글 수정</strong>
            </div>
            <div class="board_write_wrap">
              <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd>
                        	<input type="text" name="b_title" value="<%=result.getB_title()%>">
                        	<input type="hidden" name="b_idx" value="<%=B_IDX%>" />
                        </dd>
                    </dl>
                </div>
                <div class="img_up">
                    <% if (result.getFilename() != null && !result.getFilename().isEmpty()) { %>
      				  <img src="<%= result.getFilename() %>" alt="이전 이미지">
      				  <input type="radio" name="delete_image" value="delete"> 이미지 삭제
       				  <input type="radio" name="delete_image" value="keep" checked> 이미지 유지
   					<% } else { %>
        			  <p>이미지가 없습니다.</p>
   				    <% } %>
                    <input type="file" name="filename" style="float: right;">
                </div>
            
                <div class="cont">
                    <textarea name="b_content"><%=result.getB_content()%></textarea>
                </div>
              </div>
           </div>
         </div>
            <div class="bt_wrap">
                 <input type="submit" class="submit" value="글 수정">
                 <button type="button" class="submit" onclick="location='board_view.jsp?b_idx=<%= B_IDX%>'">취소</button>
            </div>
	  </form>        

</body>
</html>