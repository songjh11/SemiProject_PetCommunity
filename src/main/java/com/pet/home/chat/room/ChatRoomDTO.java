package com.pet.home.chat.room;

import java.util.List;

import com.pet.home.member.MemberDTO;

public class ChatRoomDTO {
	
	private Long roomNum;
	private String roomName;
	private String masterName;
	private List<MemberDTO> memberDTOs;
	public Long getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(Long roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getMasterName() {
		return masterName;
	}
	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}
	public List<MemberDTO> getMemberDTOs() {
		return memberDTOs;
	}
	public void setMemberDTOs(List<MemberDTO> memberDTOs) {
		this.memberDTOs = memberDTOs;
	}
	
	
	
	
	
	
}
