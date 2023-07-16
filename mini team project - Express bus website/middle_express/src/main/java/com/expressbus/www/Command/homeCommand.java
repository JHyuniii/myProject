package com.expressbus.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.dispatchInfoDTO;

public class homeCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		busDAO dao = busDAO.getbusDAO();
		dispatchInfoDTO dto = new dispatchInfoDTO();
		ArrayList<dispatchInfoDTO> list = dao.home();
		request.setAttribute("list", list);
	}
	

}
