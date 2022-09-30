package com.pet.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.home.board.event.coupon.CouponDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	
	public int setAddCoupon(CouponDTO couponDTO) throws Exception{
		return adminDAO.setAddCoupon(couponDTO);
	}
	
	public List<CouponDTO> getCouponList() throws Exception{
		return adminDAO.getCouponList();
	}
	
	
	
	
}
