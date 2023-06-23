package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.memberDAO;
import com.healthGenie.www.DTO.memberDTO;

public class modifyMembershipCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		memberDAO dao = memberDAO.getMemberDAO();
		memberDTO dto = dao.modifyMembershipDAO(userId);
		request.setAttribute("memberDTO", dto);
	}
	
}
