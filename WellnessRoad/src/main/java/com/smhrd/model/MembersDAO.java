package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.db.SqlSessionManager;

public class MembersDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public int join(MembersDTO dto) {
		int result = sqlSession.insert("join", dto);
		
		if(result>0) {
			System.out.println("회원 가입 성공!");
		}
		sqlSession.close();
		
		return 0;
	}
	
	
	
	
	
	
	
}
