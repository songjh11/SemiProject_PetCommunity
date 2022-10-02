package com.pet.home.sell;

public class SellQnaCommentDTO {
	
	private Long sqNum;
	private Long qnaNum;
	private String sqWriter;
	private String sqContents;
	public Long getSqNum() {
		return sqNum;
	}
	public void setSqNum(Long sqNum) {
		this.sqNum = sqNum;
	}
	public Long getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(Long qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getSqWriter() {
		return sqWriter;
	}
	public void setSqWriter(String sqWriter) {
		this.sqWriter = sqWriter;
	}
	public String getSqContents() {
		return sqContents;
	}
	public void setSqContents(String sqContents) {
		this.sqContents = sqContents;
	}

}
