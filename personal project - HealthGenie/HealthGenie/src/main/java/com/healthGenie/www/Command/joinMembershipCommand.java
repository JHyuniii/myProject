package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.memberDAO;
import com.healthGenie.www.DTO.memberDTO;

public class joinMembershipCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = memberDAO.getMemberDAO();

		memberDTO dto = new memberDTO();

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String phoneNumber = request.getParameter("phoneNumber");
		String gender = request.getParameter("gender");
		String birthStr = request.getParameter("birth");
		String birth = birthStr.replaceAll("-", "");
		System.out.println("변환한 생일 : " + birth);

		dto.setUserId(id);
		dto.setPassword(password);
		dto.setPhoneNumber(phoneNumber);
		dto.setGender(gender);
		dto.setBirth(birth);
		
		int result = dao.joinMemberShipDAO(dto);
		if(result > 0) {
			request.setAttribute("joinSuccessMsg", true);
		}
	}

}
