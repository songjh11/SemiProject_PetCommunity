package com.pet.home.sell.check;

import java.sql.Date;
import java.util.List;

import com.pet.home.member.MemberDTO;
import com.pet.home.sell.SellItemDTO;

public class CheckDTO {

	private String imp_uid;
	//가맹점번호
    private String merchant_uid;
    //결제번호
    private Long itemNum;
    private Long amount;
    private String userId;
    private String revStartDate;
    private String revEndDate;
    private Long adultsCount;
    private Long dogCount;
    private Date purchaseDate;
    
    
    private MemberDTO memberDTO;
    
    private SellItemDTO itemDTO;
    
    
    
	public MemberDTO getMemberDTO() {
		return memberDTO;
	}
	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}
	public SellItemDTO getItemDTO() {
		return itemDTO;
	}
	public void setItemDTO(SellItemDTO itemDTO) {
		this.itemDTO = itemDTO;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
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
    
}
