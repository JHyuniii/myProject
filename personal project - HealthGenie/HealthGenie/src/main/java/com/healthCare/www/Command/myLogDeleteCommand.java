package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.myLogDAO;

public class myLogDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String logId = request.getParameter("logId");
		myLogDAO dao = myLogDAO.getMyLogDAO();
		int result = dao.myLogDeleteDAO(logId);
		request.setAttribute("result", result);
	}
	
}
