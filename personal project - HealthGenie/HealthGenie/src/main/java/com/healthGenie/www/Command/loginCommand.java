package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthGenie.www.DAO.memberDAO;
import com.healthGenie.www.DTO.memberDTO;

public class loginCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memberDAO dao = memberDAO.getMemberDAO();
		memberDTO dto = new memberDTO();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		dto.setUserId(id);
		dto.setPassword(password);
		int result = dao.loginDAO(dto);
		
		HttpSession session = request.getSession();
		if(result ==  1) {
			session.setAttribute("id", id);
		} else if(result == -1){
			request.setAttribute("error", "아이디 혹은 비밀번호가 일치하지 않습니다."); // 오류 메시지 설정
			request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
		}
	}
	
}
