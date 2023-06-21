package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.reportDAO;
import com.healthCare.www.DTO.reportDTO;

public class commentReportCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String reportContents = request.getParameter("reportContents");
		
		reportDTO dto = new reportDTO();
		dto.setCommentNum(commentNum);
		dto.setReportContents(reportContents);
		
		reportDAO dao = reportDAO.getReportDAO();
		dao.commentReportInsertDAO(dto);
	}
	
}
