package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MembersDAO;

public class NickCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("NickCheckService 도착");
		String inputNick = request.getParameter("inputNick");
		
		boolean checkNick = new MembersDAO().nickCheck(inputNick);
		
		PrintWriter out;
		
		try {
			out = response.getWriter();
			out.print(checkNick);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	
	}

}
