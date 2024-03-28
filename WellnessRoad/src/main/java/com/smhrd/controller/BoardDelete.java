package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.BoardsDAO;

public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("del 도착");
		
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));		
		System.out.println(b_idx);
		
		int cnt = new BoardsDAO().delBoard(b_idx);
		
		if (cnt > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
		response.sendRedirect("board_main.jsp");
	}

}
