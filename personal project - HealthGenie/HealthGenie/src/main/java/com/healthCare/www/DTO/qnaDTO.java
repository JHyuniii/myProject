package com.healthCare.www.DTO;

import java.sql.Date;

public class qnaDTO {
	private int QnANum;
	private String sendUser;
	private String receiveUser;
	private boolean solve;
	private Date qnaDate;
	private String qnaContents;
	private String qnaTitle;
	
	public int getQnANum() {
		return QnANum;
	}
	public void setQnANum(int qnANum) {
		QnANum = qnANum;
	}
	public String getSendUser() {
		return sendUser;
	}
	public void setSendUser(String sendUser) {
		this.sendUser = sendUser;
	}
	public String getReceiveUser() {
		return receiveUser;
	}
	public void setReceiveUser(String receiveUser) {
		this.receiveUser = receiveUser;
	}
	public boolean isSolve() {
		return solve;
	}
	public void setSolve(boolean solve) {
		this.solve = solve;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaContents() {
		return qnaContents;
	}
	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
}
