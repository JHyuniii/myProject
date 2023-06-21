package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.myLogDAO;
import com.healthCare.www.DTO.myLogListDTO;

public class myLogViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myLogDAO dao = myLogDAO.getMyLogDAO();
		
		String logId = request.getParameter("logId");
		
		myLogListDTO dto = dao.myLogViewDAO(logId);
		request.setAttribute("dto", dto);
	}
	
}
