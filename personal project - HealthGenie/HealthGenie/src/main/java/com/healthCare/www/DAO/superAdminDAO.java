package com.healthCare.www.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class superAdminDAO {
	private static superAdminDAO superAdminDAO = new superAdminDAO();
	private DataSource datasource;
	
	public superAdminDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static superAdminDAO getSuperAdminDAO() {
		return superAdminDAO;
	}
	
	//회원수 카운트
	public int memberCountDAO() {
		String sql = "select count(*) from member where division = 0";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//게시판 글 수 카운트
	public int postCountDAO() {
		String currentDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

		String sql = "SELECT COUNT(*) FROM post WHERE DATE(createDate) = '" + currentDate + "';";
		System.out.println("postCount sql : " + sql);
		int result = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//신고 수 카운트
	public int reportCountDAO() {
		String sql = "select count(*) from report where solve = false";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//문의 수 카운트
	public int qnaCountDAO() {
		String sql = "select count(*) from qna where solve = false";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
