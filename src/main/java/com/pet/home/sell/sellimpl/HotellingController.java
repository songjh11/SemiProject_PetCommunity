package com.pet.home.sell.sellimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.SellItemService;

@Controller
@RequestMapping("/hotel/*")
public class HotellingController {
	
	@Autowired
	private SellItemService itemService;
	
	@ModelAttribute("category")
	public String getItemCatg() {
		return "Hotel";
	}
	
	@GetMapping("list")
	public ModelAndView getItemList() throws Exception {
	  System.out.println("Hotel");
	  String itemKind = "H";
	  List<SellItemDTO> ar	= itemService.getItemList(itemKind);
	  ModelAndView mv = new ModelAndView();
	  mv.addObject("list",ar);
	  mv.setViewName("sell/sellimpl/list");
	  return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getDetailOne(SellItemDTO sellItemDTO) throws Exception {
		sellItemDTO = itemService.getDetailOne(sellItemDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("sellItemDTO", sellItemDTO);
		mv.setViewName("sell/sellimpl/detail");
		return mv;
	}
	
	@GetMapping("add")
	public String setItemAdd() throws Exception {
		System.out.println("add Get");
		return "sell/sellimpl/add";
	}
		
	@PostMapping("add")
	public ModelAndView setItemAddResult(SellItemDTO itemDTO, MultipartFile [] files, HttpSession session) throws Exception {
		System.out.println("add Post");
		ModelAndView view = new ModelAndView();
		System.out.println(itemDTO.getUserId());
		System.out.println(itemDTO.getItemAddress());
		System.out.println(files.length);
		int result = itemService.setItemAdd(itemDTO, files, session.getServletContext());
		if(result>0) {
			view.setViewName("redirect:/hotel/list");
			
		} else {
			view.setViewName("../");
		}
		return view;
	}
	
	
	
	@GetMapping("update")
	public ModelAndView setItemUpdate(SellItemDTO dto, ModelAndView model) throws Exception {
		dto = itemService.getDetailOne(dto);
		model.addObject("dto", dto);
		model.setViewName("sell/sellimpl/update");
		return model;		
	}
	
	@PostMapping("update")
	public ModelAndView setItemUpdateResult(SellItemDTO dto) throws Exception {
		int result = itemService.setItemUpdate(dto);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/hotel/list");
		return mv;
				}
	
	@GetMapping("delete")
	public ModelAndView setItemDelete(SellItemDTO itemDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = itemService.setItemDelete(itemDTO);
		mv.setViewName("redirect:/hotel/list");
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



