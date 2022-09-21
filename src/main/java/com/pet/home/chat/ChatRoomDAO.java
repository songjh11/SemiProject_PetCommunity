package com.pet.home.chat;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomDAO {

	private Map<String, ChatRoomDTO> chatRoomMap;
	
	@PostConstruct
	private void init() {
		chatRoomMap = new LinkedHashMap<String, ChatRoomDTO>();
	}
	
	public Map<String, ChatRoomDTO> getListAllRoom(){
//		List<ChatRoomDTO> chatRoomDTOs = new ArrayList<ChatRoomDTO>();
//		Collections.reverse(chatRoomDTOs);
		return chatRoomMap;
	}
	
	public ChatRoomDTO getRoomById(String id) {
		return chatRoomMap.get(id);
	}
	
	public ChatRoomDTO addChatRoom(String name) {
		ChatRoomDTO chatRoomDTO = ChatRoomDTO.create(name);
//		chatRoomMap.put(chatRoomDTO.getRoomId(), chatRoomDTO);
		return chatRoomDTO;
	}
	
}
