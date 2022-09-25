package com.pet.home.chat.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/chatRoom/*")
public class ChatRoomController {
	
	@Autowired
	private ChatRoomService chatRoomService;
	
	@GetMapping("list")
	public ModelAndView getList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ChatRoomDTO> list = chatRoomService.getList();
		mv.addObject("list", list);
		mv.setViewName("chat/list");
		return mv;
	}
	
	@GetMapping("add")
	public String setAdd() throws Exception{
		return "chat/add";
	}
	
}
