package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MembersDAO;
import com.smhrd.model.MembersDTO;
import com.smhrd.model.MembersDAO;
import com.smhrd.model.MembersDTO;


public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("UpdateService 도착");
		PrintWriter out = response.getWriter();

		
		String p_mem_pw = request.getParameter("p_mem_pw");
		String n_mem_pw = request.getParameter("n_mem_pw");
		
		System.out.println(p_mem_pw);
		System.out.println(n_mem_pw);
		HttpSession session = request.getSession();
		
		MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info");
		// MemberDTO 객체 생성하기
		MembersDTO updateMember  = new MembersDTO(mem_info.getMem_id(),n_mem_pw);
		
		//DAO에 기능 update기능 호출하기
		int cnt = new MembersDAO().updateMember(updateMember);
		
		//콘솔창에서 성공 실패 확인하기
		if(cnt>0) {
			
			System.out.println("수정 성공");
			//session.setAttribute("info", updateMember);
			
			response.setContentType("text/html; charset='UTF-8'");
			out.println("<script>alert('회원정보 수정 완료!'); location.href='Main.jsp'</script>");
			out.close();
		}else {
			response.setContentType("text/html; charset=UTF-8");
			System.out.println("수정 실패..");
			out.println("<script>alert('오류발생!');</script>");
			out.close();
		}
		
		
		
	
	
	}

}
