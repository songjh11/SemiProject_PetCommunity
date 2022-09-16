package com.pet.home.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value= "/member/*")
public class MemberController {
	
	@GetMapping
	public String login(){
		System.out.println("login get");
		
	}

}
