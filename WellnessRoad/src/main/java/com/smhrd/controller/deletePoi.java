package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.InsPoiDTO;
import com.smhrd.model.PoiDAO;

public class deletePoi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		int id = Integer.parseInt(request.getParameter("id"));
		int day = Integer.parseInt(request.getParameter("day"));
		
		InsPoiDTO checkPoi = new InsPoiDTO(id,day);
					
		PoiDAO poiDao = new PoiDAO();
		
		InsPoiDTO tempDTO = poiDao.checkPoi(checkPoi);
		
		System.out.println(tempDTO);
		
		PrintWriter out = response.getWriter();
		int i = 0;
		 if (tempDTO!=null) {
	            i = poiDao.deletePoi(checkPoi);
	        } else {
	            System.out.println("삭제할거시 없어요");
	        }

	        out.print(i);
		
		
        }
		
		
	}
