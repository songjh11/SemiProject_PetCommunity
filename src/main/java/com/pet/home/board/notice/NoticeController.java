package com.pet.home.board.notice;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.impl.BoardFileDTO;
import com.pet.home.member.MemberDTO;
import com.pet.home.util.Pager;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeDAO noticeDAO;

	@ModelAttribute("board")
	public String getBoard() {
		return "notice";
	}

	@PostMapping("fileDelete")
	@ResponseBody
	public int setFileDelete(BoardFileDTO boardFileDTO, HttpSession session) throws Exception {
		int result = noticeService.setFileDelete(boardFileDTO, session.getServletContext());

		return result;
	}

	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv) throws Exception {
		Pager pager = new Pager(10L, 5L);
		List<BoardDTO> ar = noticeService.getList(pager);
		System.out.println(ar.size());
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/list");

		return mv;
	}

	@GetMapping("add")
	public String setAdd() throws Exception {

		return "board/add";
	}

	@PostMapping("add")
	public ModelAndView setAdd(ModelAndView mv, NoticeDTO noticeDTO, MultipartFile[] multipartFiles,
			HttpSession session) throws Exception {
		int result = noticeService.setAdd(noticeDTO, multipartFiles, session.getServletContext());

		mv.setViewName("redirect:./list");

		return mv;

	}

	@GetMapping("detail")
	public ModelAndView getDetail(ModelAndView mv, BoardDTO boardDTO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		noticeDAO.setUpdateHit(boardDTO);
		boardDTO = noticeService.getDetail(boardDTO);
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cookie"+boardDTO.getNum())) {
					System.out.println("처음 쿠키 생성 한 후 접속");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(boardDTO != null) {
			mv.addObject("dto", boardDTO);
			
			if(viewCookie == null) {
				System.out.println("쿠키가 없음");
				
				Cookie newCookie = new Cookie("cookie"+boardDTO.getNum(),""+boardDTO.getNum());
				
				response.addCookie(newCookie);
				
				int result = noticeService.setUpdateHit(boardDTO);
				
				if(result > 0) {
					System.out.println("조회수 증가");
				}else {
					System.out.println("조회수 증가 에러");
				}
				
			}else {
				System.out.println("쿠키 있음");
				
				String value = viewCookie.getValue();
				
				System.out.println("쿠키 값 : " + value);
			}
			mv.setViewName("board/detail");
		}
		
		
		

		mv.setViewName("board/detail");

		return mv;

	}

	@GetMapping("update")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		boardDTO = noticeService.getDetail(boardDTO);

		mv.addObject("dto", boardDTO);
		mv.setViewName("board/update");

		return mv;
	}

	@PostMapping("update")
	public ModelAndView setUpdate(ModelAndView mv, BoardDTO boardDTO) throws Exception {

		int result = noticeService.setUpdate(boardDTO);

		mv.setViewName("redirect:./detail?num=" + boardDTO.getNum());

		return mv;
	}

	@GetMapping("delete")
	public String setDelete(BoardDTO boardDTO) throws Exception {
		int result = noticeService.setDelete(boardDTO);

		return "redirect:./list";
	}

}
