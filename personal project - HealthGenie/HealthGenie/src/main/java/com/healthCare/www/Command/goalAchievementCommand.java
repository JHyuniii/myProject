package com.healthCare.www.Command;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.bodyGoalDAO;
import com.healthCare.www.DTO.bodyGoalDTO;
import com.mysql.cj.Session;

public class goalAchievementCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyGoalDAO dao = bodyGoalDAO.getBodyGoalDAO();
		bodyGoalDTO dto = new bodyGoalDTO();
		
//		String achievementStr = request.getParameter("achievement");
//		if(achievementStr.equals("complete")) {
//			dto.setAchievement(true);
//		} else if(achievementStr.equals("noneComplete")){
//			dto.setAchievement(false);
//		}
		
		String achievement = request.getParameter("achievement");
		if (achievement != null && achievement.equals("on")) {
		    // 체크박스가 체크되어 있음
			dto.setAchievement(true);
		} else {
		    // 체크박스가 체크되어 있지 않음
			dto.setAchievement(false);
		}

		
		
		double goalWeight = Double.parseDouble(request.getParameter("hiddenGoalWeight"));
		double goalMuscleMass = Double.parseDouble(request.getParameter("hiddenGoalMuscleMass"));
		
		String hiddenGoalDate = request.getParameter("hiddenGoalDate");
		LocalDate goalDate = LocalDate.parse(hiddenGoalDate);

		
		dto.setGoalWeight(goalWeight);
		dto.setGoalMuscleMass(goalMuscleMass);
		dto.setGoalDate(goalDate);
		
		int result = dao.goalAchievement(dto);
		if(result > 0) {
			request.setAttribute("achievement", "complete");
		}
	}
}
