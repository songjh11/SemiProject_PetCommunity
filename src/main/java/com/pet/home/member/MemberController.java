package com.pet.home.member;

import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.xpath.XPathEvaluationResult.XPathResultType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.sell.SellItemController;
import com.pet.home.sell.SellItemService;
import com.pet.home.sell.check.CheckDTO;
import com.pet.home.util.FileManager;
 
@Controller
@RequestMapping(value= "/member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired 
	private SellItemService sellItemService;
	
	@GetMapping("role")
	public String getAgree()throws Exception{
		
		return "member/role";
	} 
	
	@GetMapping("login")
	public String login() throws Exception {
		System.out.println("로그인 접속 (GET)");

		return "member/login";
	}

	@PostMapping("login")
	public ModelAndView login(HttpServletRequest request, MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("DB로그인 접속 (POST)");
		
		memberDTO = memberService.getLogin(memberDTO);
		
		

		// request에 있는 파라미터를 session에 넣음
		HttpSession session = request.getSession();
		// DB에서 가져온 DTO데이터를 JSP로 속성만들어서 보내기
		session.setAttribute("member", memberDTO);
		
		if (memberDTO!=null) {
			System.out.println("오 ~ 로그인 성공");
		}else {System.out.println("오 ~ 로그인 실패");
		mv.addObject("msg", "아이디/비밀번호가 틀렸습니다.");
		mv.addObject("url", "login");
		mv.setViewName("member/alert");
		return mv;
		}

		//dto에 roleNum을 담아 main.jsp에서 메뉴 다르게 보이도록  


		//member 세션의 userId
		//getAdmPage 메소드 재활용하여 roleNum 가져오기
		memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = memberService.getMyPage(memberDTO);
		mv.addObject("dto", memberDTO);
		session.setAttribute("dto", memberDTO);
		mv.setViewName("redirect:../");
		
		return mv;
	}

	
	@GetMapping("logout")
	public String logout (HttpSession session) throws Exception{
		
		session.invalidate(); //세션 비우기 
		
		return "redirect:../"; 
	}
	
	
	@GetMapping("join")
	public String join(HttpServletRequest request) throws Exception{
	
		return "member/join";
	}
	
	@PostMapping("join")
	public String join(MemberDTO memberDTO, MultipartFile photo, HttpSession session) throws Exception{
		
		Calendar ca = Calendar.getInstance();
		
		System.out.println("join post 실행");
		
		//선택 약관동의값 세팅 
		// 체크되지 않으면 0 , 선택되면 1로 설정 
		if(memberDTO.getAgMes()==null) {
			memberDTO.setAgMes(0);
		}else {memberDTO.setAgMes(1);
		}

		//공통 member테이블 먼저 생성 
		int result = memberService.setJoin(memberDTO, photo, session.getServletContext());
		
		
		//사업자 회원일 때 
		if(memberDTO.getRoleNum()==1){ 
			memberDTO.setBizNum(ca.getTimeInMillis()); //사업자번호 밀리세컨즈로 설정 
		    memberService.setBiz(memberDTO); //bizmem 테이블 생성 
		}else {
			//게스트 회원일 때 
			memberDTO.setGuestId(ca.getTimeInMillis()); //guestId 밀리세즈로 설정 
			memberService.setGuest(memberDTO); //guest 테이블 생성 
		}

		  
		  
		  if(result>0) {
		  System.out.println("회원가입 성공!"); }else { System.out.println("회원가입 실패"); }

		
		return "redirect:../";
		
	}
	

	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session)throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	
		memberDTO = memberService.getMyPage(memberDTO);
		int followernum = Integer.parseInt(String.valueOf(memberService.getFollowerCount(memberDTO)));
		int followeenum = Integer.parseInt(String.valueOf(memberService.getFolloweeCount(memberDTO)));
		if(memberDTO.getRoleNum()==1){ 
		memberDTO = memberService.getBizPage(memberDTO); //역할번호가 1번일 때 판매자 마이페이지 
		}else if(memberDTO.getRoleNum()==2){
		memberDTO = memberService.getGuestPage(memberDTO); //역할번호가 2번일 때 회원 마이페이지 
		
		System.out.println("마이페이지포스트 "+ memberDTO.getPetCatg());
		}else {
		memberDTO = memberService.getMyPage(memberDTO); // 그 외 관리자 마이페이지  
		}
		mv.addObject("followeenum", followeenum);
		mv.addObject("followernum", followernum);
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	
	@GetMapping("search")
	public String search()throws Exception {
		
		return "member/search";
	}
	
	@PostMapping("search")
	public ModelAndView search(MemberDTO memberDTO)throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@GetMapping("delete")
	public String delete()throws Exception{
		
		return"member/delete";
		
	}
	
	@PostMapping("delete")
	public String delete(HttpServletRequest request )throws Exception{
		
		System.out.println("delete post");

		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("dto");
		String pw = request.getParameter("pw");
		
		System.out.println(memberDTO.getUserId());
		System.out.println(memberDTO.getPassword());
		System.out.println(pw);
		
		if(memberDTO.getPassword().equals(pw)){
			
			memberService.setMemDelete(memberDTO);
			
			request.setAttribute("msg", "회원 탈퇴가 완료되었습니다.");
			request.setAttribute("url", "/");
			
			request.getSession().invalidate(); //세션 비우기 
			
			return "member/alert";
		
			
		}else {
			
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", "/member/delete");
			return "member/alert";
		}
		
	}
	
	@GetMapping("update")
	public ModelAndView update(HttpSession session)throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("dto");
		
		memberDTO = memberService.getMyPage(memberDTO);
		
		if(memberDTO.getRoleNum()==1){ 
		memberDTO = memberService.getBizPage(memberDTO); //역할번호가 1번일 때 판매자 마이페이지 
		}else if(memberDTO.getRoleNum()==2){
		memberDTO = memberService.getGuestPage(memberDTO); //역할번호가 2번일 때 회원 마이페이지 
		}else {
		memberDTO = memberService.getMyPage(memberDTO); // 그 외 관리자 마이페이지  
		}
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/update");
		
		return mv;
	}
	
	@PostMapping("update")
	public String update(MemberDTO memberDTO, MultipartFile photo, HttpSession session) throws Exception{
		
		if(memberDTO.getAgMes()==null) {
			memberDTO.setAgMes(0);
		}else {memberDTO.setAgMes(1);
		}

		//공통 member테이블 먼저 업데이
		memberService.setMemUpdate(memberDTO);
		
		
		if(memberDTO.getPetCatg() != null){ 

			//게스트 회원일 때 
			memberService.setGuestUpdate(memberDTO); //guest 테이블 생성 

			if(!photo.isEmpty()) {
				
			String path = session.getServletContext().getRealPath("resources/upload/member");
			String fileName = fileManager.saveFile(session.getServletContext(), path, photo);
			MemberFileDTO memberFileDTO = new MemberFileDTO();
			memberFileDTO.setFileName(fileName);
			memberFileDTO.setOriName(photo.getOriginalFilename());
			memberFileDTO.setUserId(memberDTO.getUserId());
			memberService.setFileUpdate(memberFileDTO, photo, session.getServletContext());
				
		}
		}
		 
		
		return "redirect:../";
		
	}

	@GetMapping("followee")
	public ModelAndView getFolloweeList(MemberDTO memberDTO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = (MemberDTO)session.getAttribute("member");
		
		List<MemberDTO> ar = memberService.getFolloweeList(memberDTO);
		
		mv.addObject("list", ar);
		mv.addObject("what","followee");
		mv.setViewName("member/follow");
		return mv;
	}
	
	@GetMapping("follower")
	public ModelAndView getFollowerList(MemberDTO memberDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberDTO> ar = memberService.getFollowerList(memberDTO);
		
		mv.addObject("list", ar);
		mv.addObject("what","follower");
		mv.setViewName("member/follow");
		return mv;
	}
	
	@GetMapping("cart")
	public ModelAndView getShopCartList(MemberDTO memberDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberDTO> ar = memberService.getShopCartList(memberDTO);
		
		mv.addObject("list", ar);
		mv.addObject("what","cart");
		mv.setViewName("member/follow");
		return mv;
	}
	
	@GetMapping("pick")
	public ModelAndView getPickList(MemberDTO memberDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberDTO> ar = memberService.getPickList(memberDTO);
		
		mv.addObject("list", ar);
		mv.addObject("what","pick");
		mv.setViewName("member/follow");
		return mv;
	}
	
	@GetMapping("coupon")
	public ModelAndView getCouponList(MemberDTO memberDTO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = (MemberDTO)session.getAttribute("member");
		List<CouponDTO> ar = memberService.getCouponList(memberDTO);

		mv.addObject("list", ar);
		mv.addObject("what","coupon");
		mv.setViewName("member/follow");
		return mv;
	}
	
	@PostMapping("follower")
	public ModelAndView setFollowerDelete(MemberDTO memberDTO,String follower, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("delete post");
		memberDTO = (MemberDTO)session.getAttribute("member");

		System.out.println(follower);
		memberDTO.setFollower(follower);
		int result = memberService.setFollowerDelete(memberDTO);
		
		if (result==1) {
		mv.addObject("msg","follower가 삭제되었습니다.");
		mv.addObject("url","/member/follower");
		mv.setViewName("member/alert");}
		else {
			mv.addObject("msg","follower가 삭제 실패했습니다.");
			mv.addObject("url","/member/follower");
			mv.setViewName("member/alert");
			
		}
		return mv;
	}
	
