package com.pet.home.chat.impl;

import java.util.List;

import com.pet.home.chat.ChatMessageDTO;
import com.pet.home.chat.ChatRoomDTO;

public interface ChatService {
	
	
	//방 번호 선택
	public ChatRoomDTO getChatRoomByRoomNum(String roomNum);
	
	//채팅 메세지 DB로 저장
	public int setSaveMessage(ChatMessageDTO chatMessageDTO);
	
	//메세지 내용 리스트 출력
	public List<ChatMessageDTO> getMessageList(String roomNum);
	
	//채팅방 저장
	public int addRoom(ChatRoomDTO chatRoomDTO);
	
	
	//DB에서 채팅방 유무 확인
	public ChatRoomDTO getSearchChatRoom(ChatRoomDTO chatRoomDTO);
	
	//채팅방 리스트 출력
	public List<ChatRoomDTO> getChatRoomList(String userEmail);
	
	//읽지않은 메세지 수 출력
	public Long getUnReadCount(ChatMessageDTO chatMessageDTO);
	
	//읽지않은 메세지 숫자 0으로 바꿈
	public int setCount(ChatMessageDTO chatMessageDTO);
}
