package com.healthCare.www.DTO;

import java.sql.Date;

public class todoListDTO {
	private String todoListId;
	private String userId;
	private String list;
	private boolean completed;
	private Date todoDate;
	public String getTodoListId() {
		return todoListId;
	}
	public void setTodoListId(String todoListId) {
		this.todoListId = todoListId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getList() {
		return list;
	}
	public void setList(String list) {
		this.list = list;
	}
	public boolean isCompleted() {
		return completed;
	}
	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
	public Date getTodoDate() {
		return todoDate;
	}
	public void setTodoDate(Date todoDate) {
		this.todoDate = todoDate;
	}
	
	
}
