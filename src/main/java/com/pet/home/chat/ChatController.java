package com.pet.home.chat;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/chat")
public class ChatController {
	private final ChatService chatService;
	
	@PostMapping
	public ChatRoomDTO createRoom(@RequestParam String name) {
		return chatService.createRoom(name);
	}
	
	@GetMapping
	public List<ChatRoomDTO> findAllRoom(){
		return chatService.findAllRoom();
	}
}
