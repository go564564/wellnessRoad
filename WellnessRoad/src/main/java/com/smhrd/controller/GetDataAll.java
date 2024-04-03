package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.InsPoiDTO;
import com.smhrd.model.PoiDAO;
import com.smhrd.model.PoiDTO;
import com.smhrd.model.SelectAllPoiDTO;

public class GetDataAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		System.out.println("여행 아이디 "+id);
		
		PoiDAO poiDao = new PoiDAO(); 
		
		List<Integer> intArray = poiDao.getDayData(id);
		
		System.out.println("여행 아이디 "+intArray);
		
		List<SelectAllPoiDTO> tempArray = new ArrayList<SelectAllPoiDTO>();
		
				
		for(int i=0;i<intArray.size();i++) {
			String temp =poiDao.checkData(new InsPoiDTO(id,intArray.get(i)));
			String scheduleString = temp;			
			
			System.out.println("tempDTO 오냐?"+temp);
			
			String[] scheduleArray = scheduleString.split(",");
						
			PoiDTO poiDto = new PoiDTO();			
			
			for (int j = 0; j < scheduleArray.length; j++) {							    
				poiDto = poiDao.getData(Integer.parseInt(scheduleArray[j]));				
				tempArray.add(new SelectAllPoiDTO(intArray.get(i),poiDto.getPoi_name(),poiDto.getPoi_img()));
			}	
			
		};
		
	
		
		Gson gson = new Gson();	        
		
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();			
		
		out.print(gson.toJson(tempArray));
		
	
		
	}

}
