package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.reportDAO;
import com.healthCare.www.DTO.reportDTO;

public class reportViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reportNum = Integer.parseInt(request.getParameter("reportNum"));
		reportDAO dao = reportDAO.getReportDAO();
		reportDTO dto = dao.reportViewDAO(reportNum);
		request.setAttribute("reportDTO", dto);
	}
	
}
