package com.pet.home.sell;

import java.util.List;

import com.pet.home.sell.file.SellFileDTO;

public class ReservationDTO {
	
	private Long itemNum;
	private String userId;
    private String revStartDate;
    private String revEndDate;
    private Long memberCount;
    private String revPayway;
    private Long itemCatg;
    private SellItemDTO sellItemDTO;
    private List<SellFileDTO> fileDTOs;
    public String itemName;
    
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public List<SellFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<SellFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public SellItemDTO getSellItemDTO() {
		return sellItemDTO;
	}
	public void setSellItemDTO(SellItemDTO sellItemDTO) {
		this.sellItemDTO = sellItemDTO;
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
	public Long getMemberCount() {
		return memberCount;
	}
	public void setMemberCount(Long memberCount) {
		this.memberCount = memberCount;
	}
	public String getRevPayway() {
		return revPayway;
	}
	public void setRevPayway(String revPayway) {
		this.revPayway = revPayway;
	}
	public Long getItemCatg() {
		return itemCatg;
	}
	public void setItemCatg(Long itemCatg) {
		this.itemCatg = itemCatg;
	}
    
    


}
