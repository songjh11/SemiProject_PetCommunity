package com.pet.home.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.home.chat.impl.ChatService;

@Service
public class ChattingService implements ChatService {
	
	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public ChatRoomDTO getChatRoomByRoomNum(String roomNum) {
		// TODO Auto-generated method stub
		return chatDAO.getChatRoomByRoomNum(roomNum);
	}

	@Override
	public int setSaveMessage(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return chatDAO.setSaveMessage(chatMessageDTO);
	}

	@Override
	public List<ChatMessageDTO> getMessageList(String roomNum) {
		// TODO Auto-generated method stub
		return chatDAO.getMessageList(roomNum);
	}

	@Override
	public int addRoom(ChatRoomDTO chatRoomDTO) {
		// TODO Auto-generated method stub
		return chatDAO.addRoom(chatRoomDTO);
	}

	@Override
	public ChatRoomDTO getSearchChatRoom(ChatRoomDTO chatRoomDTO) {
		// TODO Auto-generated method stub
		return chatDAO.getSearchChatRoom(chatRoomDTO);
	}

	@Override
	public List<ChatRoomDTO> getChatRoomList(String userEmail) {
		// TODO Auto-generated method stub
		return chatDAO.getChatRoomList(userEmail);
	}

	@Override
	public Long getUnReadCount(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return chatDAO.getUnReadCount(chatMessageDTO);
	}

	@Override
	public int setCount(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return chatDAO.setCount(chatMessageDTO);
	}
	
	
	
}
