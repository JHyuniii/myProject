package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.reportDAO;
import com.healthGenie.www.DTO.reportDTO;

public class reportListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reportDAO dao = reportDAO.getReportDAO();
		
		ArrayList<reportDTO> list = dao.reportListDAO();
		request.setAttribute("reportList", list);
	}
	
}
