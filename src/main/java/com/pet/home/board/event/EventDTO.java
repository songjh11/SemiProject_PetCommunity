package com.pet.home.board.event;

import java.util.List;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;

public class EventDTO extends BoardDTO {
	
	private CouponDTO couponDTO;

	public CouponDTO getCouponDTO() {
		return couponDTO;
	}

	public void setCouponDTO(CouponDTO couponDTO) {
		this.couponDTO = couponDTO;
	}

	
}
