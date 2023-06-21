package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.postDAO;

public class postDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		postDAO dao = postDAO.getPostDAO();
		int result = dao.deletePostDAO(postNum);
		request.setAttribute("result", result);
	}
	
}
