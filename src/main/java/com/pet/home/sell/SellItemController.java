package com.pet.home.sell;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/sell/*")
public class SellItemController {
	//아이템 등록, 수정, 삭제
	
	@Autowired
	private SellItemService itemService;
	
	@GetMapping("list/h")
	public ModelAndView getHotelList() throws Exception {
	  System.out.println("listh");
	  String itemKind = "Hotel";
	  List<SellItemDTO> ar	= itemService.getItemList(itemKind);
	  ModelAndView mv = new ModelAndView();
	  mv.addObject("list",ar);
	  return mv;
	}
	
	@GetMapping("list/o")
	public void getOnedayList(SellItemDTO dto) {
			
	}
	
	@GetMapping("list/t")
	public void getTrainningList() {
		
	}
	
	@GetMapping("list/detail")
	public Model getDetailOne(SellItemDTO dto, Model model) throws Exception {
		dto = itemService.getDetailOne(dto);
		model.addAttribute("dto", dto);
		return model;
	}
	
	
	
	@GetMapping("add")
	public void setItemAdd() throws Exception {
		System.out.println("add Get");
	}
	
	
	@PostMapping("add")
	public ModelAndView setItemAddResult(SellItemDTO itemDTO, MultipartFile [] mf, HttpSession session) throws Exception {
		System.out.println("add Post");
		ModelAndView view = new ModelAndView();
		System.out.println(itemDTO.getUserId());
		System.out.println(itemDTO.getItemAddress());
		System.out.println(mf.length);
		int result = itemService.setItemAdd(itemDTO, mf, session.getServletContext());
		if(result>0) {
			view.setViewName("/sell/list");
			
		} else {
			view.setViewName("../");
		}
		return view;
	}
	
	
	
	@GetMapping("list/update")
	public Model setItemUpdate(SellItemDTO dto, Model model) throws Exception {
		dto = itemService.getDetailOne(dto);
		model.addAttribute("dto", dto);
		return model;		
	}
	
	@PostMapping("list/update")
	public ModelAndView setItemUpdateResult(SellItemDTO dto) throws Exception {
		int result = itemService.setItemUpdate(dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/sell/list/h");
		return mv;
				}
	
	@GetMapping("list/delete")
	public ModelAndView setItemDelete(SellItemDTO itemDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = itemService.setItemDelete(itemDTO);
		mv.setViewName("redirect:/sell/list/h");
		return mv;
	}
	
	
//	@GetMapping("search")
//	public void getItemOne() {
//		String search = "m1";
//	}
//	
//	@PostMapping("search")
//	public void getItemOneResult(String search) {
//		SellItemDTO dto = new SellItemDTO();
//		dto.setUserId(search);
//		dto = itemService.getItemOne(dto);
//		System.out.println(dto.getItemNum());
//	}
}
