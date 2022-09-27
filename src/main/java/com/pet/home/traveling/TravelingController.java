package com.pet.home.traveling;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.SellItemService;
import com.pet.home.util.SellPager;

@Controller
public class TravelingController {

	@Autowired
	private SellItemService sellItemService;
	
	@GetMapping("/traveling/map")
	public ModelAndView test(ModelAndView mv) throws Exception{
		List<SellItemDTO> list = sellItemService.getAllItemList();
		mv.addObject("list", list);
		mv.setViewName("traveling/test");
		return mv;
	}
}
