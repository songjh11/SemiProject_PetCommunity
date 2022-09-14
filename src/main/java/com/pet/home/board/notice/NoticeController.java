package com.pet.home.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.board.impl.BoardDTO;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		List<BoardDTO> ar = noticeService.getList();
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		
		return mv;
	}
	
}
