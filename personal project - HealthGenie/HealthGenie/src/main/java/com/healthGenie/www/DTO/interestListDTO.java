package com.healthGenie.www.DTO;

import java.sql.Date;

public class interestListDTO {
	private String userId;
	private String exerciseId;
	private Date interestDate;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getExerciseId() {
		return exerciseId;
	}
	public void setExerciseId(String exerciseId) {
		this.exerciseId = exerciseId;
	}
	public Date getInterestDate() {
		return interestDate;
	}
	public void setInterestDate(Date interestDate) {
		this.interestDate = interestDate;
	}
}
