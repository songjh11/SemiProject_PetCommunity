package com.pet.home.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.qna.QnaDTO;
import com.pet.home.board.sharing.SharingDTO;
import com.pet.home.member.MemberDTO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.admin.AdminDAO.";

	public int setAddCoupon(CouponDTO couponDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAddCoupon", couponDTO);
	}

	public List<CouponDTO> getCouponList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getCouponList");
	}
	
	public int setDeleteCoupon(CouponDTO couponDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDeleteCoupon", couponDTO);
	}
	
	public List<QnaDTO> getMemberQnaList(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberQnaList", boardDTO);
	}
	public List<SharingDTO> getMemberSharingList(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberSharingList", boardDTO);
	}	

}
