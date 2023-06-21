package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.postDAO;
import com.healthCare.www.DAO.reportDAO;

public class reportDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("hiddenUserId");
		
		int postNum = 0;
		int commentNum = 0;
		
		postDAO postDao = postDAO.getPostDAO();
		
		int result = 0;
		
		String reportNum = request.getParameter("hiddenReportNum");
		if(reportNum.substring(0, 2).equals("p_")) {
			postNum = Integer.parseInt(reportNum.substring(2));
			result = postDao.deletePostDAO(postNum);
			System.out.println("신고 게시물 삭제 여부 " + result);
		} else if(reportNum.substring(0, 2).equals("c_")) {
			commentNum = Integer.parseInt(reportNum.substring(2));
			result = postDao.deleteCommentDAO(commentNum);
			System.out.println("신고 댓글 삭제 여부 " + result);
		}
		
		reportDAO reportDao = reportDAO.getReportDAO();
		result = reportDao.reportDeleteDAO(userId, reportNum);
		
		request.setAttribute("result", result);
	}
	
}
