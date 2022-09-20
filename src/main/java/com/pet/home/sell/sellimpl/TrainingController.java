package com.pet.home.sell.sellimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.SellItemService;

@Controller
@RequestMapping("/training/*")
public class TrainingController {

	@Autowired
	private SellItemService itemService;
	
	@GetMapping("list")
	public ModelAndView getItemList() throws Exception {
	  System.out.println("Hotel");
	  String itemKind = "Hotel";
	  List<SellItemDTO> ar	= itemService.getItemList(itemKind);
	  ModelAndView mv = new ModelAndView();
	  mv.addObject("list",ar);
	  return mv;
	}
}
