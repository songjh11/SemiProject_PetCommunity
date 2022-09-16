package com.pet.home.sell;

import java.sql.Date;

public class SellItemDTO {

	private Long itemNum;
	private String userId;
	private String itemName;
	private String itemPrice;
	private String itemContents;
	private Date itemSellDate;
	private Date itemStartDate;
	private Date itemEndDate;
	private Double itemLatitude;
	private Double itemLongtitude;
	private Integer itemCount;
	private String itemCatg;
	
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
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemContents() {
		return itemContents;
	}
	public void setItemContents(String itemContents) {
		this.itemContents = itemContents;
	}
	public Date getItemSellDate() {
		return itemSellDate;
	}
	public void setItemSellDate(Date itemSellDate) {
		this.itemSellDate = itemSellDate;
	}
	public Date getItemStartDate() {
		return itemStartDate;
	}
	public void setItemStartDate(Date itemStartDate) {
		this.itemStartDate = itemStartDate;
	}
	public Date getItemEndDate() {
		return itemEndDate;
	}
	public void setItemEndDate(Date itemEndDate) {
		this.itemEndDate = itemEndDate;
	}
	public Double getItemLatitude() {
		return itemLatitude;
	}
	public void setItemLatitude(Double itemLatitude) {
		this.itemLatitude = itemLatitude;
	}
	public Double getItemLongtitude() {
		return itemLongtitude;
	}
	public void setItemLongtitude(Double itemLongtitude) {
		this.itemLongtitude = itemLongtitude;
	}
	public Integer getItemCount() {
		return itemCount;
	}
	public void setItemCount(Integer itemCount) {
		this.itemCount = itemCount;
	}
	public String getItemCatg() {
		return itemCatg;
	}
	public void setItemCatg(String itemCatg) {
		this.itemCatg = itemCatg;
	}
	
	
}
