package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class SuppliesDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	public boolean insertSupply(SuppliesDTO dto) {
		try {
			int row = sqlSession.insert("insertSupplies", dto);
			sqlSession.commit();
			if (row > 0) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			sqlSession.close();
		}
	}

	public List<SuppliesDTO> getSuppliesTripIdx(int trip_idx) {
		return sqlSession.selectList("getSupplies", trip_idx);
	}

	public int updateSupplies(String supply_name) {
		int result = sqlSession.update("updateSupplies", supply_name);
		if (result > 0) {
			System.out.println("준비물 업데이트 성공");
		}
		return result;
	}
	
	public int deleteSupplies(String supply_name) {
		int result = sqlSession.delete("deleteSupply", supply_name);
		if (result>0) {
			System.out.println("준비물 삭제 성공");
		}
		return result;
	}

}
