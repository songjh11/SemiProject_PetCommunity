package com.pet.home.chat;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {

	@GetMapping("/chat")
	public String chat(Model model) {
		log.info("[Controller] : chat");
		return "chat/chatting";
	}
}
