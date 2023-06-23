package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.bodyInfoDAO;

public class bodyInfoDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bodyInfoDAO dao = bodyInfoDAO.getbodyInfoDAO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		int result = dao.bodyInfoDelete(userId);
		if(result < 0) {
			request.setAttribute("error", "삭제에 실패하였습니다. 다시 시도해주세요."); // 오류 메시지 설정
			request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
		}
	}
	
}
