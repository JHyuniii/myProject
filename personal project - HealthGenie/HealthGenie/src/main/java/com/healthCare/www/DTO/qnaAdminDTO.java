package com.healthCare.www.DTO;

public class qnaAdminDTO {
	private String qnaContents;
	private String qnaTitle;
	private int QnANum;
	private String sendUser;
	private String receiveUser;
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
	
}
