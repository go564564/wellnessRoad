package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.IdNameDayDTO;
import com.smhrd.model.PoiDAO;

public class GetIdNameDay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("mem_id");	
		
		List<IdNameDayDTO> allTrip = new ArrayList<IdNameDayDTO>();		
				
		PoiDAO poiDao = new PoiDAO(); 
		
		allTrip = poiDao.allTripGet(id);

		
		// Gson 객체 생성
		Gson gson = new Gson();

		// 데이터를 JSON 형식으로 변환
		String jsonData = gson.toJson(allTrip);

		// 응답 보내기
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonData);
		
		
	}

}
