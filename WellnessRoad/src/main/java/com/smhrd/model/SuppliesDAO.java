package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;

public class SuppliesDAO {
    
    public int insertSupplies(SqlSession sqlSession, SuppliesDTO dto) {
        int result = sqlSession.insert("makeSupplies", dto);
        if (result > 0) {
            System.out.println("준비물 db 생성 성공");
        }
        return result;
    }
}
