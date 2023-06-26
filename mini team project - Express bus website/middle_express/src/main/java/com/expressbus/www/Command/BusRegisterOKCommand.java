package com.expressbus.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.expressbus.www.DAO.busDAO;
import com.expressbus.www.DTO.busResDTO;

public class BusRegisterOKCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		busResDTO busInfodto = new busResDTO();
//		busInfodto.setI_name(request.getParameter("i_name"));
//		busInfodto.setI_price(request.getParameter("i_price"));
//		busInfodto.setI_grade(request.getParameter("i_grade"));
//		busInfodto.setI_busNum(request.getParameter("i_busNum"));
//		
//		busResDTO busScheduledto = new busResDTO();
//		busScheduledto.setB_startTerminal(request.getParameter("b_startTerminal"));
//		busScheduledto.setB_arrivalTerminal(request.getParameter("b_arrivalTerminal"));
//		busScheduledto.setB_departureDate(request.getParameter("b_departureDate"));
//		busScheduledto.setB_departureTime(request.getParameter("b_departureTime"));
//		busScheduledto.setB_arrivalDate(request.getParameter("b_arrivalDate"));
//		busScheduledto.setB_arrivalTime(request.getParameter("b_arrivalTime"));
//
//		busDAO dao = busDAO.getbusDAO();
//		dao.insertBusInfoRegisterDAO(busInfodto, busScheduledto);
//		dao.insertBusScheduleRegisterDAO(busInfodto, busScheduledto);
		
		busResDTO dto = new busResDTO();
		busDAO dao = busDAO.getbusDAO();
		
		dto.setI_name(request.getParameter("i_name"));
		dto.setI_price(request.getParameter("i_price"));
		dto.setI_grade(request.getParameter("i_grade"));
		dto.setI_busNum(request.getParameter("i_busNum"));
		
		dto.setB_startTerminal(request.getParameter("b_startTerminal"));
		dto.setB_arrivalTerminal(request.getParameter("b_arrivalTerminal"));
		dto.setB_departureDate(request.getParameter("b_departureDate"));
		dto.setB_departureTime(request.getParameter("b_departureTime"));
		dto.setB_arrivalDate(request.getParameter("b_arrivalDate"));
		dto.setB_arrivalTime(request.getParameter("b_arrivalTime"));
		
		dao.insertBusDAO(dto);
		}
}
