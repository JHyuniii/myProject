package com.healthGenie.www.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.healthGenie.www.DTO.reportMessageDTO;

public class reportMessageDAO {
	private static reportMessageDAO reportMessageDAO = new reportMessageDAO();
	private DataSource datasource;

	public reportMessageDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static reportMessageDAO getReportMessageDAO() {
		return reportMessageDAO;
	}

	// 신고 알림 확인하기 (회원이 본인 마이페이지에서)
	public ArrayList<reportMessageDTO> reportListMyPageDAO(String userId) {
		String sql = "select * from reportMessage where userId = " + "'" + userId + "'";
		ArrayList<reportMessageDTO> list = new ArrayList<>();
		try (Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				reportMessageDTO dto = new reportMessageDTO();
				dto.setDeleteDate(rs.getDate("deleteDate"));
				dto.setUserId(rs.getString("userId"));

				dto.setReportNum(rs.getString("reportNum"));
				if (rs.getString("reportNum").substring(0, 2).equals("p_")) {
					dto.setTitle(getPostTitle(Integer.parseInt(rs.getString("reportNum").substring(2))));
				} else if (rs.getString("reportNum").substring(0, 2).equals("c_")) {
					dto.setCommentContent(getCommentContent(Integer.parseInt(rs.getString("reportNum").substring(2))));
				}

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 게시물 제목 가져오기
	public String getPostTitle(int reportNum) {
		String sql = "select * from post where postNum = " + reportNum;
		String postTitle = "";
		try (Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			if (rs.next()) {
				postTitle = rs.getString("title");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postTitle;
	}

	// 댓글 내용 가져오기
	public String getCommentContent(int reportNum) {
		String sql = "select * from comment where commentNum = " + reportNum;
		String commentContent = "";
		try (Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			if (rs.next()) {
				commentContent = rs.getString("commentContent");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return commentContent;
	}

	// 신고 개수 카운팅
	public int reportCountDAO(String userId) {
		String sql = "select count(*) from reportMessage where userId = " + "'" + userId + "'";
		int result = 0;
		try (Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
