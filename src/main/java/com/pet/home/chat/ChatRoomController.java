package com.pet.home.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/chat/*")
public class ChatRoomController {

	@Autowired
	private ChattingService chattingService;
	
	
	@GetMapping("list")
	public ModelAndView getChatRoomList(String userEmail) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ChatRoomDTO> rooms = chattingService.getChatRoomList(userEmail);
		mv.addObject("rooms", rooms);
		mv.setViewName("/chat/list");
		
		return mv;
	}
	
	
	
	
}
