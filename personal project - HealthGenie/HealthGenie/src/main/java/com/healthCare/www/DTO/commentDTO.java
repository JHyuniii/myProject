package com.healthCare.www.DTO;

import java.util.Date;

public class commentDTO {
	private int postNum;
	private String userId;
	private String commentContent;
	private Date commentCreateDate;
	private int commentNum;
	
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentCreateDate() {
		return commentCreateDate;
	}
	public void setCommentCreateDate(Date commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}
	
	
}
