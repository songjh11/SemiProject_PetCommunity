package com.pet.home.sell.sellimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.SellItemService;

@Controller
@RequestMapping("/oneday/*")
public class OneDayController {

	@Autowired
	private SellItemService itemService;
	
	@ModelAttribute("category")
	public String getItemCatg() {
		return "One Day Class";
	}
	
	@GetMapping("list")
	public ModelAndView getItemList() throws Exception {
	  System.out.println("OneDay");
	  String itemKind = "O";
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
		mv.addObject("dto", sellItemDTO);
		mv.setViewName("sell/sellimpl/detail");
		return mv;
	}
}
