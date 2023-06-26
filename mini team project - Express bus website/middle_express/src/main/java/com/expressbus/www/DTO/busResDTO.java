package com.expressbus.www.DTO;

public class busResDTO {
	//배차 등록 dto
	
	//terminal table
	String t_name;
	
	//seat table
	int s_seatNum;
	int s_busId;
	
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
	
	//company table
	int c_no;
	String c_name;
	String c_postCode;
	String c_address;
	String c_detailAddress;
	String c_extraAddress;
	String c_tel;
	
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
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
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_postCode() {
		return c_postCode;
	}
	public void setC_postCode(String c_postCode) {
		this.c_postCode = c_postCode;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_detailAddress() {
		return c_detailAddress;
	}
	public void setC_detailAddress(String c_detailAddress) {
		this.c_detailAddress = c_detailAddress;
	}
	public String getC_extraAddress() {
		return c_extraAddress;
	}
	public void setC_extraAddress(String c_extraAddress) {
		this.c_extraAddress = c_extraAddress;
	}
	public String getC_tel() {
		return c_tel;
	}
	public void setC_tel(String c_tel) {
		this.c_tel = c_tel;
	}

	
}
