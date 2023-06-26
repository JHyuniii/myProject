package com.expressbus.www.Command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.memManageDTO;

public class ChgPwCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		busDAO dao = busDAO.getbusDAO();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");

		memManageDTO dto = new memManageDTO();
		dto.setM_userId(id);
		dto.setM_password(password);

		int result = dao.chgPwDAO(dto, newPassword);
		if (result < 0) {
			request.setAttribute("errorMSG", "�?�?�??? ?????? ?��?��?????��????. ?��?? ?????�주?��??.");
			request.setAttribute("url", "main.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);	
		}

	}
}
