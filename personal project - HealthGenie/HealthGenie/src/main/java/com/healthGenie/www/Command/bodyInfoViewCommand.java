package com.healthGenie.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.bodyInfoDAO;
import com.healthGenie.www.DTO.bodyInfoDTO;

public class bodyInfoViewCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyInfoDAO dao = bodyInfoDAO.getbodyInfoDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		ArrayList<bodyInfoDTO> list = dao.bodyInfoView(userId);
		
		if(list != null) {
			request.setAttribute("list", list);
		} else {
			request.setAttribute("list", "none");
		}
	}
}
