package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.SuppliesDAO;
import org.json.JSONObject;

public class UpdateSupply extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UpdateSupply도착");
        String supplyName = request.getParameter("name");
        boolean isChecked = Boolean.parseBoolean(request.getParameter("status"));

        System.out.println("준비물 명 : " + supplyName);
        System.out.println("준비물 상태 : " + isChecked);

        // 데이터를 받았으니까 업데이트해야 함 db로
        SuppliesDAO dao = new SuppliesDAO();
        int result = dao.updateSupplies(supplyName);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        if (result > 0) {
            jsonResponse.put("success", true);
            jsonResponse.put("message", "업데이트 성공ㅇ");
        } else {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "업데이트 실패 . .  ");
        }

        out.print(jsonResponse.toString());
        out.flush();
        out.close();
    }
}
