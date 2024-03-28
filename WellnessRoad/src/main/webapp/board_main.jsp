<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
		List<BoardsDTO> list = new ArrayList<BoardsDTO>();
		String vpage = request.getParameter("vpage");
		if(vpage==null){
			vpage="1";
		}
		int v_page=Integer.parseInt(vpage);
		int total=dao.BoardsTotal();
		int pageSize=10;
		int startRow=(v_page-1)*pageSize+1; //시작행
		int endRow=v_page*pageSize; //마지막행	
		list = dao.Show_allBoard(endRow);
		//int lastpage=(int)Math.ceil((double)total/10);		
		System.out.print("페이지"+v_page  +"시작행"+startRow  +"끝행"+endRow+"전체게시물수"+total);
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
                    <div class="count">조회수</div>
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
                    
          <% if(mem_info !=null){%>
            <div class="bt_wrap">
                 <button type="button" class="on" id="writePost" onclick="location='board_write.jsp'">글쓰기</button>
            </div>
          <%}%> 
                 
            </div>
  <%	// 페이징  처리
				if(total > 0){
							// 총 페이지의 수
				int pageCount = total / pageSize + (total%pageSize == 0 ? 0 : 1);

							// 한 페이지에 보여줄 페이지 블럭(링크) 수
				int pageBlock = 10;

							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							
				int startPage = ((v_page-1)/pageBlock)*pageBlock+1;
				int lastpage=(int)Math.ceil((double)total/10);	
				System.out.print("stp"+startPage+"lastp"+lastpage);
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당	
				if(lastpage > pageCount){
					lastpage = pageCount;
							}
							
				if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
					<a href="board_main.jsp?vpage=<%=startPage - 10%>" class="bt prev"><</a>	
					<%			
							}
							
							for(int i=startPage; i <= lastpage; i++){ // 페이지 블록 번호
								if(i == total){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="board_main.jsp?vpage=<%=i%>" class="num on"><%=i%></a>
					<%	
								}
							} // for end
							
							if(lastpage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="board_main.jsp?vpage=<%=startPage + 10 %>" class="bt next">></a>
					<%			
							}
						}
					%>

        </div>
    </div>
</body>

</html>