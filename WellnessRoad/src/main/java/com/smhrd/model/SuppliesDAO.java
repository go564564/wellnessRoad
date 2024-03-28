package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class SuppliesDAO {
    
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	public int insertSupplies(SqlSession sqlSession, SuppliesDTO dto) {
        int result = sqlSession.insert("makeSupplies", dto);
        if (result > 0) {
            System.out.println("준비물 db 생성 성공");
        }
        return result;
    }
    
    public List<SuppliesDTO> getSuppliesTripIdx(int trip_idx){
    	return sqlSession.selectList("getSupplies",trip_idx);
    }
    
    
    
    
    
}
