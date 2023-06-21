package com.healthCare.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.postDAO;
import com.healthCare.www.DTO.commentDTO;
import com.healthCare.www.DTO.postDTO;
import com.healthCare.www.DTO.postImgDTO;

public class postViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		postDAO dao = postDAO.getPostDAO();
		
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		
		postDTO postDTO = dao.postView(postNum);
		ArrayList<commentDTO> list = new ArrayList<>();
		list = dao.commentList(postNum);
		
		request.setAttribute("postDTO", postDTO);
		request.setAttribute("list", list);
		
		request.setAttribute("postNum", postNum);
		
		String fileName = dao.postViewImg(postNum);
		if(fileName != null) {
			request.setAttribute("fileName", fileName);
		} else if(fileName == null) {
			request.setAttribute("fileName", null);
		}
		
		System.out.println("가져온 이미지 이름 : " + fileName);
	}
}
