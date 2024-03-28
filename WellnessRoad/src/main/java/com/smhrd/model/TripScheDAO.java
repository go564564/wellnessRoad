package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class TripScheDAO {

	// 데이터 
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public ArrayList<TripScheDTO> all_info(){
		ArrayList<TripScheDTO> list = new ArrayList<TripScheDTO>();
		
		
		try {
			list = (ArrayList)sqlSession.selectList("show_allSche");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}

	
	
	
}
