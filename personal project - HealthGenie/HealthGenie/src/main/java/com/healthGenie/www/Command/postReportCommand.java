package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.reportDAO;
import com.healthGenie.www.DTO.reportDTO;

public class postReportCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		String reportContents = request.getParameter("reportContents");
		
		reportDTO dto = new reportDTO();
		dto.setPostNum(postNum);
		dto.setReportContents(reportContents);
		
		reportDAO dao = reportDAO.getReportDAO();
		dao.postReportInsertDAO(dto);
	}
	
}
