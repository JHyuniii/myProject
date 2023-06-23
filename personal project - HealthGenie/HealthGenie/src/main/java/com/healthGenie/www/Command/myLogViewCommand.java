package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.myLogDAO;
import com.healthGenie.www.DTO.myLogListDTO;

public class myLogViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myLogDAO dao = myLogDAO.getMyLogDAO();
		
		String logId = request.getParameter("logId");
		
		myLogListDTO dto = dao.myLogViewDAO(logId);
		request.setAttribute("dto", dto);
	}
	
}
