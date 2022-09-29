package com.pet.home.sell;

import java.sql.Date;

public class RvCommentDTO {
	private Long rvcNum;
	private Long rvNum;
	private String rvcWriter;
	private String rvcContents;
	private Date rvcRegDate;
	public Long getRvcNum() {
		return rvcNum;
	}
	public void setRvcNum(Long rvcNum) {
		this.rvcNum = rvcNum;
	}
	public Long getRvNum() {
		return rvNum;
	}
	public void setRvNum(Long rvNum) {
		this.rvNum = rvNum;
	}
	public String getRvcWriter() {
		return rvcWriter;
	}
	public void setRvcWriter(String rvcWriter) {
		this.rvcWriter = rvcWriter;
	}
	public String getRvcContents() {
		return rvcContents;
	}
	public void setRvcContents(String rvcContents) {
		this.rvcContents = rvcContents;
	}
	public Date getRvcRegDate() {
		return rvcRegDate;
	}
	public void setRvcRegDate(Date rvcRegDate) {
		this.rvcRegDate = rvcRegDate;
	}
}
