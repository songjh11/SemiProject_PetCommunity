package com.pet.home.sell;

import java.util.List;

public class SellQnaDTO {
	
	private Long qnaNum;
	private Long itemNum;
	private String userId;
	private String title;
	private List<SellQnaCommentDTO> sellQnaCommentDTOs;
	public List<SellQnaCommentDTO> getSellQnaCommentDTOs() {
		return sellQnaCommentDTOs;
	}
	public void setSellQnaCommentDTOs(List<SellQnaCommentDTO> sellQnaCommentDTOs) {
		this.sellQnaCommentDTOs = sellQnaCommentDTOs;
	}
	public Long getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(Long qnaNum) {
		this.qnaNum = qnaNum;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	private String contents;

}
