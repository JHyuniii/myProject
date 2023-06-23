package com.healthGenie.www.DAO;

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

import com.healthGenie.www.DTO.reportDTO;

public class reportDAO {
	private static reportDAO reportDAO = new reportDAO();
	private DataSource datasource;
	
	public reportDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static reportDAO getReportDAO() {
		return reportDAO;
	}
	
	//신고 처리 후 알림 보내기
	public int reportDeleteDAO(String userId, String reportNum) {
		String sql = "insert into reportMessage (userId, reportNum) values (?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, userId);
			pstm.setString(2, reportNum);
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//게시물 목록 불러오기 (관리자)
	public ArrayList<reportDTO> reportListDAO(){
		String sql = "select * from report";
		ArrayList<reportDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				reportDTO dto = new reportDTO();
				dto.setCommentNum(rs.getInt("commentNum"));
				dto.setPostNum(rs.getInt("postNum"));
				dto.setReportContents(rs.getString("reportContents"));
				dto.setReportDate(rs.getDate("reportDate"));
				dto.setSolve(rs.getBoolean("solve"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//게시물db에서 userId 가져오기
	public String postGetUserIdDAO(int reportNum) {
		String sql = "select userId from post where postNum = " + reportNum;
		String userId = "";
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				userId = rs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return userId;
	}
	//댓글db에서 userId 가져오기
	public String commentGetUserIdDAO(int reportNum) {
		String sql = "select userId from comment where commentNum = " + reportNum;
		String userId = "";
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				userId = rs.getString(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return userId;
	}
	
	//게시물 신고 접수
	public int postReportInsertDAO(reportDTO dto) {
		String userId = postGetUserIdDAO(dto.getPostNum());
		String sql = "insert into report (postNum, reportContents, userId) values (?,?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setInt(1, dto.getPostNum());
			pstm.setString(2, dto.getReportContents());
			pstm.setString(3, userId);
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//댓글 신고 접수
	public int commentReportInsertDAO(reportDTO dto) {
		String userId = commentGetUserIdDAO(dto.getCommentNum());
		String sql = "insert into report (commentNum, reportContents, userId) values (?,?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setInt(1, dto.getCommentNum());
			pstm.setString(2, dto.getReportContents());
			pstm.setString(3, userId);
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//신고 내용 상세보기 (관리자)
	public reportDTO reportViewDAO(int reportNum) {
		String sql = "SELECT * FROM report WHERE (commentNum = "+reportNum+" AND postNum IS NULL) OR (postNum = "+reportNum+" AND commentNum IS NULL)";
		reportDTO dto = new reportDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setReportDate(rs.getDate("reportDate"));
				dto.setReportContents(rs.getString("reportContents"));
				
				Integer postNum = (Integer) rs.getObject("postNum");
				Integer commentNum = (Integer) rs.getObject("commentNum");
				if( postNum == null || postNum == 0 ) {
					dto.setCommentNum(reportNum);
				} else if ( commentNum == null || commentNum == 0 ) {
					dto.setPostNum(reportNum);
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
}
