package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.memberDAO;
import com.healthGenie.www.DTO.memberDTO;

public class modifyMembershipOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String gender = request.getParameter("gender");
		memberDTO dto = new memberDTO();
		dto.setGender(gender);
		dto.setPassword(password);
		dto.setPhoneNumber(phoneNumber);
		memberDAO dao = memberDAO.getMemberDAO();
		dao.modifyMembershipOKDAO(dto);
	}
	
}
