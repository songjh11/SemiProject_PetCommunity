package com.pet.home.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.qna.QnaDAO;
import com.pet.home.board.qna.QnaDTO;
import com.pet.home.board.sharing.SharingDAO;
import com.pet.home.board.sharing.SharingDTO;
import com.pet.home.member.MemberDAO;
import com.pet.home.member.MemberDTO;
import com.pet.home.util.CommentPager;
import com.pet.home.util.Pager;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private SharingDAO sharingDAO;
	@Autowired
	private QnaDAO qnaDAO;

	@GetMapping("mypage")
	public ModelAndView test(ModelAndView mv) throws Exception {
		List<MemberDTO> bizMembers = memberDAO.getAllBizmen();
		List<MemberDTO> guestMembers = memberDAO.getAllGuest();
		List<CouponDTO> list = adminService.getCouponList();
		mv.addObject("list", list);
		mv.addObject("biz", bizMembers);
		mv.addObject("guest", guestMembers);
		mv.setViewName("admin/admin");
		return mv;
	}

	@PostMapping("addcoupon")
	@ResponseBody
	public int setAddCoupon(CouponDTO couponDTO) throws Exception {
		int result = adminService.setAddCoupon(couponDTO);
		return result;
	}
	
	@PostMapping("deletecoupon")
	@ResponseBody
	public int setDeleteCoupon(CouponDTO couponDTO) throws Exception{
		System.out.println(couponDTO.getCouponNum());
		int result = adminService.setDeleteCoupon(couponDTO);
		return result;
	}

	@GetMapping("couponlist")
	@ResponseBody
	public List<CouponDTO> getCouponList() throws Exception {
		List<CouponDTO> list = adminService.getCouponList();
		return list;
	}
	
	//멤버 탈퇴
	@PostMapping("deletemember")
	@ResponseBody
	public int setMemberDelete(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.setMemDelete(memberDTO);
		return result;
	}
	//멤버 등급부여
	public void setUpdateMember() throws Exception{
		
	}
	
	//멤버별 쓴글, 상품목록 불러오기 (같이해요)
	@GetMapping("sharinglist")
	@ResponseBody
	public Map<String, Object> getMemberBoardList(MemberDTO memberDTO, Pager pager) throws Exception{
		pager.setSearch(memberDTO.getUserId());
		List<SharingDTO> sharing = adminService.getMemberSharingList(pager);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("sharing", sharing);

		
		return map;
		
	}
	
	// 같이해요 삭제
	@PostMapping("sharingdelete")
	@ResponseBody
	public int setDeleteMemSharing(BoardDTO boardDTO) throws Exception{
		int result = sharingDAO.setDelete(boardDTO);
		return result;
	}
	
	//멤버별 쓴글, 상품목록 불러오기 (QNA)
	@GetMapping("qnalist")
	@ResponseBody
	public Map<String, Object> getMemberQnaList(MemberDTO memberDTO, Pager pager) throws Exception{
		pager.setSearch(memberDTO.getUserId());
		List<QnaDTO> qna = adminService.getMemberQnaList(pager);
			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("qna", qna);

			
		return map;
			
		}
		
	// qna 삭제
	@PostMapping("qnadelete")
	@ResponseBody
	public int setDeleteMemQna(BoardDTO boardDTO) throws Exception{
		int result = qnaDAO.setDelete(boardDTO);
		return result;
	}
	
	
	//멤버별 결제한 상품 불러오기
	public void getMemberItemList() throws Exception{
		
	}
	
	//1:1 문의 리스트 불러오기
	public void getQnaList() throws Exception{
		
	}
	
	//1:1문의 답글달기
	public void setQnaReply() throws Exception{
		
	}
	
	//1:1문의 삭제
	public void setQnaDelete() throws Exception{
		
	}
	
	// 공지사항 리스트 불러오기
	public void getNoticeList() throws Exception{
		
	}
	//공지사항 작성하기
	public void setNoticeAdd() throws Exception{
		
	}
	
	//회원에게 쿠폰 추가하기
	public void setCouponAddToMember() throws Exception{
		
	}
	
	
	
	
}
