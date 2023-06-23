package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.qnaDAO;
import com.healthGenie.www.DTO.qnaDTO;

public class qnaMemberListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		qnaDAO dao = qnaDAO.getQnaDAO();
		HttpSession session = request.getSession();
		String sendUser = (String) session.getAttribute("id");
		ArrayList<qnaDTO> list = dao.qnaMemberList(sendUser);
		request.setAttribute("list", list);
	}
	
}
