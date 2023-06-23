package com.healthGenie.www.DAO;

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

import com.healthGenie.www.DTO.bodyGoalDTO;

public class bodyGoalDAO {
	private static bodyGoalDAO bodyGoalDAO = new bodyGoalDAO();
	private DataSource datasource;
	
	public bodyGoalDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static bodyGoalDAO getBodyGoalDAO() {
		return bodyGoalDAO;
	}
	
	//목표설정
	public int goalSettingDAO(bodyGoalDTO dto) {
		String sql = "insert into bodyGoal (userId, goalWeight, goalMuscleMass, goalDate) values (?,?,?,?)";
		
		int result = 0;
		
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){

			pstm.setString(1, dto.getUserId());
			pstm.setDouble(2, dto.getGoalWeight());
			pstm.setDouble(3, dto.getGoalMuscleMass());
			
			LocalDate localDate = dto.getGoalDate();
			java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);

			pstm.setDate(4, sqlDate);
			
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//목표달성
	public int goalAchievement(bodyGoalDTO dto) {
		String sql = "update bodyGoal set achievement=? where goalWeight=? and goalMuscleMass=? and goalDate=?";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setBoolean(1, dto.isAchievement());
			pstm.setDouble(2, dto.getGoalWeight());
			pstm.setDouble(3, dto.getGoalMuscleMass());
			
			LocalDate localDate = dto.getGoalDate();
			java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
			pstm.setDate(4, sqlDate);
			
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//현재 목표보기
	public bodyGoalDTO preventGoalViewDAO(String userId) {
		String sql = "select * from bodyGoal where userId=" + "'" + userId + "'" + " order by setDate desc";
		bodyGoalDTO dto = new bodyGoalDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setGoalWeight(rs.getDouble("goalWeight"));
				dto.setGoalMuscleMass(rs.getDouble("goalMuscleMass"));
				
				java.sql.Date sqlDate = rs.getDate("goalDate");
				LocalDate localDate = sqlDate.toLocalDate();
				dto.setGoalDate(localDate);
				
				java.sql.Date sqlSetDate = rs.getDate("setDate");
				LocalDate localSetDate = sqlSetDate.toLocalDate();
				dto.setSetDate(localSetDate);
			} else {
				dto = null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//목표보기
	public ArrayList<bodyGoalDTO> goalView(String id) {
		String sql = "select goalWeight, goalMuscleMass, goalDate, achievement from bodyGoal where userId="+"'"+id+"' order by goalDate desc";
		
		ArrayList<bodyGoalDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				bodyGoalDTO dto = new bodyGoalDTO();
				dto.setGoalWeight(rs.getDouble("goalWeight"));
				dto.setGoalMuscleMass(rs.getDouble("goalMuscleMass"));
				
				java.sql.Date sqlDate = rs.getDate("goalDate");
				LocalDate localDate = sqlDate.toLocalDate();
				dto.setGoalDate(localDate);
				dto.setAchievement(rs.getBoolean("achievement"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
}
