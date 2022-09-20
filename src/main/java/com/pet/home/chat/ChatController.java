package com.pet.home.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.core.MessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	private Simplemessage
	
	@PostMapping
	@ResponseBody
	public ChatRoomDTO createRoom(@RequestParam String name) {
		return chatService.createRoom(name);
	}
	
	@GetMapping
	public List<ChatRoomDTO> findAllRoom(){
		return chatService.findAllRoom();
	}
}
