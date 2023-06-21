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

import com.healthCare.www.Command.preventGoalViewCommand;
import com.healthCare.www.DTO.memberDTO;

public class memberDAO {
	private static memberDAO memberDAO = new memberDAO();
	private DataSource datasource;
	
	public memberDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static memberDAO getMemberDAO() {
		return memberDAO;
	}
	
	//회원 수정 완료
	public int modifyMembershipOKDAO(memberDTO dto) {
		String sql = "update member set gender = ? , phoneNumber = ? , password = ? where userId = ?";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, dto.getGender());
			pstm.setString(2, dto.getPhoneNumber());
			pstm.setString(3, dto.getPassword());
			pstm.setString(4, dto.getUserId());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//회원 정보 수정 (불러오기)
	public memberDTO modifyMembershipDAO(String userId) {
		String sql = "select * from member where userId = " + "'" + userId + "'";
		memberDTO dto = new memberDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setPhoneNumber(rs.getString("phoneNumber"));
				dto.setBirth(rs.getString("birth"));
				dto.setGender(rs.getString("gender"));
				dto.setPassword(rs.getString("password"));
			}	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원 삭제
	public int memberDeleteDAO(int memberNum) {
		String sql = "delete from member where memberNum = " + memberNum;
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//회원 상세정보
	public memberDTO memerViewDAO(int memberNum) {
		String sql = "select * from member where memberNum = " + memberNum;
		memberDTO dto = new memberDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setUserId(rs.getString("userId"));
				dto.setPhoneNumber(rs.getString("phoneNumber"));
				dto.setGender(rs.getString("gender"));
				dto.setCreateDate(rs.getDate("createDate"));
				dto.setPassword(rs.getString("password"));
				dto.setBirth(rs.getString("birth"));
				dto.setMemberNum(memberNum);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원 리스트
	public ArrayList<memberDTO> memberList(){
		String sql = "select * from member where division = 0 order by createDate desc";
		ArrayList<memberDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				memberDTO dto = new memberDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setPhoneNumber(rs.getString("phoneNumber"));
				dto.setGender(rs.getString("gender"));
				dto.setCreateDate(rs.getDate("createDate"));
				dto.setMemberNum(rs.getInt("memberNum"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//관리자 아이디 확인
	public int idSuperCheckDAO(String inputSuperId) {
		String sql = "select * from member where userId = " + "'" + inputSuperId + "' and division = " + 1;
		int result = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//함께한 시간 계산
	public memberDTO createDateCheckDAO(String id) {
		String sql = "select * from member where userId="+"'"+id+"'";
		memberDTO dto = new memberDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				dto.setCreateDate(rs.getDate("createDate"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원가입 - 아이디 중복확인
	public int checkRedundancyDAO(String id) {
		String sql = "select userId from member where userId="+"'"+id+"'";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = -1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//회원가입 - 전화번호 중복확인
	public int phoneNumberCheckDAO(String phoneNumber) {
		String sql = "select phoneNumber from member where phoneNumber="+"'"+phoneNumber+"'";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				result = -1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//멤버 수 카운트
	public int countMemeberDAO() {
		String sql = "select count(*) from member where division = 0";
		int cnt = 0;
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//회원가입
	public int joinMemberShipDAO(memberDTO dto) {
		int cnt = countMemeberDAO();
		String sql = "insert into member (userId, password, phoneNumber, gender, birth, memberNum) values(?,?,?,?,?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, dto.getUserId());
			pstm.setString(2, dto.getPassword());
			pstm.setString(3, dto.getPhoneNumber());
			pstm.setString(4, dto.getGender());
			pstm.setString(5, dto.getBirth());
			pstm.setInt(6, cnt+1);
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//로그인
	public int loginDAO(memberDTO dto) {
		String sql = "select * from member where userId = "+"'"+dto.getUserId()+"'"+" and password = "+"'"+dto.getPassword()+"'";
		System.out.println("로그인 sql : " + sql);
		
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				return 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//아이디 찾기
	public String findIdDAO(memberDTO dto) {
		String sql = "select * from member where phoneNumber = "+"'"+dto.getPhoneNumber()+"'"+" and birth = "+"'"+dto.getBirth()+"'";
		System.out.println("아이디 찾기 sql : " + sql);
		String result = null;
//		memberDTO memberDTO = new memberDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
//				memberDTO.setUserId(rs.getString("userId"));
				result = rs.getString("userId");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
//		return memberDTO;
		return result;
	}
//	public memberDTO findIdDAO(memberDTO dto) {
//		String sql = "select * from member where phoneNumber = "+"'"+dto.getPhoneNumber()+"'"+" and birth = "+"'"+dto.getBirth()+"'";
//		System.out.println("아이디 찾기 sql : " + sql);
//		
//		memberDTO memberDTO = new memberDTO();
//		try(Connection conn = datasource.getConnection();
//				Statement stmt = conn.createStatement();
//				ResultSet rs = stmt.executeQuery(sql)){
//			if(rs.next()) {
//				memberDTO.setUserId(rs.getString("userId"));
//			}else {
//				memberDTO=null;
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return memberDTO;
//	}
	
	//비밀번호 찾기
	public String findPasswordDAO(memberDTO dto) {
		String sql = "select * from member where phoneNumber = "+"'"+dto.getPhoneNumber()+"'"+" and userId = "+"'"+dto.getUserId()+"'";
		System.out.println("비밀번호 찾기 sql : " + sql);
		String result = null;
//		memberDTO memberDTO = new memberDTO();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
//				memberDTO.setPassword(rs.getString("password"));
				return rs.getString("password");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
//	public memberDTO findPasswordDAO(memberDTO dto) {
//		String sql = "select * from member where phoneNumber = "+"'"+dto.getPhoneNumber()+"'"+" and userId = "+"'"+dto.getUserId()+"'";
//		System.out.println("비밀번호 찾기 sql : " + sql);
//		
//		memberDTO memberDTO = new memberDTO();
//		try(Connection conn = datasource.getConnection();
//				Statement stmt = conn.createStatement();
//				ResultSet rs = stmt.executeQuery(sql)){
//			if(rs.next()) {
//				memberDTO.setPassword(rs.getString("password"));
//			} else {
//				memberDTO=null;
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}
//		return memberDTO;
//	}
}
