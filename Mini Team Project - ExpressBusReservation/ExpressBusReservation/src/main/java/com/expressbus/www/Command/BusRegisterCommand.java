package com.expressbus.www.Command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.busResDTO;

public class BusRegisterCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		busDAO dao = busDAO.getbusDAO();
		ArrayList<busResDTO> terminalList = new ArrayList<>();
		terminalList = dao.getTerminalDAO();
		request.setAttribute("terminalList", terminalList);
		
		ArrayList<busResDTO> companyList = new ArrayList<>();
		companyList = dao.getCompanyDAO();
		request.setAttribute("companyList", companyList);
	}
}
