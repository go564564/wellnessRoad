package com.smhrd.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BoardsDAO;
import com.smhrd.model.BoardsDTO;
import com.smhrd.model.MembersDTO;
import com.smhrd.model.TripScheDAO;
import com.smhrd.model.TripScheDTO;


public class CreateTripSche extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		TripScheDTO trip_id =(TripScheDTO)session.getAttribute("schedule");
		
		int trip_idx = trip_id.getTrip_idx();
		

		
		System.out.println(trip_idx);
		
		TripScheDTO Tripdto = new TripScheDTO();
		TripScheDAO dao = new TripScheDAO();
		
		Tripdto.setTrip_idx(trip_idx);
		
		
		ArrayList<TripScheDTO> result = dao.all_info();
		
		
		
		
		
//		if(result > 0) {
//			System.out.println("게시글 등록 성공!");
//		}else {
//			System.out.println("등록 실패");
//		}
	
		
		
		
		response.sendRedirect("board_view.jsp");
		
		
		
		
		
	}

}
