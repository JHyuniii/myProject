package com.expressbus.www.Command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.memManageDTO;

public class searchPasswordCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		busDAO dao = busDAO.getbusDAO();
		
		String id = request.getParameter("id");
		
		memManageDTO dto = dao.searchPasswordDAO(id);
		String password = dto.getM_password().replace(dto.getM_password().substring(0, 3), "***");
		if(dto!=null) {
			request.setAttribute("password", password);
		} else if(dto == null) {
			request.setAttribute("errorMSG", "일치하는 정보가 없습니다.");
			request.setAttribute("url", "main.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);	
		}		
	}
	
}
