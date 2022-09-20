package com.pet.home.chat;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

public class ChatRoomDTO {
	private String roomId;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(Set<WebSocketSession> sessions) {
		this.sessions = sessions;
	}

	public void handleActions(WebSocketSession session, ChatMessageDTO chatMessageDTO, ChatService chatService) {
		if(chatMessageDTO.getType().equals(ChatMessageDTO.MessageType.ENTER)) {
			sessions.add(session);
			chatMessageDTO.setMessage(chatMessageDTO.getSender()+"님이 입장했습니다.");
		}
		sendMessage(chatMessageDTO, chatService);
	}
	
	public <T> void sendMessage(T message, final ChatService chatService) {
		for(WebSocketSession session : sessions) {
			chatService.sendMessage(session, message);
		}
	}
	
	
}
