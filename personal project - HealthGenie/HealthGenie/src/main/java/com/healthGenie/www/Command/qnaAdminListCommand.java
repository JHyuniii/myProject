package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.qnaDAO;
import com.healthGenie.www.DTO.qnaDTO;

public class qnaAdminListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		qnaDAO dao = qnaDAO.getQnaDAO();
		ArrayList<qnaDTO> list = dao.qnaAdminListDAO();
		request.setAttribute("list", list);
	}
	
}
