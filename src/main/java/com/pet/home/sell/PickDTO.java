package com.pet.home.sell;

import java.sql.Date;

import com.pet.home.member.MemberDTO;

public class PickDTO {
	
	private Long pickNum;
	private Long itemNum;
	private String userId;
	private Date pickDate;
	private Long pickValue;

	public Long getPickNum() {
		return pickNum;
	}
	public void setPickNum(Long pickNum) {
		this.pickNum = pickNum;
	}
	public Long getItemNum() {
		return itemNum;
	}
	public void setItemNum(Long itemNum) {
		this.itemNum = itemNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getPickDate() {
		return pickDate;
	}
	public void setPickDate(Date pickDate) {
		this.pickDate = pickDate;
	}
	public Long getPickValue() {
		return pickValue;
	}
	public void setPickValue(Long pickValue) {
		this.pickValue = pickValue;
	}

}
