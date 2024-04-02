package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class TripsDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int makeTrip(TripsDTO tdto) {
		int result = sqlSession.insert("makeTrip", tdto);
		if(result>0) {
			System.out.println("일정  db 생성 성공!");
			int trip_idx = tdto.getTrip_idx();
			System.out.println("TripsDAO trip idx : "+trip_idx);
		}
		sqlSession.close();
		return result;
	}
	


	// 데이터 전체 조회
	public ArrayList<TripsDTO> iwanttoseetripsname(){
		ArrayList<TripsDTO> triplist = new ArrayList<TripsDTO>();
		
		
		try {
			triplist = (ArrayList)sqlSession.selectList("showTrips");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return triplist;
	}

	
	
	

	
	
	
	
}
