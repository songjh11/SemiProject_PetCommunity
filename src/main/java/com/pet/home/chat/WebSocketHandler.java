package com.pet.home.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class WebSocketHandler extends TextWebSocketHandler {
	
	private final ObjectMapper objectMapper;
	private final ChatService chatService;
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		String payload = message.getPayload();
		log.info("payload {}",payload);
		
		ChatMessageDTO chatMessageDTO = objectMapper.readValue(payload, ChatMessageDTO.class);
		ChatRoomDTO chatRoomDTO = chatService.findRoomById(chatMessageDTO.getRoomId());
		chatRoomDTO.handleActions(session, chatMessageDTO, chatService);
		
	}
	
	
	
}
