package com.pet.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.qna.QnaDTO;
import com.pet.home.board.sharing.SharingDTO;
import com.pet.home.member.MemberDTO;

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
	
	public int setDeleteCoupon(CouponDTO couponDTO) throws Exception{
		return adminDAO.setDeleteCoupon(couponDTO);
	}
	
	public List<QnaDTO> getMemberQnaList(BoardDTO boardDTO) throws Exception{
		return adminDAO.getMemberQnaList(boardDTO);
	}
	public List<SharingDTO> getMemberSharingList(BoardDTO boardDTO) throws Exception{
		return adminDAO.getMemberSharingList(boardDTO);
	}	
	
}
