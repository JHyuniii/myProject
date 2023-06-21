package com.healthCare.www.DTO;

import java.time.LocalDate;

public class myLogDTO {
	private String logId;
	private String userId;
	private String part;
	private LocalDate exerciseDate;
	private String morningFood;
	private String lunchFood;
	private String dinnerFood;
	private String goodPoint;
	private String badPoint;
	
	
	public String getMorningFood() {
		return morningFood;
	}
	public void setMorningFood(String morningFood) {
		this.morningFood = morningFood;
	}
	public String getLunchFood() {
		return lunchFood;
	}
	public void setLunchFood(String lunchFood) {
		this.lunchFood = lunchFood;
	}
	public String getDinnerFood() {
		return dinnerFood;
	}
	public void setDinnerFood(String dinnerFood) {
		this.dinnerFood = dinnerFood;
	}
	public LocalDate getExerciseDate() {
		return exerciseDate;
	}
	public void setExerciseDate(LocalDate exerciseDate) {
		this.exerciseDate = exerciseDate;
	}
	
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getGoodPoint() {
		return goodPoint;
	}
	public void setGoodPoint(String goodPoint) {
		this.goodPoint = goodPoint;
	}
	public String getBadPoint() {
		return badPoint;
	}
	public void setBadPoint(String badPoint) {
		this.badPoint = badPoint;
	}
	
	
}
