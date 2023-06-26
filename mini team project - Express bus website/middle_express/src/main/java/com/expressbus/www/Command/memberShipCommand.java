package com.expressbus.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.memManageDTO;

public class memberShipCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		memManageDTO dto = new memManageDTO();
		busDAO dao = busDAO.getbusDAO();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String birth = request.getParameter("YOB");
		String sex = request.getParameter("sex");
		
		System.out.println("회원가입 : "+id+" "+password+" "+email+" "+birth+" "+sex);  //디버깅
		
		dto.setM_userId(id);
		dto.setM_password(password);
		dto.setM_email(email);
		dto.setM_birthYear(birth);
		dto.setM_gender(sex);
		
		int result = dao.memberShipDAO(dto);
		System.out.println("회원가입 성공여부 ? " + result);
	}
	
}
