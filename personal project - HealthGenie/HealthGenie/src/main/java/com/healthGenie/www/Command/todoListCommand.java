package com.healthGenie.www.Command;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.todoListDAO;
import com.healthGenie.www.DTO.todoListDTO;

public class todoListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		todoListDAO dao = todoListDAO.getTodoListDAO();
		String listsText = request.getParameter("lists");
		String[] lists = listsText.split("\\|\\|\\|");


		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		String todoDate = request.getParameter("todoDate");
		System.out.println("todoDate : " + todoDate);
		for(int i=0; i<lists.length; i++) {
			String todoListId = userId + todoDate + i;
			todoListDTO dto = new todoListDTO();
			dto.setUserId(userId);
			dto.setTodoListId(todoListId);
			dto.setList(lists[i]);
			
			java.sql.Date sqlTodoDate = java.sql.Date.valueOf(todoDate);
			dto.setTodoDate(sqlTodoDate);
			
			dao.todoListInsertDAO(dto);
		}
	}
	
}
