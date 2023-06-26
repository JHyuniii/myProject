package com.expressbus.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.memManageDTO;

public class ChgEmailCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		busDAO dao = busDAO.getbusDAO();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		memManageDTO dto = new memManageDTO();
		dto.setM_userId(id);
		dto.setM_password(password);
		dto.setM_email(email);

		int result = dao.chgEmailDao(dto);
//		if (result < 0) {
//			request.setAttribute("errorMSG", "�?�?�??? ?????? ?��?��?????��????. ?��?? ?????�주?��??.");
//			request.setAttribute("url", "main.jsp");
//			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
//			dispatcher.forward(request, response);
//
//		}
	}

}
