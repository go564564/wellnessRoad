package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MembersDAO;

public class IdCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("IdCheckService 도착");
		String inputID = request.getParameter("inputID");
		
		boolean checkID = new MembersDAO().idCheck(inputID);
		
		PrintWriter out;
		
		try {
			out = response.getWriter();
			out.print(checkID);
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
