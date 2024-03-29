
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
	//  마이페이지 비밀번호 수정란
	public int updateMember(MembersDTO updateMember){
		int cnt = 0;
		
		
		try {
	        // MyBatis 매퍼 파일에 정의된 update 문의 id와, 업데이트할 데이터를 담고 있는 객체를 전달
	        cnt = sqlSession.update("updateMember", updateMember);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (sqlSession != null) {
	            sqlSession.close();
	        }
	    }
		
		return cnt;
	}
	// 비번 중복 검사
	public boolean pwCheck(String inputPw) {
		boolean checkPw = false;
		try {
			checkPw = sqlSession.selectOne("pwCheck", inputPw);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();	
		}
		return checkPw;
		
		
	}
	
	
}
