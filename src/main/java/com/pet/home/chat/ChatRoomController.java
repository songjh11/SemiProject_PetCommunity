package com.pet.home.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chat")
public class ChatRoomController {

	@Autowired
	private ChatRoomDAO chatRoomDAO;
	
	@GetMapping("/room")
	public ModelAndView rooms(ModelAndView mv) {
		List<ChatRoomDTO> rooms = chatRoomDAO.findAllRoom();
		mv.addObject("rooms", rooms);
		mv.setViewName("/chat/room");
		return mv;
	}
	
	@PostMapping("/room")
	@ResponseBody
	public void createRoom(ChatRoomDTO chatRoomDTO) {
		int result = chatRoomDAO.createChatRoom(chatRoomDTO);
		
	}
	
	@GetMapping("/room/enter")
	public String roomDetail(Model model, ChatRoomDTO chatRoomDTO) {
		chatRoomDTO = chatRoomDAO.findRoomById(chatRoomDTO);
		model.addAttribute("dto",chatRoomDTO);
		return "/chat/detail";
	}
	
}
