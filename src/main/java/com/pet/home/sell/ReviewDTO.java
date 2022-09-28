package com.pet.home.sell;

import java.util.List;

import com.pet.home.sell.file.RvFileDTO;

public class ReviewDTO {
	
	private Long rvNum;
	private Long itemNum;
	private String userId;
	private String rvTitle;
	private String rvContents;
	private Double rvRate;
	private List<RvFileDTO> rvFileDTOs;
	private List<RvCommentDTO> rvCommentDTOs;
	public List<RvFileDTO> getRvFileDTOs() {
		return rvFileDTOs;
	}
	public void setRvFileDTOs(List<RvFileDTO> rvFileDTOs) {
		this.rvFileDTOs = rvFileDTOs;
	}
	public List<RvCommentDTO> getRvCommentDTOs() {
		return rvCommentDTOs;
	}
	public void setRvCommentDTOs(List<RvCommentDTO> rvCommentDTOs) {
		this.rvCommentDTOs = rvCommentDTOs;
	}
	public Long getRvNum() {
		return rvNum;
	}
	public void setRvNum(Long rvNum) {
		this.rvNum = rvNum;
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
	public String getRvTitle() {
		return rvTitle;
	}
	public void setRvTitle(String rvTitle) {
		this.rvTitle = rvTitle;
	}
	public String getRvContents() {
		return rvContents;
	}
	public void setRvContents(String rvContents) {
		this.rvContents = rvContents;
	}
	public Double getRvRate() {
		return rvRate;
	}
	public void setRvRate(Double rvRate) {
		this.rvRate = rvRate;
	}

}
