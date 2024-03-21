package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MembersDAO;
import com.smhrd.model.MembersDTO;

public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	
	
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	String mem_nick = request.getParameter("mem_nick");
	String mem_email = request.getParameter("mem_email");
	
	MembersDTO dto = new MembersDTO(mem_id, mem_pw, mem_nick, mem_email);
	MembersDAO dao = new MembersDAO();
	
	int result = dao.join(dto);
	
	if(result>0) {
		request.setAttribute("mem_email", mem_email);
		RequestDispatcher rd = request.getRequestDispatcher("JoinTest.jsp");
		rd.forward(request, response);
				
	}else {
		response.sendRedirect("JoinTest.jsp");
	}
	
	
	}

}
