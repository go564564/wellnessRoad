package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.LinkDataDTO;
import com.smhrd.model.TagDAO;

public class LinkDataMainSche extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		
		HttpSession session = request.getSession();
		
		String idParam = request.getParameter("id");
		
		int trip_idx = 0;				
		
		// id 파라미터가 존재하는 경우
		if (idParam != null && !idParam.isEmpty()) {
		    // id 파라미터를 정수로 파싱하여 trip_idx에 할당합니다.
		    trip_idx = Integer.parseInt(idParam);
		} else {
		    // 세션에서 trip_idx 데이터를 가져옵니다.
		    Object tripIdxObj = session.getAttribute("trip_idx");

		    // 세션에서 trip_idx 데이터가 존재하는 경우
		    if (tripIdxObj != null) {
		        // trip_idx에 세션에서 가져온 값으로 할당합니다.
		        trip_idx = (int) tripIdxObj;
		    } 
		}
		
		
		String[] tag = { "영광,장성", "함평,무안,나주", "신안,목포,영암", "진도,해남,완도", "장흥,화순", "담양,곡성", "보성,순천,고흥", "여수",
				"광양,구례", "관광", "바다", "자연", "치유의 숲", "휴양림","힐링","템플스테이","캠핑"};
		
		
		String trip_name = request.getParameter("name");
		
		String st_dt = request.getParameter("st_dt");
		String ed_dt = request.getParameter("ed_dt");
		
		
		int[] idTag = new int[tag.length+1]; // 크기가 15인 배열 생성

		

		// idTag[0] = trip_idx; // 배열에 값 할당

		

		// 모두보기 갯수 넣기
		TagDAO tagDao = new TagDAO();

		idTag[0] = tagDao.selectAllData();
				
		int temp = 0; // 나머지 데이터 갯수 조회
		for (int i = 0; i < tag.length; i++) {

			if (i < 9) {

					temp = tagDao.selectRegion(tag[i]);
					
					System.out.println(tag[i]+" : "+temp);

				

			} else {

				temp = tagDao.selectTag(tag[i]);
				System.out.println(tag[i]+" : "+temp);

			}

			idTag[i+1] = temp;
			temp = 0;
		}

		
		LinkDataDTO linkData = new LinkDataDTO(trip_idx, trip_name, st_dt, ed_dt, idTag);
		
		request.setAttribute("linkData", linkData);		
		
		request.getRequestDispatcher("/scheduleMainPageFinal.jsp").forward(request,
		response);

	}

}
