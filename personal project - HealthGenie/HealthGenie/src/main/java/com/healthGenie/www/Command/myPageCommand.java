package com.healthGenie.www.Command;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.memberDAO;
import com.healthGenie.www.DAO.reportMessageDAO;
import com.healthGenie.www.DTO.memberDTO;

public class myPageCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		memberDAO dao = memberDAO.getMemberDAO();
		memberDTO dto = dao.createDateCheckDAO(userId);
		Date createDateSQL = dto.getCreateDate();
		LocalDate nowDateSQL = LocalDate.now();
		
		String createDateSTR = createDateSQL.toString().replace("-", "");
		int createDate = Integer.parseInt(createDateSTR);
		
		String nowDateSTR = nowDateSQL.toString().replace("-", "");
		int nowDate = Integer.parseInt(nowDateSTR);
		
		int memberDate = (nowDate - createDate)+1;
		
		request.setAttribute("memberDate", memberDate);
		
		reportMessageDAO reportMsgDAO = reportMessageDAO.getReportMessageDAO();
		int reportCnt = reportMsgDAO.reportCountDAO(userId);
		request.setAttribute("reportCnt", reportCnt);
	}

}
