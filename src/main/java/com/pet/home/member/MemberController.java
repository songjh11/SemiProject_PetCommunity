package com.pet.home.member;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.xpath.XPathEvaluationResult.XPathResultType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.annotation.JsonView;
import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.file.FileDTO;
import com.pet.home.sell.PickDTO;
import com.pet.home.sell.ReservationDTO;
import com.pet.home.sell.SellItemController;
import com.pet.home.sell.SellItemService;
import com.pet.home.sell.ShopCartDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.purchase.PurchaseDTO;
import com.pet.home.util.FileManager;
import com.pet.home.util.SellPager;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;

 
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
		
		System.out.println("파람2:"+request.getParameter("roleNum"));
		
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
//		memberDTO = (MemberDTO)session.getAttribute("member");
		mv.addObject("dto", memberDTO);
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
	
//		memberDTO = memberService.getMyPage(memberDTO);
		int followernum = Integer.parseInt(String.valueOf(memberService.getFollowerCount(memberDTO)));
		int followeenum = Integer.parseInt(String.valueOf(memberService.getFolloweeCount(memberDTO)));
		int memnum = Integer.parseInt(String.valueOf(memberService.getMemCount()));
		int sellnum = Integer.parseInt(String.valueOf(memberService.getItemCount()));


		
		
		if(memberDTO.getRoleDTO().getRoleNum()==1){ 
		memberDTO = memberService.getBizPage(memberDTO); //역할번호가 1번일 때 판매자 마이페이지 
		}else if(memberDTO.getRoleDTO().getRoleNum()==2){
		memberDTO = memberService.getGuestPage(memberDTO); //역할번호가 2번일 때 회원 마이페이지 
		
		System.out.println("마이페이지포스트 "+ memberDTO.getPetCatg());
		}else {
		memberDTO = memberService.getMyPage(memberDTO); // 그 외 관리자 마이페이지  
		}
		
		mv.addObject("memnum", memnum);
		mv.addObject("sellnum", sellnum);
		mv.addObject("followeenum", followeenum);
		mv.addObject("followernum", followernum);
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	@GetMapping("memlist")
	public ModelAndView memlist()throws Exception{
		ModelAndView mv = new ModelAndView();
	List<MemberDTO> ar = memberService.getMemList();
	
	mv.addObject("list", ar);
	mv.addObject("what", "memlist");
	mv.setViewName("member/follow");
	 
	return mv;
	
	}
	
	
	@GetMapping("find")
	public ModelAndView search(MemberDTO memberDTO)throws Exception {
		ModelAndView mv = new ModelAndView();
		List<MemberDTO> ar = memberService.getFindMem(memberDTO);
		
		mv.addObject("list", ar);
		mv.addObject("what", "memlist");
		mv.setViewName("member/follow");
		
		return mv;
	}
	
	@GetMapping("block")
	public ModelAndView setBlock(MemberDTO memberDTO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = memberService.setBlock(memberDTO);
		
		if(result == 1){
			mv.addObject("msg", "회원이 차단되었습니다.");
		}else {
			mv.addObject("msg", "차단 실패했습니다.");
		}
			mv.addObject("url", "memlist");
			mv.setViewName("member/alert");
			
			return mv;
	}
	
	@GetMapping("unblock")
	public ModelAndView setUnBlock(MemberDTO memberDTO)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = memberService.setUnBlock(memberDTO);
		
		if(result == 1){
			mv.addObject("msg", "회원이 차단 해제되었습니다.");
		}else {
			mv.addObject("msg", "차단 해제 실패했습니다.");
		}
			mv.addObject("url", "memlist");
			mv.setViewName("member/alert");
			
			return mv;
	}
	
	
	
	@GetMapping("delete")
	public String delete()throws Exception{
		
		return"member/delete";
		
	}
	
	@PostMapping("delete")
	public String delete(HttpServletRequest request)throws Exception{
		
		System.out.println("delete post");

		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
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
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");

//		memberDTO = memberService.getMyPage(memberDTO);
		
		if(memberDTO.getRoleDTO().getRoleNum()==1){ 
		memberDTO = memberService.getBizPage(memberDTO); //역할번호가 1번일 때 판매자 마이페이지 
		}else if(memberDTO.getRoleDTO().getRoleNum()==2){
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

		//공통 member테이블 먼저 업데이트 
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

	@PostMapping("followee")
	public ModelAndView setFolloweeDelete(MemberDTO memberDTO,String followee, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
	
		memberDTO = (MemberDTO)session.getAttribute("member");

		System.out.println(followee);
		memberDTO.setFollowee(followee);
		int result = memberService.setFolloweeDelete(memberDTO);
		
		if (result==1) {
		mv.addObject("msg","followee가 삭제되었습니다.");
		mv.addObject("url","/member/followee");
		mv.setViewName("member/alert");}
		else {
			mv.addObject("msg","followee 삭제에 실패했습니다.");
			mv.addObject("url","/member/followee");
			mv.setViewName("member/alert");
			
		}
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
		
	@PostMapping("follower")
	public ModelAndView setFollowerDelete(MemberDTO memberDTO,String follower, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();

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
	
		@GetMapping("cart")
		public ModelAndView getShopCartList(MemberDTO memberDTO, HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			memberDTO = (MemberDTO)session.getAttribute("member");
			memberDTO = memberService.getShopCartList(memberDTO);
			
			mv.addObject("list", memberDTO);
			mv.addObject("what","cart");
			mv.setViewName("member/follow");
			return mv;
		}
		
		@PostMapping("cart")
		public ModelAndView setCartDelete(ShopCartDTO shopCartDTO, HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
	
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			shopCartDTO.setUserId(memberDTO.getUserId());
			int result = memberService.setCartDelete(shopCartDTO);
			
			if (result==1) {
				mv.addObject("msg","장바구니가 삭제되었습니다.");
				mv.addObject("url","/member/cart");
				mv.setViewName("member/alert");}
				else {
					mv.addObject("msg","장바구니 삭제 실패했습니다.");
					mv.addObject("url","/member/cart");
					mv.setViewName("member/alert");
				}
			
			return mv;
		}
		
		@GetMapping("pick")
		public ModelAndView getPickList(MemberDTO memberDTO, HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			memberDTO = (MemberDTO)session.getAttribute("member");
			memberDTO =  memberService.getPickList(memberDTO);

	
			mv.addObject("list", memberDTO);
			mv.addObject("what","pick");
			mv.setViewName("member/follow");
			return mv;
		}
		
		@PostMapping("pick")
		public ModelAndView setPickDelete(PickDTO pickDTO, HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			pickDTO.setUserId(memberDTO.getUserId());
			int result = memberService.setPickDelete(pickDTO);
			
			if (result==1) {
				mv.addObject("msg","찜이 삭제되었습니다.");
				mv.addObject("url","/member/pick");
				mv.setViewName("member/alert");}
				else {
					mv.addObject("msg","찜 삭제 실패했습니다.");
					mv.addObject("url","/member/pick");
					mv.setViewName("member/alert");
				}
			
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

		@GetMapping("rev")
		public ModelAndView getRevList(MemberDTO memberDTO,HttpSession session)throws Exception{
			ModelAndView mv = new ModelAndView();
			memberDTO = (MemberDTO)session.getAttribute("member");
			
			List<ReservationDTO> ar = memberService.getRevList(memberDTO);

			mv.addObject("list", ar);
			mv.addObject("what","rev");
			mv.setViewName("member/follow");
			return mv;
		}
		
		@GetMapping("findlogin")
		public String getFindLogin()throws Exception{

			return "member/findlogin";
		}
		
		@PostMapping("findlogin")
		public ModelAndView getFindLogin(MemberDTO memberDTO,HttpServletRequest request)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			String email = request.getParameter("email");
			String userId = request.getParameter("userId");
			
			memberDTO = memberService.getFindLogin(memberDTO);
			String pw = memberDTO.getPassword();

			if(memberDTO==null || !memberDTO.getEmail().equals(email)) {
				mv.addObject("msg","일치하는 회원이 없습니다.");
				mv.addObject("url","/member/findlogin");
				mv.setViewName("member/alert");
			}else {
				
				Random random = new Random();
				pw =  Integer.toString(random.nextInt(888888));
	
			System.out.println(pw);
			memberDTO.setPassword(pw);
			memberService.setUpdatePw(memberDTO);
			memberService.setEmail(memberDTO, "pwEmail");
			
			mv.addObject("msg","회원 메일로 임시 비밀번호를 전송하였습니다.");
			mv.addObject("url","/member/login");
			mv.setViewName("member/alert");
			
			}
			
			return mv;
		}
		
@GetMapping("test")
public ModelAndView getPickList(MemberDTO memberDTO) throws Exception{
	memberDTO = memberService.getPickList(memberDTO);
	memberDTO = memberService.getShopCartList(memberDTO);
	MemberDTO ar3 = memberService.getTotalPrice(memberDTO);
	ModelAndView mv = new ModelAndView();
	mv.addObject("list", memberDTO);
	mv.addObject("list2", memberDTO);
	mv.addObject("list3", ar3);
	mv.setViewName("member/test");

	return mv;
}


	
	
//결제 내역 리스트	
	@GetMapping("purchaseList")
	public ModelAndView getPurchaseList(HttpSession httpSession, String purchaseStatus) throws Exception {
		System.out.println("purchaseList");
		MemberDTO memberDTO = (MemberDTO)httpSession.getAttribute("member");
		System.out.println(memberDTO.getUserId());
		PurchaseDTO purchaseDTO = new PurchaseDTO();
		purchaseDTO.setUserId(memberDTO.getUserId());
		purchaseDTO.setPurchaseStatus(Long.parseLong(purchaseStatus));
		List<PurchaseDTO> purchaseList = sellItemService.getPurchaseList(purchaseDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("purchaseList", purchaseList);
		mv.addObject("what","Purchase List");
		mv.setViewName("member/follow");
		for(PurchaseDTO c: purchaseList) {
			System.out.println(c.getImp_uid());
		}
		return mv;
	}
	
//결제 상세 내역
	@GetMapping("purchaseDetail")
	public ModelAndView getPurchaseDetail(PurchaseDTO purchaseDTO) throws Exception {
		purchaseDTO = sellItemService.getPurchaseDetail(purchaseDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("check", purchaseDTO);
		return mv;
	}
	
//결제 취소
	@PostMapping("purchaseDelete")
	@ResponseBody
	public ModelAndView setPurchaseDelete(
			@RequestParam String imp_uid, 
			@RequestParam String merchant_uid,
			@RequestParam String reason
			) throws Exception {
		System.out.println("purchaseDelete");
		System.out.println(merchant_uid);
		String msg = "";
		ModelAndView mv = new ModelAndView("jsonView");
		PurchaseDTO purchaseDTO = new PurchaseDTO();
		purchaseDTO.setMerchant_uid(merchant_uid); 
		purchaseDTO = sellItemService.getPurchaseDetail(purchaseDTO);
		Long amount = purchaseDTO.getAmount(); 
		Long cancel_amount = amount;
		System.out.println("amount: "+amount+"cancel_amount: "+cancel_amount);
		int result = sellItemService.setPurchaseStatus(merchant_uid);
		if(result>0) {
			System.out.println("상태 변경 완");
			msg = "resultSuccess";
//			IamportResponse<AccessToken> token = sellItemService.getToken();
//			mv.addObject("token", token.getResponse().getToken());
			mv.addObject("reason", reason);
		} else {
			msg = "error";
			System.out.println("실패ㅠ");
		}
		
//		String kind=aboutPayEnums.valueOf(merchant_uid.substring(0, 0)).getString();
//		int result = sellItemService.setPurchaseDelete(checkDTO);
//		String url = "./mypage";
		mv.addObject("msg", msg);
		mv.addObject("imp_uid", imp_uid);
		mv.addObject("merchant_uid", merchant_uid);
		mv.addObject("amount", amount);
		mv.addObject("checksum", cancel_amount);

//		mv.addObject("url", url);
		return mv;
	}
}
	
