package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.todoListDAO;
import com.healthGenie.www.DTO.todoListDTO;

public class todoListCompletedCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String todoListId = request.getParameter("todoListId");
		
		String completed = request.getParameter("completed");
		
		todoListDTO dto = new todoListDTO();
		
		if(completed.equals("true")) {
			dto.setCompleted(true);
		} else if(completed.equals("false")) {
			dto.setCompleted(false);
		}
		
		todoListDAO dao = todoListDAO.getTodoListDAO();
		int result = dao.todoListCompletedDAO(todoListId, dto);
		request.setAttribute("result", result);
	}
	
}
