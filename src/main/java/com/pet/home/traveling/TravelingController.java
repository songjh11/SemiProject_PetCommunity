package com.pet.home.traveling;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TravelingController {

	@GetMapping("/traveling/map")
	public String test() throws Exception{
		return "traveling/test";
	}
}
