package com.pet.home.board.event;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.admin.AdminService;
import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.impl.BoardFileDTO;
import com.pet.home.board.notice.NoticeDTO;
import com.pet.home.util.Pager;

@Controller
@RequestMapping("/event/*")
public class EventController {
	
	@Autowired
	private EventService eventService;
	@Autowired
	private AdminService adminService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "event";
	}
	
	
	@PostMapping("fileDelete")
	@ResponseBody
	public int setFileDelete(BoardFileDTO boardFileDTO, HttpSession session) throws Exception{
		int result = eventService.setFileDelete(boardFileDTO, session.getServletContext());
		
		return result;
	}
	
	
	
	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		Pager pager = new Pager(10L, 5L);
		List<BoardDTO> ar = eventService.getList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager",pager);
		mv.setViewName("board/list");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setAdd(ModelAndView mv) throws Exception{
		List<CouponDTO> list = adminService.getCouponList();
		mv.addObject("list", list);
		mv.setViewName("board/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ModelAndView mv,CouponDTO couponDTO, EventDTO eventDTO,MultipartFile [] multipartFiles, HttpSession session) throws Exception{
		int result = eventService.setAdd(eventDTO, multipartFiles, session.getServletContext());
		couponDTO.setNum(eventDTO.getNum());
		int result2 = eventService.setCouponAdd(couponDTO);
		mv.setViewName("redirect:./list");
		
		return mv;
		
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ModelAndView mv, BoardDTO boardDTO) throws Exception{
		EventDTO eventDTO = (EventDTO) eventService.getDetail(boardDTO);
		CouponDTO couponDTO = eventDTO.getCouponDTO();
		System.out.println(couponDTO.getCouponNum());
		couponDTO = eventService.getCouponDetail(couponDTO);
		
		mv.addObject("coupon", couponDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		
		return mv;
		
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		boardDTO= eventService.getDetail(boardDTO);
		
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ModelAndView mv, BoardDTO boardDTO) throws Exception{
	
		
		int result = eventService.setUpdate(boardDTO);

		
	
		mv.setViewName("redirect:./detail?num="+boardDTO.getNum());
		
		return mv;
	}
	
	@GetMapping("delete")
	public String setDelete(BoardDTO boardDTO) throws Exception{
		int result = eventService.setDelete(boardDTO);
		
		return "redirect:./list";
	}
	
	
	
	
}
