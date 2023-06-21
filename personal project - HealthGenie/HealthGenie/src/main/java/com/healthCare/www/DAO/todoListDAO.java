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

import com.healthCare.www.DTO.todoListDTO;

public class todoListDAO {
	private DataSource datasource;
	public static todoListDAO todoListDAO = new todoListDAO();
	
	public todoListDAO() {
		try {
			Context context = new InitialContext();
			datasource = (DataSource) context.lookup("java:comp/env/jdbc/healthCare");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}

	public static todoListDAO getTodoListDAO() {
		return todoListDAO;
	}
	
	//todoList completed
	public int todoListCompletedDAO(String todoListId, todoListDTO dto) {
		String sql = "update todoList set completed = ? where todoListId = " + "'" + todoListId + "'";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setBoolean(1, dto.isCompleted());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//todoList insert
	public int todoListInsertDAO(todoListDTO dto) {
		String sql = "insert into todoList (todoListId, userId, list, todoDate) values (?,?,?,?)";
		int result = 0;
		try(Connection conn = datasource.getConnection();
				PreparedStatement pstm = conn.prepareStatement(sql)){
			pstm.setString(1, dto.getTodoListId());
			pstm.setString(2, dto.getUserId());
			pstm.setString(3, dto.getList());
			pstm.setDate(4, dto.getTodoDate());
			result = pstm.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//todoList list show
	public ArrayList<todoListDTO> todoListShowDAO(todoListDTO todoListDTO){
		String sql = "select * from todoList where userId = " + "'" + todoListDTO.getUserId() + "'" + " and todoDate = " + "'" + todoListDTO.getTodoDate() + "'";
		ArrayList<todoListDTO> list = new ArrayList<>();
		try(Connection conn = datasource.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				todoListDTO dto = new todoListDTO();
				dto.setList(rs.getString("list"));
				dto.setCompleted(rs.getBoolean("completed"));
				dto.setTodoListId(rs.getString("todoListId"));
				dto.setTodoDate(rs.getDate("todoDate"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
