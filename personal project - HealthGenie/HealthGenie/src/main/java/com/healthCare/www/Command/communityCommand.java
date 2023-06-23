package com.healthCare.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.postDAO;
import com.healthCare.www.DTO.postDTO;

public class communityCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		postDAO dao = postDAO.getPostDAO();
		ArrayList<postDTO> list = dao.communityViewDAO();
		if(list != null) {
			request.setAttribute("list", list);
		} else {
			System.out.println("커뮤니티 글 불러오기 실패");
		}
	}
}
