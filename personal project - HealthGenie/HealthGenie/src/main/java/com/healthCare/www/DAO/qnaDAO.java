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

import com.healthCare.www.DTO.qnaAdminDTO;
import com.healthCare.www.DTO.qnaDTO;

public class qnaDAO {
	private static qnaDAO qnaDAO = new qnaDAO();
	private DataSource datasource;
	
	public qnaDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static qnaDAO getQnaDAO() {
		return qnaDAO;
	}
	
	//문의 답변 작성 (관리자 -> 회원)
		public int qnaSendForMemberDAO(qnaDTO dto) {
			String sql = "insert into qna (sendUser, receiveUser, qnaContents, qnaTitle, solve, receiveNum) values (?,?,?,?,true,?)";
			int result = 0;
			try(Connection conn = datasource.getConnection();
					PreparedStatement pstm = conn.prepareStatement(sql)){
				pstm.setString(1, dto.getSendUser());
				pstm.setString(2, dto.getReceiveUser());
				pstm.setString(3, dto.getQnaContents());
				pstm.setString(4, dto.getQnaTitle());
				pstm.setInt(5, dto.getQnANum());
				result = pstm.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			sql = "update QnA set solve = true where QnANum = " + dto.getQnANum();
			try(Connection conn = datasource.getConnection();
					PreparedStatement pstm = conn.prepareStatement(sql)){
				result = pstm.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
	
	//문의 상세 보기 (회원)
	public qnaDTO quaMemberViewDAO(int QnANum) {
		String sql = "select * from qna where QnANum = " + QnANum;
		qnaDTO dto = new qnaDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setQnaTitle(rs.getString("qnaTitle"));
				dto.setQnaContents(rs.getString("qnaContents"));
				dto.setSolve(rs.getBoolean("solve"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//문의 답변 보기 (회원 입장에서)
	public qnaAdminDTO qnaMemberReceiveViewDAO(int QnANum, String userId) {
		String sql = "select * from qna where receiveNum = " + QnANum + " and receiveUser = " + "'" + userId + "'";
		System.out.println("문의 답변 보기 sql ; " + sql);
		qnaAdminDTO qnaAdminDTO = new qnaAdminDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				qnaAdminDTO.setQnaTitle(rs.getString("qnaTitle"));
				qnaAdminDTO.setSendUser(rs.getString("sendUser"));
				qnaAdminDTO.setQnaContents(rs.getString("qnaContents"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return qnaAdminDTO;
	}
	
	//문의 작성 (회원 -> 관리자)
	public int qnaSendForAdminDAO(qnaDTO dto) {
		String sql = "insert into qna (sendUser, receiveUser, qnaContents, qnaTitle) values (?,?,?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, dto.getSendUser());
			pstm.setString(2, dto.getReceiveUser());
			pstm.setString(3, dto.getQnaContents());
			pstm.setString(4, dto.getQnaTitle());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//문의 목록 (회원)
	public ArrayList<qnaDTO> qnaMemberList(String sendUser){
		String sql = "select * from qna where sendUser = " + "'" + sendUser + "' order by qnaDate desc";
		ArrayList<qnaDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				qnaDTO dto = new qnaDTO();
				dto.setQnaTitle(rs.getString("qnaTitle"));
				dto.setQnaContents(rs.getString("qnaContents"));
				dto.setQnANum(rs.getInt("QnANum"));
				System.out.println(rs.getInt("QnANum"));
				dto.setQnaDate(rs.getDate("qnaDate"));
				dto.setSolve(rs.getBoolean("solve"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//문의 목록 (관리자)
	public ArrayList<qnaDTO> qnaAdminListDAO(){
		String sql = "select * from qna where receiveUser = 'superAdmin' order by qnaDate ASC";
		ArrayList<qnaDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				qnaDTO dto = new qnaDTO();
				dto.setQnaTitle(rs.getString("qnaTitle"));
				dto.setQnaContents(rs.getString("qnaContents"));
				dto.setQnANum(rs.getInt("QnANum"));
				dto.setQnaDate(rs.getDate("qnaDate"));
				dto.setSolve(rs.getBoolean("solve"));
				dto.setSendUser(rs.getString("sendUser"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//문의 상세 보기 (관리자)
		public qnaDTO qnaAdminViewDAO(int QnANum) {
			String sql = "select * from qna where QnANum = " + QnANum;
			qnaDTO dto = new qnaDTO();
			try(Connection conn = datasource.getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql)){
				if(rs.next()) {
					dto.setSendUser(rs.getString("sendUser"));
					dto.setQnaTitle(rs.getString("qnaTitle"));
					dto.setQnaContents(rs.getString("qnaContents"));
					dto.setQnANum(rs.getInt("QnANum"));
					dto.setSolve(rs.getBoolean("solve"));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return dto;
		}
}
