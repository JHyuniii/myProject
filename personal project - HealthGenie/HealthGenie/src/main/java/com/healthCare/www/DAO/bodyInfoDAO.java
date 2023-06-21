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

import com.healthCare.www.DTO.bodyInfoDTO;

public class bodyInfoDAO {
	private static bodyInfoDAO bodyInfoDAO = new bodyInfoDAO();
	private DataSource datasource;
	
	public bodyInfoDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static bodyInfoDAO getbodyInfoDAO() {
		return bodyInfoDAO;
	}
	
	//몸 정보 모두 삭제
	public int bodyInfoDelete(String userId) {
		String sql = "delete from bodyInfo where userId = "+"'"+userId+"'";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//오늘 몸 정보 추가하기
	public int bodyInfoSetting(bodyInfoDTO dto) {
		String sql = "insert into bodyInfo (userId, weight, muscleMass, bodyInfoDate, bmi) values (?,?,?,?,?)";
		System.out.println("bodyInfoSetting sql : " + sql);
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, dto.getUserId());
			pstm.setDouble(2, dto.getWeight());
			pstm.setDouble(3, dto.getMuscleMass());
			
			LocalDate localDate = dto.getBodyInfoDate();
			java.sql.Date sqlDate = java.sql.Date.valueOf(localDate);
			pstm.setDate(4, sqlDate);
			
			pstm.setDouble(5, dto.getBmi());
			
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//몸 정보 히스토리 보기
//	public ArrayList<bodyInfoDTO> bodyInfoView(String userId){
//		String sql = "select * from bodyInfo where userId = "+"'"+userId+"'"+" order by bodyInfoDate desc";
//		System.out.println("bodyInfoView sql : " + sql);
//		ArrayList<bodyInfoDTO> list = new ArrayList<>();
//		try(Connection conn = datasource.getConnection();
//				Statement stmt = conn.createStatement();
//				ResultSet rs = stmt.executeQuery(sql)){
//			while(rs.next()) {
//				bodyInfoDTO dto = new bodyInfoDTO();
//				dto.setWeight(rs.getDouble("weight"));
//				dto.setMuscleMass(rs.getDouble("muscleMass"));
//				
//				java.sql.Date sqlDate = rs.getDate("bodyInfoDate");
//				LocalDate localDate = sqlDate.toLocalDate();
//				dto.setBodyInfoDate(localDate);
//				
//				list.add(dto);
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	public ArrayList<bodyInfoDTO> bodyInfoView(String userId){
		bodyInfoDifference(userId);
		String sql = "select * from bodyInfo where userId = "+"'"+userId+"'"+" order by bodyInfoDate desc";
		System.out.println("bodyInfoView sql : " + sql);
		ArrayList<bodyInfoDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				bodyInfoDTO dto = new bodyInfoDTO();
				dto.setWeight(rs.getDouble("weight"));
				dto.setMuscleMass(rs.getDouble("muscleMass"));
				dto.setWeightDifference(rs.getDouble("weightDifference"));
				dto.setMuscleMassDifference(rs.getDouble("muscleMassDifference"));
				
				java.sql.Date sqlDate = rs.getDate("bodyInfoDate");
				LocalDate localDate = sqlDate.toLocalDate();
				dto.setBodyInfoDate(localDate);
				
				dto.setBmi(rs.getDouble("bmi"));
				
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//몸 차이
	public void bodyInfoDifference(String userId) {
		String sql = "select * from bodyInfo where userId = " + "'" + userId + "'" + " order by bodyInfoDate desc limit 2";
		double weightDifference = 0;
		double muscleMassDifference = 0;
		bodyInfoDTO dto = new bodyInfoDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
			    double latestMuscleMass = rs.getDouble("muscleMass");
			    double latestWeight = rs.getDouble("weight");
			    if(rs.next()) {
			        double previousMuscleMass = rs.getDouble("muscleMass");
			        double previousWeight = rs.getDouble("weight");
			        
			        weightDifference = latestWeight - previousWeight;
			        muscleMassDifference = latestMuscleMass - previousMuscleMass;
			        
			        System.out.println("몸무게 차이: " + weightDifference);
			        System.out.println("근육량 차이: " + muscleMassDifference);
			        
			        dto.setWeightDifference(weightDifference);
			        dto.setMuscleMassDifference(muscleMassDifference);
			    } 
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		sql = "UPDATE bodyInfo\n"
				+ "SET weightDifference = ? , muscleMassDifference = ?\n"
				+ "WHERE userId = ? \n"
				+ "AND bodyInfoDate = (\n"
				+ "    SELECT latestDate\n"
				+ "    FROM (\n"
				+ "        SELECT MAX(bodyInfoDate) AS latestDate\n"
				+ "        FROM bodyInfo\n"
				+ "        WHERE userId = ? \n"
				+ "    ) AS subquery\n"
				+ ");\n"
				+ "";
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setDouble(1, dto.getWeightDifference());
			pstm.setDouble(2, dto.getMuscleMassDifference());
			pstm.setString(3, userId);
			pstm.setString(4, userId);
			int result = pstm.executeUpdate();
			if(result < 0) {
				System.out.println("bodyInfo 차이 insert fail");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
//	public bodyInfoDTO bodyInfoDifference(String userId) {
//		String sql = "select * from bodyInfo where userId = " + "'" + userId + "'" + " order by bodyInfoDate desc limit 2";
//		double weightDifference = 0;
//		double muscleMassDifference = 0;
//		bodyInfoDTO dto = new bodyInfoDTO();
//		try(Connection conn = datasource.getConnection();
//				Statement stmt = conn.createStatement();
//				ResultSet rs = stmt.executeQuery(sql)){
//			if(rs.next()) {
//				double latestMuscleMass = rs.getDouble("muscleMass");
//				double latestWeight = rs.getDouble("weight");
//				if(rs.next()) {
//					double previousMuscleMass = rs.getDouble("muscleMass");
//					double previousWeight = rs.getDouble("weight");
//					
//					weightDifference = latestWeight - previousWeight;
//					muscleMassDifference = latestMuscleMass - previousMuscleMass;
//					
//					System.out.println("몸무게 차이: " + weightDifference);
//					System.out.println("근육량 차이: " + muscleMassDifference);
//					
//					dto.setWeightDifference(weightDifference);
//					dto.setMuscleMassDifference(muscleMassDifference);
//				} else {
//					return null;
//				}
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		
//		sql = "UPDATE bodyInfo\n"
//				+ "SET weightDifference = ? , muscleMassDifference = ?\n"
//				+ "WHERE userId = 'id'\n"
//				+ "AND bodyInfoDate = (\n"
//				+ "    SELECT latestDate\n"
//				+ "    FROM (\n"
//				+ "        SELECT MAX(bodyInfoDate) AS latestDate\n"
//				+ "        FROM bodyInfo\n"
//				+ "        WHERE userId = 'id'\n"
//				+ "    ) AS subquery\n"
//				+ ");\n"
//				+ "";
//		try(Connection conn = datasource.getConnection();
//				PreparedStatement pstm = conn.prepareStatement(sql)){
//			pstm.setDouble(1, weightDifference);
//			pstm.setDouble(2, muscleMassDifference);
//			int result = pstm.executeUpdate();
//			if(result < 0) {
//				System.out.println("bodyInfo 차이 insert fail");
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return dto;
//	}
	
}
