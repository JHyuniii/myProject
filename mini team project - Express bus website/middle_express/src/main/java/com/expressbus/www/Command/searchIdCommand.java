package com.expressbus.www.Command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.memManageDTO;

public class searchIdCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		busDAO dao = busDAO.getbusDAO();
		
		String email = request.getParameter("email");
		
		memManageDTO dto = dao.searchIdDAO(email);	
		String id = dto.getM_userId().replace(dto.getM_userId().substring(0, 3), "***");
		if(dto!=null) {
			request.setAttribute("id", id);
		} else if(dto == null) {
			request.setAttribute("errorMSG", "일치하는 정보가 없습니다.");
			request.setAttribute("url", "main.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);	
		}
	}
	
}
