package com.pet.home.sell.check;

public class CheckDTO {
	private String pg;
	//: "html5_inicis",
    private String pay_method;
    //: "card",
    private String merchant_uid;
    //시퀀스: "ORD20180131-0000011",
    private Long itemNum;
    private String itemName;
    private Long amount;
    private String userId;
    private String revStartDate;
    private String revEndDate;
    private Long adultsCount;
    private Long dogCount;
    private Long itemCatg;
	public String getPg() {
		return pg;
	}
	public void setPg(String pg) {
		this.pg = pg;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public Long getItemNum() {
		return itemNum;
	}
	public void setItemNum(Long itemNum) {
		this.itemNum = itemNum;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRevStartDate() {
		return revStartDate;
	}
	public void setRevStartDate(String revStartDate) {
		this.revStartDate = revStartDate;
	}
	public String getRevEndDate() {
		return revEndDate;
	}
	public void setRevEndDate(String revEndDate) {
		this.revEndDate = revEndDate;
	}
	public Long getAdultsCount() {
		return adultsCount;
	}
	public void setAdultsCount(Long adultsCount) {
		this.adultsCount = adultsCount;
	}
	public Long getDogCount() {
		return dogCount;
	}
	public void setDogCount(Long dogCount) {
		this.dogCount = dogCount;
	}
	public Long getItemCatg() {
		return itemCatg;
	}
	public void setItemCatg(Long itemCatg) {
		this.itemCatg = itemCatg;
	}
    
    
    
    
}
