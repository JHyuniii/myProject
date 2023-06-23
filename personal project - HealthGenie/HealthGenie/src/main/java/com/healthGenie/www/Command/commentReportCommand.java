package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.reportDAO;
import com.healthGenie.www.DTO.reportDTO;

public class commentReportCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String reportContents = request.getParameter("reportContents");
		
		reportDTO dto = new reportDTO();
		dto.setCommentNum(commentNum);
		dto.setReportContents(reportContents);
		
		reportDAO dao = reportDAO.getReportDAO();
		int result = dao.commentReportInsertDAO(dto);
		if(result < 0) {
			request.setAttribute("error", "댓글 신고에 실패하였습니다. 다시 시도해주세요."); // 오류 메시지 설정
			request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
		}
	}
	
}
