package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.qnaDAO;
import com.healthGenie.www.DTO.qnaDTO;

public class qnaSendForMemberCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int QnAnum = Integer.parseInt(request.getParameter("hiddenQnAnum"));
		
		HttpSession session = request.getSession();
		String sendUser = (String) session.getAttribute("superAdmin");
		String receiveUser = request.getParameter("receiveUser");
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContents = request.getParameter("qnaContents");
		
		qnaDTO dto = new qnaDTO();
		dto.setQnANum(QnAnum);
		dto.setSendUser(sendUser);
		dto.setReceiveUser(receiveUser);
		dto.setQnaTitle(qnaTitle);
		dto.setQnaContents(qnaContents);
		
		qnaDAO dao = qnaDAO.getQnaDAO();
		dao.qnaSendForMemberDAO(dto);
	}
	
}
