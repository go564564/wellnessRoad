package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MembersDTO;

public class CheckPasswordService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		MembersDTO mem_info = (MembersDTO)request.getSession().getAttribute("mem_info");	
		
		String currentPassword = request.getParameter("currentPassword");
		
		if(mem_info != null && mem_info.getMem_pw().equals(currentPassword)) {
			response.getWriter().write("success");
		}else {
			response.getWriter().write("failure");
			}
		
		
	}

}
