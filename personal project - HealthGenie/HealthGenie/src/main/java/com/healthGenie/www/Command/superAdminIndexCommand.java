package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.superAdminDAO;
import com.healthGenie.www.DTO.superAdminDTO;

public class superAdminIndexCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		superAdminDTO dto = new superAdminDTO();
		superAdminDAO dao = superAdminDAO.getSuperAdminDAO();
		
		dto.setMemberCount(dao.memberCountDAO());
		dto.setPostCount(dao.postCountDAO());
		dto.setQnaCount(dao.qnaCountDAO());
		dto.setReportCount(dao.reportCountDAO());
		
		request.setAttribute("dto", dto);
	}
	
}
