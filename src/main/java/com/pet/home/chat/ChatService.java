package com.pet.home.chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChatService {
	
	@Autowired
    private ObjectMapper objectMapper;
    private Map<String, ChatRoomDTO> chatRooms;

    @PostConstruct
    private void init() {
        chatRooms = new LinkedHashMap<String, ChatRoomDTO>();
    }

    public List<ChatRoomDTO> findAllRoom() {
        return new ArrayList<ChatRoomDTO>(chatRooms.values());
    }

    public ChatRoomDTO findRoomById(String roomId) {
        return chatRooms.get(roomId);
    }

    public void createRoom(String name) {
        System.out.println("채팅방 이름:" + name);
        
    	String randomId = UUID.randomUUID().toString();
//        ChatRoomDTO chatRoomDTO = ChatRoomDTO.builder()
//                .roomId(randomId)
//                .name(name)
//                .build();
//        chatRooms.put(randomId, chatRoomDTO);
    }

    public <T> void sendMessage(WebSocketSession session, T message) {
        try {
            session.sendMessage(new TextMessage(objectMapper.writeValueAsString(message)));
        } catch (IOException e) {
//            log.error(e.getMessage(), e);
        }
    }
}