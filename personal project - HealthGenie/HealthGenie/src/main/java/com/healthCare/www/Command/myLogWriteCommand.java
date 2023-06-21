package com.healthCare.www.Command;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.myLogDAO;
import com.healthCare.www.DTO.myLogDTO;
import com.healthCare.www.DTO.myLogPicDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class myLogWriteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		String path = context.getRealPath("healthMyLogIMG");

		int size = 1024 * 1024 * 15; // 15M - 최대 사이즈

		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		
		String str = "";
		String fileName = "";
		String oriFile = "";
		
		try {
		    String name = multi.getParameter("name");
		    System.out.println("이름 " + name);

		    @SuppressWarnings("unchecked")
			Enumeration<String> files = multi.getFileNames();
		    while (files.hasMoreElements()) {
		        str = files.nextElement();
		        fileName = multi.getFilesystemName(str);
		        oriFile = multi.getOriginalFileName(str);
		        
		        System.out.println("저장된 이름 " + fileName + " 원본 이름 " + oriFile);
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		String exerciseDateStr = multi.getParameter("exerciseDate");
		LocalDate exerciseDate = LocalDate.parse(exerciseDateStr);
		
		String part = multi.getParameter("part");
		String goodPoint = multi.getParameter("goodPoint");
		String badPoint = multi.getParameter("badPoint");
		String morningFood = multi.getParameter("morningFood");
		String lunchFood = multi.getParameter("lunchFood");
		String dinnerFood = multi.getParameter("dinnerFood");
		
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		
		String logId = userId+"_"+exerciseDate;
		
		System.out.println("logId 만들어진 값 : " + logId);
		
		myLogDTO myLogDTO = new myLogDTO();
		myLogDTO.setUserId(userId);
		myLogDTO.setPart(part);
		myLogDTO.setBadPoint(badPoint);
		myLogDTO.setGoodPoint(goodPoint);
		myLogDTO.setLogId(logId);
		myLogDTO.setExerciseDate(exerciseDate);
		myLogDTO.setMorningFood(morningFood);
		myLogDTO.setLunchFood(lunchFood);
		myLogDTO.setDinnerFood(dinnerFood);
		
		myLogPicDTO myLogPicDTO = new myLogPicDTO();
		myLogPicDTO.setFileName(fileName);
		myLogPicDTO.setLogId(logId);
		myLogPicDTO.setUserId(userId);
		
		myLogDAO dao = myLogDAO.getMyLogDAO();
		int result = dao.myLogWriteDAO(myLogDTO, myLogPicDTO);
		if(result < 0) {
			System.out.println("일지 등록 실패");
		}
	}
}
