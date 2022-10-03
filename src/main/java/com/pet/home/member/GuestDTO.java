package com.pet.home.member;

public class GuestDTO extends MemberDTO {

	private String petCatg;
	private String petName;
	private Long guestId;

	public Long getGuestId() {
		return guestId;
	}

	public void setGuestId(Long guestId) {
		this.guestId = guestId;
	}

	public String getPetCatg() {
		return petCatg;
	}

	public void setPetCatg(String petCatg) {
		this.petCatg = petCatg;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

}
