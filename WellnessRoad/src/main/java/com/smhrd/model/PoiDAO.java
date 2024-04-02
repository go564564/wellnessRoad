package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class PoiDAO {

	// SqlSessionFactiory 불러오기 : DB관련 기능을 사용할 수 있는 세션을 만들어주는 공장.
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 각 기능을 수행하는 세션을 저장하는 변수
	SqlSession sqlSession;

	// 기존 DAO 처럼 각 SQL 문을 실행할 메서드 만들기
	public int insertPoi(InsPoiDTO poi) {

		sqlSession = sqlSessionFactory.openSession(true);

		int success = 0;

		// try catch 를 쓰는 이유 -> 실행시 결과가 없을수도 있으므로
		try {
			success = sqlSession.insert("insertPoi", poi);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return success;

	}

	public int updatePoi(InsPoiDTO poi) {

		sqlSession = sqlSessionFactory.openSession(true);

		int success = 0;

		// try catch 를 쓰는 이유 -> 실행시 결과가 없을수도 있으므로
		try {
			success = sqlSession.insert("updatePoi", poi);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return success;

	}

	// id 와 day 만 체크
	public InsPoiDTO checkPoi(InsPoiDTO poi) {

		sqlSession = sqlSessionFactory.openSession(true);

		InsPoiDTO tempDTO = null;

		// try catch 를 쓰는 이유 -> 실행시 결과가 없을수도 있으므로
		try {
			tempDTO = sqlSession.selectOne("checkPoi", poi);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return tempDTO;

	}

	public InsPoiDTO checkData(InsPoiDTO poi) {

		sqlSession = sqlSessionFactory.openSession(true);

		InsPoiDTO tempDTO = null;
		
		try {
			tempDTO = sqlSession.selectOne("checkData", poi);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return tempDTO;

	}

	public PoiDTO getData(int scheduleArray) {

		sqlSession = sqlSessionFactory.openSession(true);

		PoiDTO tempDTO = null;

		try {
			tempDTO = sqlSession.selectOne("getData", scheduleArray);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return tempDTO;

	}

	

	public List<Integer> getDayData(int id) {
	    sqlSession = sqlSessionFactory.openSession(true);
	    List<Integer> dayData = null;
	    try {
	        dayData = sqlSession.selectList("getDayData", id);       
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        sqlSession.close();
	    }
	    return dayData;
	}

	public int deletePoi(InsPoiDTO poi) {
	    sqlSession = sqlSessionFactory.openSession(true);
	    
	    int res = 0;
	    try {
	        res = sqlSession.delete("deletePoi",poi);       
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        sqlSession.close();
	    }
	    return res;
	}
	
	public List<IdNameDayDTO> allTripGet(String id) {
	    sqlSession = sqlSessionFactory.openSession(true);
	    
	    List<IdNameDayDTO> temp = null;
	    
	    try {
	    	
	        temp = sqlSession.selectList("allTripGet",id);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        sqlSession.close();
	    }

	    return temp;
	}
	
	public IdNameDayDTO getIdNameDay(int id) {
	    
		sqlSession = sqlSessionFactory.openSession(true);
	    
		IdNameDayDTO temp = null;
	    
	    try {
	    	
	        temp = sqlSession.selectOne("getIdNameDay",id);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        sqlSession.close();
	    }

	    return temp;
	}
}
