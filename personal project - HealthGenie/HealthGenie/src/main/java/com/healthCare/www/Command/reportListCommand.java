package com.healthCare.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.reportDAO;
import com.healthCare.www.DTO.reportDTO;

public class reportListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reportDAO dao = reportDAO.getReportDAO();
		
		ArrayList<reportDTO> list = dao.reportListDAO();
		if(list.isEmpty()) {
			System.out.println("reportList is null");
		}
		request.setAttribute("reportList", list);
	}
	
}
