package com.pet.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.member.MemberDTO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@GetMapping("mypage")
	public ModelAndView test(ModelAndView mv) throws Exception {
		List<CouponDTO> list = adminService.getCouponList();
		mv.addObject("list", list);
		mv.setViewName("admin/admin");
		return mv;
	}

	@PostMapping("addcoupon")
	@ResponseBody
	public void setAddCoupon(CouponDTO couponDTO) throws Exception {
		int result = adminService.setAddCoupon(couponDTO);
	}

	@GetMapping("couponlist")
	@ResponseBody
	public List<CouponDTO> getCouponList() throws Exception {
		List<CouponDTO> list = adminService.getCouponList();
		return list;
	}
	
	@GetMapping("memberlist")
	@ResponseBody
	public List<MemberDTO> getMemberList() throws Exception{
		return null;
	}
	
}
