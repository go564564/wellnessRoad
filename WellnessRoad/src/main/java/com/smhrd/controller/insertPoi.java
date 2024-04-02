package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.InsPoiDTO;
import com.smhrd.model.PoiDAO;

public class insertPoi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		int day = Integer.parseInt(request.getParameter("day"));
				
		String schedule = request.getParameter("schedule");
		
		InsPoiDTO insert = new InsPoiDTO(id,day,schedule);
					
		PoiDAO poiDao = new PoiDAO();
		
		InsPoiDTO tempDTO = poiDao.checkPoi(insert);
		
		System.out.println(tempDTO);
		int i=0;
		
		PrintWriter out = response.getWriter();
		
		 if (tempDTO == null) {
	            i = poiDao.insertPoi(insert);
	        } else if (tempDTO.getSchedule().equals(schedule)) {
	            i = 0;
	        } else {
	            i = poiDao.updatePoi(insert);
	        }

	        out.print(i);
		
		
        }
		
		
	}


