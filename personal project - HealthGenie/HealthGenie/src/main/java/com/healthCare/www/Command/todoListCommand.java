package com.healthCare.www.Command;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.todoListDAO;
import com.healthCare.www.DTO.todoListDTO;

public class todoListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String todoDate = request.getParameter("todoDate");
//		String list = request.getParameter("list");
//		System.out.println("todoDate : " + todoDate + " list : " + list);
		todoListDAO dao = todoListDAO.getTodoListDAO();
		
//		Date todoDate = LocalDate.parse(todoDateStr);
		
		String listsText = request.getParameter("lists");
		String[] lists = listsText.split("\\|\\|\\|");


		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		String todoDate = request.getParameter("todoDate");
		int result = 0;
		for(int i=0; i<lists.length; i++) {
			String todoListId = userId + todoDate + i;
			todoListDTO dto = new todoListDTO();
			dto.setUserId(userId);
			dto.setTodoListId(todoListId);
			dto.setList(lists[i]);
			
			java.sql.Date sqlTodoDate = java.sql.Date.valueOf(todoDate);
			dto.setTodoDate(sqlTodoDate);
			
			result = dao.todoListInsertDAO(dto);
		}
		System.out.println("todoDate : " + todoDate + " lists : " + Arrays.toString(lists));
		request.setAttribute("result", result);
	}
	
}
