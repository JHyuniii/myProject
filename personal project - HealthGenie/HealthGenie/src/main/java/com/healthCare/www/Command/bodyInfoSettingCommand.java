package com.healthCare.www.Command;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.bodyInfoDAO;
import com.healthCare.www.DTO.bodyInfoDTO;

public class bodyInfoSettingCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyInfoDAO dao = bodyInfoDAO.getbodyInfoDAO();
		bodyInfoDTO dto = new bodyInfoDTO();

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		LocalDate bodyInfoDate = LocalDate.parse(request.getParameter("bodyInfoDate"));
		double weight = Double.parseDouble(request.getParameter("weight"));
		double muscleMass = Double.parseDouble(request.getParameter("muscleMass"));
		System.out.println("weight = " + weight + " muscleMass = " + muscleMass);

		double height = Double.parseDouble(request.getParameter("height"));
		double bmiBefore = weight / (height * height) * 10000;
		double bmi = (Math.round(bmiBefore)*100)/100;

		dto.setUserId(userId);
		dto.setBodyInfoDate(bodyInfoDate);
		dto.setWeight(weight);
		dto.setMuscleMass(muscleMass);
		dto.setBmi(bmi);

		int result = dao.bodyInfoSetting(dto);
		if (result > 0) {
			System.out.println("bodyInfoSetting sucess");
		} else {
			System.out.println("bodyInfoSetting fail");
		}
	}

}
