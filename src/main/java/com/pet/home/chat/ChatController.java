package com.pet.home.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.core.MessageSendingOperations;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.messaging.simp.SimpMessageSendingOperations;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private SimpMessageSendingOperations messagingTemplate;
	
	@MessageMapping("/chat/message")
	public void message(ChatMessageDTO chatMessageDTO) {
		if(ChatMessageDTO.MessageType.JOIN.equals(chatMessageDTO.getMessage())) {
			chatMessageDTO.setMessage(chatMessageDTO.getSender()+"님이 입장하셨습니다");
			messagingTemplate.convertAndSend("/sub/chat/room"+chatMessageDTO.getRoomId(), chatMessageDTO);
		}
	}
}
