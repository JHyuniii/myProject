package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.DAO.todoListDAO;
import com.healthCare.www.DTO.todoListDTO;

public class todoListCompletedCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String todoListId = request.getParameter("todoListId");
		System.out.println("todoListId : " + todoListId);
		
		String completed = request.getParameter("completed");
		System.out.println("completed : " + completed);
		
		todoListDTO dto = new todoListDTO();
		
		if(completed.equals("true")) {
			dto.setCompleted(true);
		} else if(completed.equals("false")) {
			dto.setCompleted(false);
		}
		
		todoListDAO dao = todoListDAO.getTodoListDAO();
		int result = dao.todoListCompletedDAO(todoListId, dto);
		if(result < 0) {
			System.out.println("todoListCompleted fail");
		}
		request.setAttribute("result", result);
	}
	
}
