package com.pet.home.member;

public class BizmemDTO extends MemberDTO{
	
	private String itemCatg;
	private String itemId;
	private Long bizNum;
	
	public Long getBizNum() {
		return bizNum;
	}
	public void setBizNum(Long bizNum) {
		this.bizNum = bizNum;
	}
	public String getItemCatg() {
		return itemCatg;
	}
	public void setItemCatg(String itemCatg) {
		this.itemCatg = itemCatg;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	

}
