package com.pet.home.board.qna;

import com.pet.home.board.impl.BoardDTO;

public class QnaDTO extends BoardDTO {
	
	public Long ref;
	public Long step;
	public Long depth;
	public Long getRef() {
		return ref;
	}
	public void setRef(Long ref) {
		this.ref = ref;
	}
	public Long getStep() {
		return step;
	}
	public void setStep(Long step) {
		this.step = step;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	
	
	
}
