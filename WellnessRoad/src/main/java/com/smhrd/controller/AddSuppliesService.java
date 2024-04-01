package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.db.SqlSessionManager;
import com.smhrd.model.SuppliesDAO;
import com.smhrd.model.SuppliesDTO;

public class AddSuppliesService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        System.out.println("AddSuppliesService 도착");

        // Json 문자열 받기
        String suppliesString = request.getParameter("supplies");
        System.out.println("생문자열" + suppliesString);

        // json 문자열 JSONArray로 파싱??
        JSONArray jsonArray = new JSONArray(suppliesString);

        SuppliesDAO dao = new SuppliesDAO();
        int result = 0;
        SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
        SqlSession sqlSession = sqlSessionFactory.openSession();

        try {
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                String supplyName = jsonObject.getString("supply_name");
                int supply_status = jsonObject.getInt("supply_status");
                int trip_idx = jsonObject.getInt("trip_idx");
                SuppliesDTO dto = new SuppliesDTO(supplyName, supply_status, trip_idx);
                result = dao.insertSupplies(sqlSession, dto);
            }
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            sqlSession.rollback();
        } finally {
            sqlSession.close();
        }

        if (result > 0) {
            System.out.println("준비물 등록 성공");
            response.sendRedirect("supplies.jsp");
        } else {
            System.out.println("add sup등록 실패");
        }

    }

}
