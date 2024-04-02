package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BoardCommentsDTO;
import com.smhrd.model.BoardsDAO;
import com.smhrd.model.MembersDTO;

public class BoardCommentService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		System.out.println("댓글서블릿 도착");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		MembersDTO mem_info=(MembersDTO)session.getAttribute("mem_info");
		
		String mem_id = mem_info.getMem_id();		
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));		
		String cmt_content = (String)request.getParameter("cmt_content");	
		BoardCommentsDTO dto = new BoardCommentsDTO();
		BoardsDAO dao = new BoardsDAO();
		
		
		dto.setB_idx(b_idx);
		dto.setMem_id(mem_id);
		dto.setCmt_content(cmt_content);
		
		int result = dao.b_cmt(dto);
		
		if (result > 0) {
			System.out.println("댓글 등록 성공!");
			
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>alert('댓글이 등록되었습니다.'); location.href='board_view.jsp'</script>");
			out.close();
		} else {
			System.out.println("등록 실패!");
		}
		request.getRequestDispatcher("board_view.jsp").forward(request, response);
		
	}

}
