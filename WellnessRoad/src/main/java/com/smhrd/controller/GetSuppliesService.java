package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.smhrd.model.SuppliesDAO;
import com.smhrd.model.SuppliesDTO;

public class GetSuppliesService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int trip_idx = Integer.parseInt(request.getParameter("trip_idx"));
		
		SuppliesDAO dao = new SuppliesDAO();
		
		List<SuppliesDTO> suppliesList = dao.getSuppliesTripIdx(trip_idx);
		
		JSONArray suppliesJsonArray = new JSONArray(suppliesList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		
		response.getWriter().write(suppliesJsonArray.toString());
		System.out.println("GetSupp 도착");
		System.out.println(suppliesList.get(1).getSupply_status());
	
	
	}

}
