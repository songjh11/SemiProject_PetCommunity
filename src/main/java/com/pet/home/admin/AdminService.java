package com.pet.home.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.qna.QnaDTO;
import com.pet.home.board.sharing.SharingDTO;
import com.pet.home.member.MemberDTO;
import com.pet.home.util.CommentPager;
import com.pet.home.util.Pager;

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
	
	public List<QnaDTO> getMemberQnaList(Pager pager) throws Exception{
		pager.getRowNum();
		Long totalCount = adminDAO.getQnaCount(pager);
		pager.getNum(totalCount);
		
		
		return adminDAO.getMemberQnaList(pager);
	}
	public List<SharingDTO> getMemberSharingList(Pager pager) throws Exception{
		pager.getRowNum();
		Long totalCount = adminDAO.getSharingCount(pager);
		pager.getNum(totalCount);

		
		return adminDAO.getMemberSharingList(pager);
	}	
	
}
