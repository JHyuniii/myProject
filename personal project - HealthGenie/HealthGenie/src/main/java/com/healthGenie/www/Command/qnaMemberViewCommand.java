package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.qnaDAO;
import com.healthGenie.www.DTO.qnaAdminDTO;
import com.healthGenie.www.DTO.qnaDTO;

public class qnaMemberViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int QnANum = Integer.parseInt(request.getParameter("qnaNum"));
		
		qnaDAO dao = qnaDAO.getQnaDAO();
		
		qnaDTO dto = dao.quaMemberViewDAO(QnANum);
		request.setAttribute("dto", dto);
		
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		qnaAdminDTO qnaAdminDTO = dao.qnaMemberReceiveViewDAO(QnANum, userId);
		request.setAttribute("qnaAdminDTO", qnaAdminDTO);
	}
	 
}
