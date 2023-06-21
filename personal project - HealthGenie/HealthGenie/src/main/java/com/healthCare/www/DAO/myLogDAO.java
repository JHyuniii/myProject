package com.healthCare.www.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.healthCare.www.DTO.myLogDTO;
import com.healthCare.www.DTO.myLogListDTO;
import com.healthCare.www.DTO.myLogPicDTO;

public class myLogDAO {
	private DataSource datasource;
	public static myLogDAO myLogDAO = new myLogDAO();
	
	public myLogDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static myLogDAO getMyLogDAO() {
		return myLogDAO;
	}
	
	//일지 삭제
	public int myLogDeleteDAO(String logId) {
		String sql = "delete from myLog where logId = " + "'" + logId + "'";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//myLogView
	public myLogListDTO myLogViewDAO(String logId) {
		String sql = "select * from myLog inner join myLogPic on myLog.logId = "
				+ "myLogPic.logId where myLog.logId = " + "'" + logId + "'";
		myLogListDTO dto = new myLogListDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setLogId(rs.getString("logId"));
				dto.setUserId(rs.getString("userId"));
				dto.setPart(rs.getString("part"));
				dto.setGoodPoint(rs.getString("goodPoint"));
				dto.setBadPoint(rs.getString("badPoint"));
				dto.setMorningFood(rs.getString("morningFood"));
				dto.setLunchFood(rs.getString("lunchFood"));
				dto.setDinnerFood(rs.getString("dinnerFood"));
				
				java.sql.Date sqlDate = rs.getDate("exerciseDate");
				LocalDate localDate = sqlDate.toLocalDate();
				dto.setExerciseDate(localDate);
				
				dto.setFileName(rs.getString("fileName"));
				dto.setLogId(logId);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//myLogList
	public ArrayList<myLogListDTO> myLogListDAO(String userId){
		String sql = "select * from myLog inner join myLogPic on myLog.logId = "
				+ "myLogPic.logId where myLog.userId = " + "'" + userId + "' order by myLog.exerciseDate desc";
		ArrayList<myLogListDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				myLogListDTO dto = new myLogListDTO();
				dto.setLogId(rs.getString("logId"));
				dto.setUserId(rs.getString("userId"));
				dto.setPart(rs.getString("part"));
				dto.setGoodPoint(rs.getString("goodPoint"));
				dto.setBadPoint(rs.getString("badPoint"));
				dto.setMorningFood(rs.getString("morningFood"));
				dto.setLunchFood(rs.getString("lunchFood"));
				dto.setDinnerFood(rs.getString("dinnerFood"));
				
				java.sql.Date sqlDate = rs.getDate("exerciseDate");
				LocalDate localDate = sqlDate.toLocalDate();
				dto.setExerciseDate(localDate);
				
				dto.setFileName(rs.getString("fileName"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//일지 등록
	public int myLogWriteDAO(myLogDTO myLogDTO, myLogPicDTO myLogPicDTO) {
		String sql = "insert into myLog values (?,?,?,?,?,?,?,?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, myLogDTO.getUserId());
			pstm.setString(2, myLogDTO.getPart());
			
			// LocalDate를 java.sql.Date로 변환
			LocalDate localDate = myLogDTO.getExerciseDate();
			java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
			// PreparedStatement에 java.sql.Date로 설정
			pstm.setDate(3, sqlDate);
			
			pstm.setString(4, myLogDTO.getGoodPoint());
			pstm.setString(5, myLogDTO.getBadPoint());
			pstm.setString(6, myLogDTO.getMorningFood());
			pstm.setString(7, myLogDTO.getLunchFood());
			pstm.setString(8, myLogDTO.getDinnerFood());
			pstm.setString(9, myLogDTO.getLogId());
			
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		sql = "insert into myLogPic values(?,?,?)";
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, myLogPicDTO.getUserId());
			pstm.setString(2, myLogPicDTO.getFileName());
			pstm.setString(3, myLogPicDTO.getLogId());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
}
