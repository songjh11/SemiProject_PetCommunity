package com.pet.home.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.board.event.coupon.CouponDTO;

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

}
