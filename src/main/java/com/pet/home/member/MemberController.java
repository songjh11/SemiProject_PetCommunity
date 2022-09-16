package com.pet.home.member;

import javax.xml.xpath.XPathEvaluationResult.XPathResultType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value= "/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//	@GetMapping("login")
//	public String login(){
//		System.out.println("login get접속");
//		return "member/login";
//	}
//	
//	@PostMapping("login")
//	public void login() {
//		
//		return;
//	}
	@GetMapping("join")
	public String join() throws Exception{
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberDTO memberDTO) {
		
		int result = memberService.setJoin(memberDTO);
		  
		  
		  if(result>0) {
		  System.out.println("회원가입 성공!"); }else { System.out.println("회원가입 실패.."); }
		
		return "redirect:../";
		
	}

}
