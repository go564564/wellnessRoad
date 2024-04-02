package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.SuppliesDAO;

public class DeleteSupply extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		
		String supply_name = request.getParameter("name");
		System.out.println("삭제할 준비물 " + supply_name);
		
		SuppliesDAO dao = new SuppliesDAO();
		
		
		try {
			dao.deleteSupplies(supply_name);
			out.println("준비물 삭제 성공 ! ");
		}catch(Exception e) {
			out.println("준비물 삭제 실패 : " + e.getMessage());
		}
		
		
		
	}

}
