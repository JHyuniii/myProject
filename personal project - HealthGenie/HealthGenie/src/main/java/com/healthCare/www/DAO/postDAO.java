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

import com.healthCare.www.DTO.commentDTO;
import com.healthCare.www.DTO.postDTO;
import com.healthCare.www.DTO.postImgDTO;

public class postDAO {
	private DataSource datasource;
	public static postDAO postDAO = new postDAO();
	
	public postDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static postDAO getPostDAO() {
		return postDAO;
	}
	
	public postDTO getPostDTO() {
		String sql = "select * from post";
		postDTO dto = new postDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setPostNum(rs.getInt("postNum"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCreateDate(rs.getTimestamp("createDate"));
				dto.setViews(rs.getInt("views"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//글 삭제
	public int deletePostDAO(int postNum) {
		String sql = "delete from post where postNum = " + postNum;
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//댓글 삭제
	public int deleteCommentDAO(int commentNum) {
		String sql = "delete from comment where commentNum = " + commentNum;
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//커뮤니티
	public ArrayList<postDTO> communityViewDAO() {
		String sql = "select * from post order by createDate desc";
		ArrayList<postDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				postDTO dto = new postDTO();
				dto.setTitle(rs.getString("title"));
				dto.setUserId(rs.getString("userId"));
				dto.setCreateDate(rs.getTimestamp("createDate"));
				dto.setViews(rs.getInt("views"));
				dto.setPostNum(rs.getInt("postNum"));
				int commentCount = commentCountDAO(rs.getInt("postNum"));
				dto.setCommentCount(commentCount);
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//댓글 수 
	public int commentCountDAO(int postNum) {
		String sql = "select count(*) from comment where postNum = " + postNum;
		int commentCount = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				commentCount = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return commentCount;
	}
	
	//게시판 글쓰기
	public int writePostDAO(postDTO postDTO, postImgDTO postImgDTO) {
		String sql = "insert into post (userId, title, content) values (?, ?, ?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, postDTO.getUserId());
			pstm.setString(2, postDTO.getTitle());
			pstm.setString(3, postDTO.getContent());
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		int postNum = getPostDTO().getPostNum();
		
		sql = "insert into postImg (postNum, userId, fileName) values (?, ?, ?)";
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setInt(1, postNum);
			pstm.setString(2, postImgDTO.getUserId());
			pstm.setString(3, postImgDTO.getFileName());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//조회수 증가
	public void incrementViews(int postNum) {
		String sql = "update post set views=(views+1) where postNum = "+postNum;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	//글 보기
	public postDTO postView(int postNum) {
		incrementViews(postNum);
		String sql = "select * from post where postNum = " + postNum;
		postDTO dto = new postDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCreateDate(rs.getTimestamp("createDate"));
				dto.setViews(rs.getInt("views"));
				dto.setPostNum(postNum);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	//사진 꺼내오기
//	public postImgDTO postViewImg(int postNum) {
//		String sql = "select * from postImg where postNum = "+postNum;
//		postImgDTO dto = new postImgDTO();
//		try(Connection conn = datasource.getConnection();
//				Statement stmt = conn.createStatement();
//				ResultSet rs = stmt.executeQuery(sql)){
//			if(rs.next()) {
//				dto.setFileName(rs.getString("fileName"));
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return dto;
//	}
	public String postViewImg(int postNum) {
		String sql = "select * from postImg where postNum = "+postNum;
		String fileName = "";
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				fileName = rs.getString("fileName");
			} else {
				fileName = null;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	//댓글달기
	public int comment(commentDTO dto) {
		String sql = "insert into comment (postNum, userId, commentContent) values (?,?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setInt(1, dto.getPostNum());
			pstm.setString(2, dto.getUserId());
			pstm.setString(3, dto.getCommentContent());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//댓글보기
	public ArrayList<commentDTO> commentList(int postNum){
		String sql = "select * from comment where postNum = " + postNum + " order by commentCreateDate desc";
		ArrayList<commentDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				commentDTO dto = new commentDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setCommentContent(rs.getString("commentContent"));
				dto.setCommentCreateDate(rs.getTime("commentCreateDate"));
				dto.setCommentNum(rs.getInt("commentNum"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
