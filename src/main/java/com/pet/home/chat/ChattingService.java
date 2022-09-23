package com.pet.home.chat;

import java.util.List;

import com.pet.home.chat.impl.ChatService;

public class ChattingService implements ChatService {

	@Override
	public ChatRoomDTO getChatRoomByRoomNum(String roomNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setSaveMessage(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ChatMessageDTO> getMessageList(String roomNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addRoom(ChatRoomDTO chatRoomDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChatRoomDTO getSearchChatRoom(ChatRoomDTO chatRoomDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoomDTO> getChatRoomList(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getUnReadCount(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setCount(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
