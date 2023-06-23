package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.myLogDAO;
import com.healthGenie.www.DTO.myLogDTO;
import com.healthGenie.www.DTO.myLogListDTO;
import com.healthGenie.www.DTO.myLogPicDTO;

public class myLogListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myLogDAO dao = myLogDAO.getMyLogDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		ArrayList<myLogListDTO> list = dao.myLogListDAO(userId);
		request.setAttribute("list", list);
		if(list.isEmpty()) {
			request.setAttribute("list", null);
		}
	}
	
}
