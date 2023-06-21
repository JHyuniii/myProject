package com.healthCare.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.myLogDAO;
import com.healthCare.www.DTO.myLogDTO;
import com.healthCare.www.DTO.myLogListDTO;
import com.healthCare.www.DTO.myLogPicDTO;

public class myLogListCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		myLogDAO dao = myLogDAO.getMyLogDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		ArrayList<myLogListDTO> list = dao.myLogListDAO(userId);
		request.setAttribute("list", list);
		if(list.isEmpty()) {
			System.out.println("myLog list 불러오기 실패");
			request.setAttribute("list", null);
		}
	}
	
}
