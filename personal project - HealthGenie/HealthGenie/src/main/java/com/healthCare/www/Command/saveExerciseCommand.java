package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.interestListDAO;
import com.healthCare.www.DTO.interestListDTO;

public class saveExerciseCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		interestListDAO dao = interestListDAO.getInterestListDAO();
		interestListDTO dto = new interestListDTO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		String exerciseCode = request.getParameter("exerciseCode");
		System.out.println("exerciseCode : " + exerciseCode);
		
		dto.setUserId(userId);
		dto.setExerciseId(exerciseCode);
		
		int result = dao.saveExerciseDAO(dto);
		
		System.out.println("interestList : " + result);
		request.setAttribute("result", result);
	}
	
}
