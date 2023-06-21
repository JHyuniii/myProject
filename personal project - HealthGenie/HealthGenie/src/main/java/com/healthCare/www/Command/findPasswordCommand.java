package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.memberDAO;
import com.healthCare.www.DTO.memberDTO;

public class findPasswordCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao =  memberDAO.getMemberDAO();
		memberDTO dto = new memberDTO();
		
		String phoneNumber = request.getParameter("phoneNumber");
		String id = request.getParameter("id");
		
		dto.setPhoneNumber(phoneNumber);
		dto.setUserId(id);
		
//		dto = dao.findPasswordDAO(dto);
		
		
//		memberDTO memberDTO = dao.findPasswordDAO(dto);
		String result = dao.findPasswordDAO(dto);
		if(result != null) {
			request.setAttribute("searchPassword", result);
			request.setAttribute("passwordExistence", true);
		}
		else if(result == null){
			request.setAttribute("passwordExistence", false);
			System.out.println("비밀번호 찾기 실패!");
		}
	}
	
}
