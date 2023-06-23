package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.postDAO;
import com.healthGenie.www.DTO.postDTO;
import com.healthGenie.www.DTO.postImgDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class writePostCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		postDAO dao = postDAO.getPostDAO();
		
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("healthPostIMG");

		int size = 1024 * 1024 * 15; // 15M - 최대 사이즈

		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		String str = "";
		String fileName = "";
		String oriFile = "";

		
		try {
		    String name = multi.getParameter("name");

		    @SuppressWarnings("unchecked")
			Enumeration<String> files = multi.getFileNames();
		    while (files.hasMoreElements()) {
		        str = files.nextElement();
		        fileName = multi.getFilesystemName(str);
		        oriFile = multi.getOriginalFileName(str);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}

	       HttpSession session = request.getSession();
	       String userId = (String) session.getAttribute("id");
	       
	       
	       postImgDTO postImgDTO = new postImgDTO();
	       postImgDTO.setFileName(fileName);
	       postImgDTO.setUserId(userId);
	       
	       String title = multi.getParameter("title");
	       String content = multi.getParameter("content");
	       
	       postDTO postDTO = new postDTO();
	       postDTO.setUserId(userId);
	       postDTO.setTitle(title);
	       postDTO.setContent(content);
	       
	       int result = dao.writePostDAO(postDTO, postImgDTO);
	       if(result < 0) {
				request.setAttribute("error", "글 작성에 실패하였습니다. 다시 시도해주세요."); // 오류 메시지 설정
				request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
			}
	}
}
