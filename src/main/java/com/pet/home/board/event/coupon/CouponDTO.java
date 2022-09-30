package com.pet.home.board.event.coupon;

import java.sql.Date;

public class CouponDTO {
	
	private Long couponNum;
	private String couponName;
	private Date expDate;
	private Date regDate;
	private String discountMethod;
	private Long discountRate;
	private Long discountPrice;
	
	
	public Long getCouponNum() {
		return couponNum;
	}
	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
	}

	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getDiscountMethod() {
		return discountMethod;
	}
	public void setDiscountMethod(String discountMethod) {
		this.discountMethod = discountMethod;
	}
	public Long getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(Long discountRate) {
		this.discountRate = discountRate;
	}
	public Long getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(Long discountPrice) {
		this.discountPrice = discountPrice;
	}
	
	
	
}
