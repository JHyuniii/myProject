package com.healthCare.www.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.healthCare.www.DTO.interestListDTO;
import com.mysql.cj.xdevapi.Result;

public class interestListDAO {
	private static interestListDAO interestListDAO = new interestListDAO();
	private DataSource datasource;
	
	public interestListDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static interestListDAO getInterestListDAO() {
		return interestListDAO;
	}
	
	//관심목록 삭제
	public int interestDeleteDAO(String exerciseId, String userId) {
		String sql = "delete from interestList where userId = " + "'" + userId + "'" + " and exerciseId = " + "'" + exerciseId + "'";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//관심목록 불러오기
	public ArrayList<interestListDTO> interestListLoadDAO(String userId){
		String sql = "select * from interestList where userId = " + "'" + userId + "' order by interestDate desc";
		ArrayList<interestListDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				interestListDTO dto = new interestListDTO();
				dto.setExerciseId(rs.getString("exerciseId"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//관심목록에 담기
	public int saveExerciseDAO(interestListDTO dto) {
		String sql = "select * from interestList where userId = " + "'" + dto.getUserId() + "'" + " and exerciseId = " + "'" + dto.getExerciseId() + "'";
		int result = 0;
		
		if(dto.getUserId() == null) {
			result = 3;
			return result;
		}

		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = -1;
				return result;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		sql = "insert into interestList (userId, exerciseId) values (?,?)";
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, dto.getUserId());
			pstm.setString(2, dto.getExerciseId());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
