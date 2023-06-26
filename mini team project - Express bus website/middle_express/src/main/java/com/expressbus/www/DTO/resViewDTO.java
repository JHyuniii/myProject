package com.expressbus.www.DTO;

public class resViewDTO {
	//예약 확인 dto
	
	//reservation table
	int r_seatNum;
	int r_busId;
	String r_userId;
	String r_name;
	String r_division;
	String r_price;
	
	//busSchedule table
	String b_departureTime;
	String b_arrivalTime;
	String b_arrivalDate;
	String b_departureDate;
	String b_startTerminal;
	String b_arrivalTerminal;
	int b_busId;
	
	//busInfo table
	int i_busId;
	String i_grade;
	String i_name;
	int i_seatNum;
	String i_price;
	String i_busNum;
	
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
	public String getB_departureTime() {
		return b_departureTime;
	}
	public void setB_departureTime(String b_departureTime) {
		this.b_departureTime = b_departureTime;
	}
	public String getB_arrivalTime() {
		return b_arrivalTime;
	}
	public void setB_arrivalTime(String b_arrivalTime) {
		this.b_arrivalTime = b_arrivalTime;
	}
	public String getB_arrivalDate() {
		return b_arrivalDate;
	}
	public void setB_arrivalDate(String b_arrivalDate) {
		this.b_arrivalDate = b_arrivalDate;
	}
	public String getB_departureDate() {
		return b_departureDate;
	}
	public void setB_departureDate(String b_departureDate) {
		this.b_departureDate = b_departureDate;
	}
	public String getB_startTerminal() {
		return b_startTerminal;
	}
	public void setB_startTerminal(String b_startTerminal) {
		this.b_startTerminal = b_startTerminal;
	}
	
	public String getB_arrivalTerminal() {
		return b_arrivalTerminal;
	}
	public void setB_arrivalTerminal(String b_arrivalTerminal) {
		this.b_arrivalTerminal = b_arrivalTerminal;
	}
	public int getB_busId() {
		return b_busId;
	}
	public void setB_busId(int b_busId) {
		this.b_busId = b_busId;
	}
	public int getI_busId() {
		return i_busId;
	}
	public void setI_busId(int i_busId) {
		this.i_busId = i_busId;
	}
	public String getI_grade() {
		return i_grade;
	}
	public void setI_grade(String i_grade) {
		this.i_grade = i_grade;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public int getI_seatNum() {
		return i_seatNum;
	}
	public void setI_seatNum(int i_seatNum) {
		this.i_seatNum = i_seatNum;
	}
	public String getI_price() {
		return i_price;
	}
	public void setI_price(String i_price) {
		this.i_price = i_price;
	}
	public String getI_busNum() {
		return i_busNum;
	}
	public void setI_busNum(String i_busNum) {
		this.i_busNum = i_busNum;
	}
	
}
