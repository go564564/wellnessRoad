package com.smhrd.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.BoardsDAO;
import com.smhrd.model.BoardsDTO;
import com.smhrd.model.MembersDTO;

public class Board_edit extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      System.out.println("edit 서블릿 도착");
      request.setCharacterEncoding("UTF-8");

      HttpSession session = request.getSession();
      MembersDTO mem_info = (MembersDTO) session.getAttribute("mem_info");

      String path = "C:\\Users\\User\\git\\wellnessRoad\\WellnessRoad\\src\\main\\webapp\\b_imgs";
      // 서버에 파일을 저장할 디렉토리 경로
      int maxSize = 3 * 1024 * 1024; // 최대 3MB지정
      String encoding = "UTF-8"; // 인코딩 설정
      DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

      MultipartRequest multi = null;
      try {
         multi = new MultipartRequest(request, path, maxSize, encoding, rename);
      } catch (IOException e) {

         e.printStackTrace();
      }

      int b_idx = Integer.parseInt(multi.getParameter("b_idx"));
      String b_title = multi.getParameter("b_title");
      String mem_id = mem_info.getMem_id();
      String filename = multi.getFilesystemName("filename");
      if (filename != null) {
         try {
            filename = URLEncoder.encode(filename, "UTF-8");
         } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
         }
      }
      String b_content = multi.getParameter("b_content");

      System.out.println("b_idx : " + b_idx);
      System.out.println("title : " + b_title);
      System.out.println("writer : " + mem_id);
      System.out.println("filename : " + filename);
      System.out.println("content : " + b_content);

      // 데이터베이스 전달을 위한 작업!

      BoardsDAO b_dao = new BoardsDAO();
      BoardsDTO b_dto = new BoardsDTO();

      b_dto.setB_title(b_title);
      //b_dto.setMem_id(mem_id);
      b_dto.setB_content(b_content);
      b_dto.setFilename(filename);
      b_dto.setB_idx(b_idx);

      System.out.println(b_dto.getB_idx());
      int result = b_dao.update_post(b_dto);

      if (result > 0) {
         System.out.println("게시글 수정 성공!");
      } else {
         System.out.println("수정 실패!");
      }
      response.sendRedirect("board_main.jsp?b_idx=" + b_idx);
   }
}