package com.expressbus.www.DTO;

public class memManageDTO {
	//로그인, 회원가입 dto
	
	//member table
	String m_userId;
	String m_password;  
	String m_email; 
	String m_birthYear;
	String m_gender;
	
	public String getM_userId() {
		return m_userId;
	}
	public void setM_userId(String m_userId) {
		this.m_userId = m_userId;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_birthYear() {
		return m_birthYear;
	}
	public void setM_birthYear(String m_birthYear) {
		this.m_birthYear = m_birthYear;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
}
