
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
		
		return result;
	}
	
	public MembersDTO login(MembersDTO dto) {
		
		
	 	MembersDTO result = sqlSession.selectOne("login", dto);
		 
		sqlSession.close();
		
		return result;
	}
	
	public boolean idCheck(String inputID) {
		boolean checkID = false;
		try {
			checkID = sqlSession.selectOne("idCheck", inputID);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();	
		}
		return checkID;

		
		
	}
	
	public boolean nickCheck(String inputNick) {
		boolean checkNick = false;
		try {
			checkNick = sqlSession.selectOne("nickCheck", inputNick);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();	
		}
		return checkNick;
		
		
	}
	
	
	
	
	
}
