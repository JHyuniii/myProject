package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.memberDAO;

public class idSuperCheckCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputSuperId = request.getParameter("inputSuperId");
		memberDAO dao = memberDAO.getMemberDAO();
		int result = dao.idSuperCheckDAO(inputSuperId);
		request.setAttribute("result", result);
	}
	
}
