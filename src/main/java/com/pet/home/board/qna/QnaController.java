package com.pet.home.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.util.Pager;

@Controller
@RequestMapping(value = "/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "qna";
	}
	
	@RequestMapping("list")
	public ModelAndView getList(Pager pager, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> list = qnaService.getList(pager);
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@RequestMapping("add")
	public String setAdd() throws Exception{
		return "board/add";
	}
	
	@PostMapping("add")
	public void setAdd(ModelAndView mv, BoardDTO boardDTO, HttpSession session, MultipartFile [] multipartFiles) throws Exception{
		int result = qnaService.setAdd(boardDTO, multipartFiles, session.getServletContext());
	}
	
	
	@GetMapping("delete")
	public void setDelete(ModelAndView mv, BoardDTO boardDTO) throws Exception{
		int result = qnaService.setDelete(boardDTO);
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ModelAndView mv, BoardDTO boardDTO) throws Exception{
		boardDTO = qnaService.getDetail(boardDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		return mv;
	}
	
}
