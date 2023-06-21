package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.memberDAO;
import com.healthCare.www.DTO.memberDTO;

public class memberViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = memberDAO.getMemberDAO();
		
		String num = request.getParameter("num");
		System.out.println("memberView num : " + num);
		
		int memberNum = Integer.parseInt(num);
		memberDTO dto = dao.memerViewDAO(memberNum);
		request.setAttribute("memberDTO", dto);
		
	}
	
}
