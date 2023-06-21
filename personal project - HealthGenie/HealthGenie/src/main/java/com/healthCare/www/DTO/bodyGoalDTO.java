package com.healthCare.www.DTO;

import java.time.LocalDate;

public class bodyGoalDTO {
	private String userId;
	private double goalWeight;
	private double goalMuscleMass;
	private LocalDate goalDate;
	private boolean achievement;
	private LocalDate setDate;
	
	public LocalDate getSetDate() {
		return setDate;
	}
	public void setSetDate(LocalDate setDate) {
		this.setDate = setDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public double getGoalWeight() {
		return goalWeight;
	}
	public void setGoalWeight(double goalWeight) {
		this.goalWeight = goalWeight;
	}
	public double getGoalMuscleMass() {
		return goalMuscleMass;
	}
	public void setGoalMuscleMass(double goalMuscleMass) {
		this.goalMuscleMass = goalMuscleMass;
	}
	public LocalDate getGoalDate() {
		return goalDate;
	}
	public void setGoalDate(LocalDate goalDate) {
		this.goalDate = goalDate;
	}
	public boolean isAchievement() {
		return achievement;
	}
	public void setAchievement(boolean achievement) {
		this.achievement = achievement;
	}
}
