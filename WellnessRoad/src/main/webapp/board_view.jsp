<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.MembersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.BoardsDAO"%>
<%@page import="com.smhrd.model.BoardsDTO"%>
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
	<% MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info"); %>
	<%
	System.out.println("board_view 도착");
	System.out.println(request.getParameter("b_idx"));

	int B_IDX = Integer.parseInt(request.getParameter("b_idx"));
	BoardsDAO dao = new BoardsDAO();
	BoardsDTO result = dao.show_DetailBoard(B_IDX);
	int view = result.getB_views()+1;
	int inc_result = new BoardsDAO().b_views_inc(new BoardsDTO(B_IDX, view));
	int b_idx=result.getB_idx();
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
                <div class="cont">
					<%=result.getB_content()%>
                </div>
            </div>
            	<h2 class="comment">댓글쓰기</h2>
                <textarea class="require_login" cols="85" rows="3" title="댓글 입력" name="cmt_content" id="cmt_content" onfocus="init_textarea(this);" placeholder="로그인 해주세요."></textarea>
                <input type="submit" value="등록">
           
            <div class="bt_wrap">
                 <button type="button" onclick="location='board_main.jsp'">목록</button>
            <%if(mem_info.getMem_id().equals(result.getMem_id())){ %>
                 <button type="button" onclick="location='board_edit.jsp'">수정</button>
                 <button type="button" onclick="location='BoardDelete?b_idx=<%=b_idx%>'">삭제</button>
            <%}%>
                
            </div>    
        </div>
    </div>
</body>
</html>