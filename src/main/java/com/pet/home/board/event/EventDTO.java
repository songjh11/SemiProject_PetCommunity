package com.pet.home.board.event;

import java.util.List;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;

public class EventDTO extends BoardDTO {
	
	private List<CouponDTO> couponDTOs;

	public List<CouponDTO> getCouponDTOs() {
		return couponDTOs;
	}

	public void setCouponDTOs(List<CouponDTO> couponDTOs) {
		this.couponDTOs = couponDTOs;
	}
	
	
	
}
