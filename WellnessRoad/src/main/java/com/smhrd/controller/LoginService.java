package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MembersDAO;
import com.smhrd.model.MembersDTO;

public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		MembersDTO dto = new MembersDTO(mem_id, mem_pw);
		MembersDAO dao = new MembersDAO();
		MembersDTO result = dao.login(dto);
		
		if(result!=null) {
			System.out.println("로그인 성공!");
			
			// 회원정보 session  ===> mem_info
			HttpSession session = request.getSession();
			session.setAttribute("mem_info", result);
			response.sendRedirect("Main.jsp");
		}else {
			System.out.println("로그인 실패 . .");
			response.sendRedirect("Login.jsp");
		}
		
		
	}

}
