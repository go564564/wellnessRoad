package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BoardsDAO;
import com.smhrd.model.BoardsDTO;
import com.smhrd.model.MembersDTO;

public class BoardWriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		MembersDTO mem_info=(MembersDTO)session.getAttribute("mem_info");
		
		String mem_id = mem_info.getMem_id();
		String b_title = request.getParameter("b_title");
		String b_content = request.getParameter("b_content");
		
		System.out.println(b_title+"  "+b_content+"  "+ mem_id);
		
		BoardsDTO dto = new BoardsDTO();
		BoardsDAO dao = new BoardsDAO();
		
		dto.setB_title(b_title);
		dto.setB_content(b_content);
		dto.setMem_id(mem_id);
		
		int result = dao.upload_post(dto);
		
		if(result > 0) {
			System.out.println("게시글 등록 성공!");
		}else {
			System.out.println("등록 실패");
		}
	}

}
