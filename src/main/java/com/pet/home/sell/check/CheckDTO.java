package com.pet.home.sell.check;

public class CheckDTO {

	private String imp_uid;
	//가맹점번호
    private String merchant_uid;
    //결제번호
    private Long itemNum;
    private String itemName;
    private Long amount;
    private String userId;
    private String revStartDate;
    private String revEndDate;
    private Long adultsCount;
    private Long dogCount;
    private Long itemCatg;

    
    
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
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
