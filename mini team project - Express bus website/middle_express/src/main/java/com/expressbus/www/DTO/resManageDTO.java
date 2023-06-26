package com.expressbus.www.DTO;

public class resManageDTO {
	//예약관리 dto
	
	//seat table
	int s_seatNum;
	int s_busId;
	
	//reservation table
	int r_seatNum;
	int r_busId;
	String r_userId;
	String r_name;
	String r_division;
	String r_price;
	
	public int getS_seatNum() {
		return s_seatNum;
	}
	public void setS_seatNum(int s_seatNum) {
		this.s_seatNum = s_seatNum;
	}
	public int getS_busId() {
		return s_busId;
	}
	public void setS_busId(int s_busId) {
		this.s_busId = s_busId;
	}
	public int getR_seatNum() {
		return r_seatNum;
	}
	public void setR_seatNum(int r_seatNum) {
		this.r_seatNum = r_seatNum;
	}
	public int getR_busId() {
		return r_busId;
	}
	public void setR_busId(int r_busId) {
		this.r_busId = r_busId;
	}
	public String getR_userId() {
		return r_userId;
	}
	public void setR_userId(String r_userId) {
		this.r_userId = r_userId;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_division() {
		return r_division;
	}
	public void setR_division(String r_division) {
		this.r_division = r_division;
	}
	public String getR_price() {
		return r_price;
	}
	public void setR_price(String r_price) {
		this.r_price = r_price;
	}
}
