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
	<%
	int B_IDX = Integer.parseInt(request.getParameter("b_idx"));
	BoardsDAO dao = new BoardsDAO();
	BoardsDTO result = dao.show_DetailBoard(B_IDX);
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
                        <dd name="b_idx"><%=result.getB_idx()%></dd>
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
                        <dd name="b_views"><%=result.getB_views()+1%></dd>
                    </dl>
                </div>
                <div class="cont">
					<%=result.getB_content()%>
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