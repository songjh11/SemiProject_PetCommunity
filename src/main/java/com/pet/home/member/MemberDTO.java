package com.pet.home.member;

import java.util.List;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.ShopCartDTO;
import com.pet.home.sell.check.CheckDTO;
import com.pet.home.sell.file.SellFileDTO;

public class MemberDTO {   
	
	private String userId;
	private Integer roleNum;
	private String userName;
	private String password;
	private String email;
	private String phone;
	private String address;
	private Integer block;
	private Integer agMail;
	private Integer agValue;
	private Integer agMes;

	private String itemCatg;
	private String itemId;
	private Long bizNum;
	
	private String petCatg;
	private String petName;
	private Long guestId;

	private List<CouponDTO> couponDTOs;
	

	public List<CouponDTO> getCouponDTOs() {
		return couponDTOs;
	}
	public void setCouponDTOs(List<CouponDTO> couponDTOs) {
		this.couponDTOs = couponDTOs;
	}
	private Long totalPrice;
	private List<ShopCartDTO> shopCartDTOs;
 

	private RoleDTO roleDTO;
	private MemberFileDTO memberFileDTO;
	
	private Long itemZipCode;
	private String deAddress;

	private List<RoleDTO> roleDTOs;
    private List<SellItemDTO> itemDTOs;
    private List<SellFileDTO> fileDTOs;
    private List<FollowDTO> followDTOs;
    
	public List<FollowDTO> getFollowDTOs() {
		return followDTOs;
	}
	public void setFollowDTOs(List<FollowDTO> followDTOs) {
		this.followDTOs = followDTOs;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getRoleNum() {
		return roleNum;
	}
	public void setRoleNum(Integer roleNum) {
		this.roleNum = roleNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getBlock() {
		return block;
	}
	public void setBlock(Integer block) {
		this.block = block;
	}
	public Integer getAgMail() {
		return agMail;
	}
	public void setAgMail(Integer agMail) {
		this.agMail = agMail;
	}
	public Integer getAgValue() {
		return agValue;
	}
	public void setAgValue(Integer agValue) {
		this.agValue = agValue;
	}
	public Integer getAgMes() {
		return agMes;
	}
	public void setAgMes(Integer agMes) {
		this.agMes = agMes;
	}
	public String getItemCatg() {
		return itemCatg;
	}
	public void setItemCatg(String itemCatg) {
		this.itemCatg = itemCatg;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public Long getBizNum() {
		return bizNum;
	}
	public void setBizNum(Long bizNum) {
		this.bizNum = bizNum;
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
	public Long getGuestId() {
		return guestId;
	}
	public void setGuestId(Long guestId) {
		this.guestId = guestId;
	}
	public RoleDTO getRoleDTO() {
		return roleDTO;
	}
	public void setRoleDTO(RoleDTO roleDTO) {
		this.roleDTO = roleDTO;
	}
	public MemberFileDTO getMemberFileDTO() {
		return memberFileDTO;
	}
	public void setMemberFileDTO(MemberFileDTO memberFileDTO) {
		this.memberFileDTO = memberFileDTO;
	}
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Long getItemZipCode() {
		return itemZipCode;
	}
	public void setItemZipCode(Long itemZipCode) {
		this.itemZipCode = itemZipCode;
	}
	public String getDeAddress() {
		return deAddress;
	}
	public void setDeAddress(String deAddress) {
		this.deAddress = deAddress;
	}
	public List<ShopCartDTO> getShopCartDTOs() {
		return shopCartDTOs;
	}
	public void setShopCartDTOs(List<ShopCartDTO> shopCartDTOs) {
		this.shopCartDTOs = shopCartDTOs;
	}
	public List<RoleDTO> getRoleDTOs() {
		return roleDTOs;
	}
	public void setRoleDTOs(List<RoleDTO> roleDTOs) {
		this.roleDTOs = roleDTOs;
	}
	public List<SellItemDTO> getItemDTOs() {
		return itemDTOs;
	}
	public void setItemDTOs(List<SellItemDTO> itemDTOs) {
		this.itemDTOs = itemDTOs;
	}
	public List<SellFileDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<SellFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	
   
	

	
	

}
