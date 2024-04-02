package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pagesPoi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cata1 = request.getParameter("cata1");
		String cata2 = request.getParameter("cata2");
		
		System.out.println(cata1);
		System.out.println(cata2);
		
	}

}
