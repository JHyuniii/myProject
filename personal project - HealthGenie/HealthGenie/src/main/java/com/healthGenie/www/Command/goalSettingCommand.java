package com.healthGenie.www.Command;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.bodyGoalDAO;
import com.healthGenie.www.DTO.bodyGoalDTO;

public class goalSettingCommand implements Command {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyGoalDAO dao = bodyGoalDAO.getBodyGoalDAO();
		bodyGoalDTO dto = new bodyGoalDTO();

		String goalWeight = request.getParameter("goalWeight");
		String goalMuscleMass = request.getParameter("goalMuscleMass");
		String goalDate = request.getParameter("goalDate");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		dto.setUserId(id);
		dto.setGoalWeight(Double.parseDouble(goalWeight));
		dto.setGoalMuscleMass(Double.parseDouble(goalMuscleMass));
		dto.setGoalDate(LocalDate.parse(goalDate));

		int result = dao.goalSettingDAO(dto);
		if (result > 0) {
			session.setAttribute("goalData", dto);
		} else {
			request.setAttribute("error", "목표 설정에 실패하였습니다. 다시 시도해주세요."); // 오류 메시지 설정
			request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
		}
	}
}
