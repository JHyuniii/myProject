package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.qnaDAO;
import com.healthGenie.www.DTO.qnaDTO;

public class qnaAdminListViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qnANum = Integer.parseInt(request.getParameter("qnANum"));
		qnaDAO dao = qnaDAO.getQnaDAO();
		qnaDTO dto = dao.qnaAdminViewDAO(qnANum);
		request.setAttribute("qnaDTO", dto);
	}
	
}
