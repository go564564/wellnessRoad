package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.google.gson.Gson;
import com.smhrd.model.PoiDTO;
import com.smhrd.db.SqlSessionManager;
import com.smhrd.model.TagSelectDTO;

public class poiGet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 PoiDTO poi = new PoiDTO();
		
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

			List<PoiDTO> tempArray = new ArrayList<PoiDTO>();
			
			List<String> validTags = Arrays.asList("관광", "바다", "자연", "치유의 숲", "휴양림","힐링","템플스테이","캠핑");
			
		    int num = Integer.parseInt(request.getParameter("num"))*10;
			String tag = request.getParameter("tag");
					
		    if(tag.equals("모두보기")) {
		    	
			tempArray = sqlSession.selectList("poiSelect", num);
			
		    
		    }else if(validTags.contains(tag)){	
		    	
		    tempArray = sqlSession.selectList("poiSelectTag",new TagSelectDTO(num,tag));
		    	
		   }else{
		    	
		    tempArray = sqlSession.selectList("poiSelectRegion",new TagSelectDTO(num,tag));	
		    
		    };
			
		    
			Gson gson = new Gson();	        
			
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();			
			
			out.print(gson.toJson(tempArray));	
					
			sqlSession.close();  
        
	}

}
