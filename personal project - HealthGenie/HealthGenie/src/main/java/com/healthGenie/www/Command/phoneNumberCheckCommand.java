package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.memberDAO;

public class phoneNumberCheckCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = memberDAO.getMemberDAO();
		int result = dao.phoneNumberCheckDAO(request.getParameter("phoneNumber"));
		request.setAttribute("result", result);
	}
	
}
