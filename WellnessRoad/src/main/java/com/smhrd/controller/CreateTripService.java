package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.TripsDAO;
import com.smhrd.model.TripsDTO;

public class CreateTripService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("CreateTripService 도착");
		
	    String trip_name = request.getParameter("travelTitle");
	    String mem_id = request.getParameter("mem_id");
		String st_dt = request.getParameter("startDate");
		String ed_dt = request.getParameter("endDate");
		System.out.println(trip_name+st_dt+ed_dt+mem_id);
		
		TripsDTO tdto = new TripsDTO(trip_name,mem_id,st_dt,ed_dt);
		TripsDAO tdao = new TripsDAO();	
		
		int result = tdao.makeTrip(tdto);
		int trip_idx = tdto.getTrip_idx();
		System.out.println("createTripservbidx"+tdto.getTrip_idx());
		
		HttpSession session = request.getSession();
		
		
		
		
		
		
		
		if(result>0) {
			session.setAttribute("trip_idx", trip_idx);
			response.sendRedirect("sessiontest.jsp?trip_idx=" + trip_idx);
		}
	
	
	}

}
