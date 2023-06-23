package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.postDAO;
import com.healthGenie.www.DTO.postDTO;

public class communityCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		postDAO dao = postDAO.getPostDAO();
		ArrayList<postDTO> list = dao.communityViewDAO();
		if(list != null) {
			request.setAttribute("list", list);
		}
	}
}