@GetMapping("test")
public ModelAndView getPickList(MemberDTO memberDTO) throws Exception{
	List<MemberDTO> ar = memberService.getPickList(memberDTO);
	List<MemberDTO> ar2 = memberService.getShopCartList(memberDTO);
	MemberDTO ar3 = memberService.getTotalPrice(memberDTO);
	ModelAndView mv = new ModelAndView();
	mv.addObject("list", ar);
	mv.addObject("list2", ar2);
	mv.addObject("list3", ar3);
	mv.setViewName("member/test");

	return mv;
}


	
	
//결제 내역 리스트	
	@GetMapping("purchaseList")
	public ModelAndView getPurchaseList(HttpSession httpSession) throws Exception {
		System.out.println("purchaseList");
		MemberDTO memberDTO = (MemberDTO)httpSession.getAttribute("dto");
		System.out.println(memberDTO.getUserId());
		System.out.println(memberDTO.getEmail());
		List<CheckDTO> checkList = sellItemService.getPurchaseList(memberDTO.getUserId());
		ModelAndView mv = new ModelAndView();
		mv.addObject("checkList", checkList);
		for(CheckDTO c: checkList) {
			System.out.println(c.getImp_uid());
		}
		return mv;
	}
	
//결제 상세 내역
	@GetMapping("purchaseDetail")
	public ModelAndView getPurchaseDetail(CheckDTO checkDTO) throws Exception {
		checkDTO = sellItemService.getPurchaseDetail(checkDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("check", checkDTO);
		return mv;
	}
	
//결제 취소
	@PostMapping("purchaseDelete")
	public ModelAndView setPurchaseDelete(CheckDTO checkDTO) throws Exception {
		System.out.println(checkDTO.getImp_uid());
		int result = sellItemService.setPurchaseDelete(checkDTO);
		System.out.println("삭제 완");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/mypage");
		return mv;
	}
}
	
