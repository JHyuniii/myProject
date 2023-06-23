package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.todoListDAO;
import com.healthGenie.www.DTO.todoListDTO;

public class todoListShowCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String todoDate = request.getParameter("todoDate");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		todoListDTO dto = new todoListDTO();
		
		java.sql.Date sqlTodoDate = java.sql.Date.valueOf(todoDate);
		dto.setTodoDate(sqlTodoDate);
		
		dto.setUserId(userId);
		
		todoListDAO dao = todoListDAO.getTodoListDAO();
		ArrayList<todoListDTO> list = dao.todoListShowDAO(dto);
		if(list.isEmpty()) {
			request.setAttribute("list", null);
		} else {
			request.setAttribute("list", list);
		}
	}
	
}
