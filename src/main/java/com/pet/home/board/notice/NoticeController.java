package com.pet.home.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.board.impl.BoardDTO;
import com.pet.home.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv, Pager pager) throws Exception {
		List<BoardDTO> ar = noticeService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager",pager);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public String setAdd() throws Exception{
		
		return "board/add";
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ModelAndView mv, NoticeDTO noticeDTO) throws Exception{
		int result = noticeService.setAdd(noticeDTO);
		
		mv.setViewName("redirect:./list");
		
		return mv;
		
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ModelAndView mv, BoardDTO boardDTO) throws Exception{
		boardDTO = noticeService.getDetail(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		
		return mv;
		
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		boardDTO= noticeService.getDetail(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ModelAndView mv, BoardDTO boardDTO) throws Exception{
	
		
		int result = noticeService.setUpdate(boardDTO);

		
	
		mv.setViewName("redirect:./detail?num="+boardDTO.getNum());
		
		return mv;
	}
	
	@GetMapping("delete")
	public String setDelete(BoardDTO boardDTO) throws Exception{
		int result = noticeService.setDelete(boardDTO);
		
		return "redirect:./list";
	}
	
	
}
