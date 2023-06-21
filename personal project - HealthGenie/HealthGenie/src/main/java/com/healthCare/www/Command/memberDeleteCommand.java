package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.memberDAO;

public class memberDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNum = Integer.parseInt(request.getParameter("memberNum"));
		memberDAO dao = memberDAO.getMemberDAO();
		int result = dao.memberDeleteDAO(memberNum);
		request.setAttribute("result", result);
	}
	
}
