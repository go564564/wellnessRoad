package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MembersDAO;


public class pwCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		System.out.println("pwCheck 도착");
		String inputPw = request.getParameter("inputPw");
		
		boolean checkPw = new MembersDAO().pwCheck(inputPw);
		
		PrintWriter out;
		
		try {
			out = response.getWriter();
			out.print(checkPw);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	
	
		
		
	}

}
