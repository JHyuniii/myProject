package com.healthCare.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.interestListDAO;
import com.healthCare.www.DTO.interestListDTO;

public class interestListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		interestListDAO dao = interestListDAO.getInterestListDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		ArrayList<interestListDTO> list = dao.interestListLoadDAO(userId);
		if(list.isEmpty()) {
			request.setAttribute("list", null);
			System.out.println("interestList is null");
		} else {
			request.setAttribute("list", list);
			System.out.println("interestList is not null");
		}
	}
}
