package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.SuppliesDAO;
import com.smhrd.model.SuppliesDTO;

public class AddSupply extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		System.out.println("AddSupply 도착");
		
		String supply_name = request.getParameter("name");
		System.out.println(supply_name);
		int supply_status = Integer.parseInt(request.getParameter("status"));
		int trip_idx = Integer.parseInt(request.getParameter("trip_idx"));
		
		SuppliesDTO dto = new SuppliesDTO();
		dto.setSupply_name(supply_name);
		dto.setSupply_status(supply_status);
		dto.setTrip_idx(trip_idx);
		
		try {
			SuppliesDAO dao = new SuppliesDAO();
			boolean success = dao.insertSupply(dto);
			
			response.getWriter().print("{\"success\":" + success + "}");
            response.getWriter().flush();
		}catch(Exception e) {
			response.getWriter().print("{\"success\":" + e.getMessage() + "}");
            response.getWriter().flush();
		}
		
		
		
		
		
		
		
	}

}
