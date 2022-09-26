package com.pet.home.chat.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatRoomService {

	@Autowired
	private ChatRoomDAO chatRoomDAO;
	
	//채팅 리스트 불러오기
	public List<ChatRoomDTO> getList() throws Exception{
		return chatRoomDAO.getList();
	}
	//채팅방 추가하기
	public int setAdd(ChatRoomDTO chatRoomDTO) throws Exception{
		return chatRoomDAO.setAdd(chatRoomDTO);
	}
	
	
}
