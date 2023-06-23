package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.qnaDAO;
import com.healthGenie.www.DTO.qnaDTO;

public class qnaSendForAdminCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sendUser = (String) session.getAttribute("id");
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContents = request.getParameter("qnaContents");
		String receiveUser  = "superAdmin";
		
		qnaDTO dto = new qnaDTO();
		qnaDAO dao = qnaDAO.getQnaDAO();
		
		dto.setQnaContents(qnaContents);
		dto.setQnaTitle(qnaTitle);
		dto.setReceiveUser(receiveUser);
		dto.setSendUser(sendUser);
		
		dao.qnaSendForAdminDAO(dto);
	}
	
}
