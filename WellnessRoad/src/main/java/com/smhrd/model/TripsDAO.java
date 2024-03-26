package com.smhrd.model;

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
		}
		sqlSession.close();
		return result;
	}
	
	
	
	
	
	
}
