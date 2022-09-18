package com.pet.home.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.xpath.XPathEvaluationResult.XPathResultType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping("login")
	public String login() throws Exception {
		System.out.println("로그인 접속 (GET)");

		return "member/login";
	}

	@PostMapping("login")
	public String login(HttpServletRequest request, MemberDTO memberDTO) throws Exception {
		
		System.out.println("DB로그인 접속 (POST)");
		
		memberDTO = memberService.getLogin(memberDTO);

		// request에 있는 파라미터를 session에 넣음
		HttpSession session = request.getSession();
		// DB에서 가져온 DTO데이터를 JSP로 속성만들어서 보내기
		session.setAttribute("member", memberDTO);
		
if (memberDTO!=null) {
			System.out.println("오 ~ 로그인 성공");
}else {System.out.println("오 ~ 로그인 실패");}
		
		return "redirect:../";
	}
	
	@GetMapping("join")
	public String join() throws Exception{
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberDTO memberDTO) throws Exception{
		
		System.out.println("join post 실행");
		

		int result = memberService.setJoin(memberDTO);
		System.out.println("유저아이디"+memberDTO.getUserId());
		System.out.println(memberDTO.getPhone());
		System.out.println(memberDTO.getUserName());
		  
		  
		  if(result>0) {
		  System.out.println("회원가입 성공!"); }else { System.out.println("회원가입 실패.."); }
		
		return "redirect:../";
		
	}

}
