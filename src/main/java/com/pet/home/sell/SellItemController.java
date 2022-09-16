package com.pet.home.sell;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/sell/*")
public class SellItemController {
	//아이템 등록, 수정, 삭제
	
	private SellItemService itemService;
	
	@GetMapping("add")
	public void setItemAdd() {
		System.out.println("add Get");
	}
	
	
	@PostMapping("add")
	public ModelAndView setItemAddResult(SellItemDTO itemDTO) {
		System.out.println("add Post");
		ModelAndView view = new ModelAndView();
		System.out.println(itemDTO.getItemEndDate());
		int result = itemService.setItemAdd(itemDTO);
		view.setViewName("redirect: ../");
		return view;
	}
}
