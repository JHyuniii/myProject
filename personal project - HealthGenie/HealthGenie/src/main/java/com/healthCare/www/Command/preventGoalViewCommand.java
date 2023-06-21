package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.bodyGoalDAO;
import com.healthCare.www.DTO.bodyGoalDTO;

public class preventGoalViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyGoalDAO dao = bodyGoalDAO.getBodyGoalDAO();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		bodyGoalDTO dto = dao.preventGoalViewDAO(id);
		if(dto != null) {
			request.setAttribute("preventGoal", dto);
		} else {
			request.setAttribute("preventGoal", null);
		}
	
	}
	
}
