package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.memberDAO;

public class idCheckCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = memberDAO.getMemberDAO();
		int result = dao.checkRedundancyDAO(request.getParameter("id"));
		request.setAttribute("result", result);
	}
	
}
