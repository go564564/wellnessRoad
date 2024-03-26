package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateTripService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("CreateTripService 도착");
		
	    String trip_name = request.getParameter("travelTitle");
		String st_dt = request.getParameter("startDate");
		String ed_dt = request.getParameter("endDate");
		
		System.out.println(trip_name+st_dt+ed_dt);
		
	
	
	
	}

}
