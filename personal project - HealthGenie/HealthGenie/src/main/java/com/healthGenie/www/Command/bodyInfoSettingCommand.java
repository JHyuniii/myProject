package com.healthGenie.www.Command;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.bodyInfoDAO;
import com.healthGenie.www.DTO.bodyInfoDTO;

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

		double height = Double.parseDouble(request.getParameter("height"));
		double bmiBefore = weight / (height * height) * 10000;
		double bmi = (Math.round(bmiBefore)*100)/100;

		dto.setUserId(userId);
		dto.setBodyInfoDate(bodyInfoDate);
		dto.setWeight(weight);
		dto.setMuscleMass(muscleMass);
		dto.setBmi(bmi);

		int result = dao.bodyInfoSetting(dto);
		if(result < 0) {
			request.setAttribute("error", "몸 기록에 실패하였습니다. 다시 시도해주세요."); // 오류 메시지 설정
			request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
		}
	}

}
