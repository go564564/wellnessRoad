package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.InsPoiDTO;
import com.smhrd.model.PoiDAO;
import com.smhrd.model.PoiDTO;

public class getData extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int id = Integer.parseInt(request.getParameter("id"));
			int day = Integer.parseInt(request.getParameter("day"));
			
			System.out.println(id);
			System.out.println(day);
			
			InsPoiDTO checkDTO = new InsPoiDTO(id,day);
			
			PoiDAO poiDao = new PoiDAO(); 
			
			String tempDTO = poiDao.checkDataGetData(checkDTO);
			
			if(tempDTO!=null) {
			String scheduleString = tempDTO;			
			
			String[] scheduleArray = scheduleString.split(",");
			
			List<PoiDTO> tempArray = new ArrayList<PoiDTO>();
			
			PoiDTO poiDto = new PoiDTO();
			
			for (int i = 0; i < scheduleArray.length; i++) {							    
				poiDto = poiDao.getData(Integer.parseInt(scheduleArray[i]));
				tempArray.add(poiDto);
			}					
			
			Gson gson = new Gson();	        
			
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();			
			
			out.print(gson.toJson(tempArray));
			}
			
	}

}
