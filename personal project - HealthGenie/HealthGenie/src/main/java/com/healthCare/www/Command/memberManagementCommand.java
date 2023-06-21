package com.healthCare.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.memberDAO;
import com.healthCare.www.DTO.memberDTO;

public class memberManagementCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = memberDAO.getMemberDAO();
		ArrayList<memberDTO> list = dao.memberList();
		request.setAttribute("memberList", list);
	}
	
}
