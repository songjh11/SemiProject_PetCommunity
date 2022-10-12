package com.pet.home.board.sharing;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.pet.home.member.FollowDTO;
import com.pet.home.member.MemberDTO;
import com.pet.home.member.MemberService;
import com.pet.home.util.BoardCommentPager;
import com.pet.home.util.Pager;

@Controller
@RequestMapping("/sharing/*")
public class SharingController {
	
	@Autowired
	private SharingService sharingService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SharingDAO sharingDAO;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "sharing";
	}
	
	
	// 댓글 처리
	@PostMapping("commentAdd")
	@ResponseBody
	public int setCommentAdd(ShCommentDTO shCommentDTO) throws Exception{
		int result = sharingService.setCommentAdd(shCommentDTO);
		return result;
	}
	
	@GetMapping("commentList")
	@ResponseBody
	public Map<String, Object> getCommentList(BoardCommentPager boardCommentPager) throws Exception{
		List<ShCommentDTO> ar = sharingService.getCommentList(boardCommentPager);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ar);
		map.put("pager", boardCommentPager);
		return map;
	}
	
	@PostMapping("commentDelete")
	@ResponseBody
	public int setCommentDelete(ShCommentDTO shCommentDTO) throws Exception{
		int result = sharingService.setCommentDelete(shCommentDTO);
		
		return result;
	}
	
	@PostMapping("commentUpdate")
	@ResponseBody
	public int setCommentUpdate(ShCommentDTO shCommentDTO) throws Exception{
		int result = sharingService.setCommentUpdate(shCommentDTO);
		
		return result;
	}
	
	
	
	@GetMapping("list")
	public ModelAndView getList(ModelAndView mv) throws Exception{
		Pager pager = new Pager(10L, 5L);
		List<BoardDTO> ar = sharingService.getList(pager);
		

		for(int i=0; i<ar.size(); i++) {
			BoardCommentPager boardCommentPager = new BoardCommentPager();
			boardCommentPager.setNum(ar.get(i).getNum());
			System.out.println(ar.get(i).getNum());
			Long count = sharingDAO.getCommentListTotalCount(boardCommentPager);
			System.out.println(count);
			ar.get(i).setCount(count);
		}
		

		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/list2");
		
		return mv;
	}
	
	@GetMapping("add")
	public String setAdd() throws Exception{
		return "board/add";
	}
	
	@PostMapping("add")
	public ModelAndView setAdd(ModelAndView mv, SharingDTO sharingDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception{
		int result = sharingService.setAdd(sharingDTO, multipartFiles, session.getServletContext());
		mv.setViewName("redirect:./list");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(ModelAndView mv, BoardDTO boardDTO) throws Exception{
		boardDTO = sharingService.getDetail(boardDTO);
		
		String userId = boardDTO.getWriter();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId(userId);
		memberDTO = memberService.getGuestPage(memberDTO);
		
		mv.addObject("member", memberDTO);
		mv.addObject("dto", boardDTO);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		boardDTO = sharingService.getDetail(boardDTO);
		
		mv.addObject("dto",boardDTO);
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ModelAndView mv, BoardDTO boardDTO) throws Exception{
		int result = sharingService.setUpdate(boardDTO);
		
		mv.setViewName("redirect:./detail?num="+boardDTO.getNum());
		
		return mv;
	}
	
	@GetMapping("delete")
	public String setDelete(BoardDTO boardDTO) throws Exception{
		int result = sharingService.setDelete(boardDTO);
		
		return "redirect:./list";
	}
	
	
	//팔로워 추가
	@PostMapping("addfollow")
	@ResponseBody
	public int setFollow(FollowDTO followDTO) throws Exception{
		int result = memberService.setFollow(followDTO);
		return result;
	}
	
	
}
