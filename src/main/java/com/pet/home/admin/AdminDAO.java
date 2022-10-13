package com.pet.home.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.qna.QnaDTO;
import com.pet.home.board.sharing.SharingDTO;
import com.pet.home.member.BizmemDTO;
import com.pet.home.member.MemberDTO;
import com.pet.home.sell.SellItemDTO;
import com.pet.home.util.CommentPager;
import com.pet.home.util.Pager;
import com.pet.home.util.SellPager;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.admin.AdminDAO.";

	public int setAddCoupon(CouponDTO couponDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAddCoupon", couponDTO);
	}

	public List<CouponDTO> getCouponList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getCouponList", pager);
	}
	
	public Long getCouponCount() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCouponCount");
	}
	
	public int setDeleteCoupon(CouponDTO couponDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteCoupon", couponDTO);
	}
	
	public List<QnaDTO> getMemberQnaList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberQnaList", pager);
	}
	
	public Long getQnaCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getQnaCount", pager);
	}
	
	public List<SharingDTO> getMemberSharingList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberSharingList", pager);
	}	
	
	public Long getSharingCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSharingCount", pager);
	}
	
	
	public List<MemberDTO> getAllGuset(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAllGuest", pager);
	}
	
	public Long getAllGuestCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllGuestCount",pager);
	}
	
	public List<BizmemDTO> getAllBizmen(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAllBizmen", pager);
	}
	
	public Long getAllBizmenCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAllBizmenCount",pager);
	}
	
	public List<SellItemDTO> getSellerList(SellPager sellPager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getSellerList",sellPager);
	}
	
	public CouponDTO getCouponByNum(CouponDTO couponDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCouponByNum", couponDTO);
	}
	
	public int setDeleteMemberCoupon(CouponDTO couponDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteMemberCoupon", couponDTO);
	}
	
	public MemberDTO getMemberByUserName(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberByUserName",memberDTO);
	}
}
