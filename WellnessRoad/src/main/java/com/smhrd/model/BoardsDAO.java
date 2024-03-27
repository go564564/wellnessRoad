package com.smhrd.model;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class BoardsDAO {

	SqlSessionFactory sqlSessionFactory  = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
// 게시글 업로드
	public int upload_post(BoardsDTO dto) {
		System.out.println("BoardsDAO 도착");
		
				
		int result = sqlSession.insert("upload",dto);
		System.out.println(result);
		if(result > 0) {
			System.out.println("업로드 성공!");
		}
		sqlSession.close();
		
		return result;
	}

// 메인게시판 전체 데이터 가져오기
	public ArrayList<BoardsDTO> Show_allBoard(){
		ArrayList<BoardsDTO> list = new ArrayList<BoardsDTO>();
		
		
		try {
			list = (ArrayList)sqlSession.selectList("Show_allBoard");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}

	// 메인게시판에서 해당 게시물만 가져오기
	public BoardsDTO show_DetailBoard(int B_IDX) {
		BoardsDTO list = null;
		try {
			list = (BoardsDTO)sqlSession.selectOne("show_DetailBoard",B_IDX);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;	
	
	}
}
