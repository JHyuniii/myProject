package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.interestListDAO;
import com.healthGenie.www.DTO.interestListDTO;

public class interestListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		interestListDAO dao = interestListDAO.getInterestListDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		ArrayList<interestListDTO> list = dao.interestListLoadDAO(userId);
		if(list.isEmpty()) {
			request.setAttribute("list", null);
		} else {
			request.setAttribute("list", list);
		}
	}
}
