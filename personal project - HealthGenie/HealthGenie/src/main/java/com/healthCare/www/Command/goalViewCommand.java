package com.healthCare.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.bodyGoalDAO;
import com.healthCare.www.DTO.bodyGoalDTO;

public class goalViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyGoalDAO dao = bodyGoalDAO.getBodyGoalDAO();
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ArrayList<bodyGoalDTO> list = dao.goalView(id);
		request.setAttribute("list", list);
		
		if(list.isEmpty()==false) {
			request.setAttribute("goalView", true);
		} else {
			request.setAttribute("goalView", false);
		}
	}
	
}
