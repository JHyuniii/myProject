package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.bodyInfoDAO;

public class bodyInfoDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyInfoDAO dao = bodyInfoDAO.getbodyInfoDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		dao.bodyInfoDelete(userId);
	}
	
}
