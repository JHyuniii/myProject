package com.healthCare.www.DTO;

import java.time.LocalDate;

public class bodyInfoDTO {
	private String userId;
	private double weight;
	private double muscleMass;
	private LocalDate bodyInfoDate;
	private double bmi;
	private double weightDifference;
	private double muscleMassDifference;
	
	public double getWeightDifference() {
		return weightDifference;
	}
	public void setWeightDifference(double weightDifference) {
		this.weightDifference = weightDifference;
	}
	public double getMuscleMassDifference() {
		return muscleMassDifference;
	}
	public void setMuscleMassDifference(double muscleMassDifference) {
		this.muscleMassDifference = muscleMassDifference;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public double getMuscleMass() {
		return muscleMass;
	}
	public void setMuscleMass(double muscleMass) {
		this.muscleMass = muscleMass;
	}
	public LocalDate getBodyInfoDate() {
		return bodyInfoDate;
	}
	public void setBodyInfoDate(LocalDate bodyInfoDate) {
		this.bodyInfoDate = bodyInfoDate;
	}
	public double getBmi() {
		return bmi;
	}
	public void setBmi(double bmi) {
		this.bmi = bmi;
	}
}
