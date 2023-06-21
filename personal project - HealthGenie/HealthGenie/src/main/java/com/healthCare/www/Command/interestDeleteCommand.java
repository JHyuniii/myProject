package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.interestListDAO;

public class interestDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String exerciseId = request.getParameter("exerciseId");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		interestListDAO dao = interestListDAO.getInterestListDAO();
		int result = dao.interestDeleteDAO(exerciseId, userId);
		request.setAttribute("result", result);
	}
	
}
