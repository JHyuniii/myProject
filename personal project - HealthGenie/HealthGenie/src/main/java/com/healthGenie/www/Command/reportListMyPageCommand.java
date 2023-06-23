package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.reportMessageDAO;
import com.healthGenie.www.DTO.reportMessageDTO;

public class reportListMyPageCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		reportMessageDAO dao = reportMessageDAO.getReportMessageDAO();
		ArrayList<reportMessageDTO> reportMessageList = dao.reportListMyPageDAO(userId);
		request.setAttribute("reportMessageList", reportMessageList);
	}
	
}
