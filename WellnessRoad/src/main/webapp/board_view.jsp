<%@page import="com.smhrd.model.BoardCommentsDTO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.MembersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.BoardsDAO"%>
<%@page import="com.smhrd.model.BoardsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css">
 	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
	 @import url(mxzedia.css);
	 
	 
	.submit{
  	background-color: rgb(0, 128,255);
 	border-radius:10%;
  	width: 3em;
 	height: 2em;;
  	font-size: 15px;
 	font-weight: bold;
 	color: aliceblue;
}
	
	.cmd_tb{
	text-align: center; 
	border: 1px solid #dddddd;
	margin-top: 10px;
	padding: 5px;
	}
	
	#cmt_id{
	padding: 30px;
	}
	</style>	
</head>
<body>
	<% MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info"); %>
	<%
	System.out.println("board_view 도착");

	String idx = request.getParameter("b_idx");
	System.out.println("idx"+idx);
	int B_IDX = Integer.parseInt(idx);
	
	
	BoardsDAO dao = new BoardsDAO();
	BoardsDTO result = dao.show_DetailBoard(B_IDX);
	int view = result.getB_views()+1;
	int inc_result = new BoardsDAO().b_views_inc(new BoardsDTO(B_IDX, view));
	int b_idx=result.getB_idx();
	System.out.println(result.getFilename());
	%>
   <div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><%=result.getB_title()%></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd name="b_idx"><%=b_idx%></dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%=result.getMem_id()%></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%=result.getCreated_at()%></dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd name="b_views"><%=view%></dd>
                    </dl>
                </div>
                <%if(result.getFilename()!=null){ %>
                <div class="cont">
					<img src="./b_imgs/<%=result.getFilename()%>">
					<%=result.getB_content()%>
                </div>
                <%} else{ %>
                <div class="cont">
					<%=result.getB_content()%>
                </div>
                <%}%>                
            </div>
				
			<!-- 댓글 등록 부분 -->
			<div class="container">
				<div class="form-group">
					<form action="BoardCommentService" method="post">
						<table class="cmd_tb" style="text-align: center; border-bottom: 1px solid #dddddd;">
							<tr>
								<td style="border-bottom: none;" id=cmt_id><%=mem_info.getMem_id()%></td>
								<input type="hidden" name="b_idx" value="<%=b_idx%>" />
								<td><input type="text" name="cmt_content" style="height: 100px; width: 800px" class="form-control" placeholder="댓글을 남겨주세요" name="commentText"></td>
								<td><input type="submit" class="submit" value="등록"></td>
							</tr>
					    </table>
					</form>					
				</div>
			</div> 
			<div class="comment-section">
				<h3>댓글</h3>
				<%
				// 댓글 목록 조회
				   List<BoardCommentsDTO> cmtList = dao.show_cmt(b_idx);
				   if (cmtList != null && !cmtList.isEmpty()) {
				  	  for(int i=cmtList.size()-1;i>=0;i--){
				%>
				<div class="comment">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<td style="text-align: left;"><%=cmtList.get(i).getMem_id()%></td>
						<td style="text-align: right; font-size: 10px;"><%=cmtList.get(i).getCreated_at()%></td>
					</tr>
					<tr>
						<td><%=cmtList.get(i).getCmt_content() %></td>
					</tr>
				</table>	
				</div>
				 	  <%}
				  	}else{%><p>등록된 댓글이 없습니다.</p><%}%>
			</div>
			<div class="bt_wrap">
                 <button type="button" class="submit" onclick="location='board_main.jsp'">목록</button>
                 
            <%if(mem_info.getMem_id().equals(result.getMem_id())){ %>
                 <button type="button" class="submit" onclick="location='board_edit.jsp?b_idx=<%=b_idx%>'">수정</button>
                 <button type="button" class="submit" onclick="location='BoardDelete?b_idx=<%=b_idx%>'">삭제</button>
            <%}%>
                
            </div> 
        </div>
    </div>
</body>
</html>