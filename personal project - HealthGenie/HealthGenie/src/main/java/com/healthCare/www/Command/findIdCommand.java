package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.memberDAO;
import com.healthCare.www.DTO.memberDTO;

public class findIdCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao =  memberDAO.getMemberDAO();
		memberDTO dto = new memberDTO();
		
		String phoneNumber = request.getParameter("phoneNumber");
		String birthStr = request.getParameter("birth");
		String birth = birthStr.replaceAll("-", "");
		
		dto.setPhoneNumber(phoneNumber);
		dto.setBirth(birth);
		
		String result = dao.findIdDAO(dto);
		if(result != null) {
			request.setAttribute("searchId", result);
			request.setAttribute("idExistence", true);
			System.out.println("searchId : " + result);
		}
		else if(result == null){
			request.setAttribute("idExistence", false);
		}
	}
	
}
