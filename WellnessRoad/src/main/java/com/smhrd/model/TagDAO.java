package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class TagDAO {

		// SqlSessionFactiory 불러오기 : DB관련 기능을 사용할 수 있는 세션을 만들어주는 공장.
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

		// 각 기능을 수행하는 세션을 저장하는 변수
		SqlSession sqlSession;

		// 기존 DAO 처럼 각 SQL 문을 실행할 메서드 만들기
		public int selectAllData() {

			sqlSession = sqlSessionFactory.openSession(true);

			int success = 0;

			// try catch 를 쓰는 이유 -> 실행시 결과가 없을수도 있으므로
			try {
				success = sqlSession.selectOne("selectAllData");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
				
			return success;

		}

		
		public int selectTag(String tag) {

			sqlSession = sqlSessionFactory.openSession(true);

			int success = 0;

			// try catch 를 쓰는 이유 -> 실행시 결과가 없을수도 있으므로
			try {
				success = sqlSession.selectOne("selectTag",tag);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

			return success;

		}
	
		public int selectRegion(String region) {

			sqlSession = sqlSessionFactory.openSession(true);

			int success = 0;

			// try catch 를 쓰는 이유 -> 실행시 결과가 없을수도 있으므로
			try {
				success = sqlSession.selectOne("selectRegion",region);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

			return success;

		}
		
		
	
}
