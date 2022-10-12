package com.pet.home.sell;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.member.MemberDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.sell.sellcategory.SellCategoryDTO;
import com.pet.home.util.Pager;
import com.pet.home.util.SellPager;

@Repository
public class SellItemDAO {
	
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.pet.home.sell.SellItemDAO.";
	
	public int setItemAdd(SellItemDTO itemDTO) throws Exception {
		return session.insert(NAMESPACE+"setItemAdd", itemDTO);
	}
	
	public int setCategory(SellCategoryDTO categoryDTO) throws Exception {
		return session.insert(NAMESPACE+"setCategory", categoryDTO);
	}
	
	public int setAddSellFile(SellFileDTO fileDTO) throws Exception {
		return session.insert(NAMESPACE+"setAddSellFile", fileDTO);
	}
	
	public List<SellItemDTO> getItemList(SellPager sellPager) throws Exception{
		return session.selectList(NAMESPACE+"getItemList", sellPager);
	}
	
	public List<SellItemDTO> getSellerList(SellPager sellPager) throws Exception{
		return session.selectList(NAMESPACE+"getSellerList", sellPager);
	}
	
	public Long getItemCount(SellPager sellPager) throws Exception{
		return session.selectOne(NAMESPACE+"getItemCount", sellPager);
	}
	
	public CategoryDTO getCategory(Long itemCatg) throws Exception{
		return session.selectOne(NAMESPACE+"getCategory", itemCatg);
	}
	
	public SellItemDTO getDetailOne(SellItemDTO dto) throws Exception{
		return session.selectOne(NAMESPACE+"getDetailOne", dto);
	}
	
	public SellFileDTO getSellFileDTO(SellFileDTO fileDTO) throws Exception{
		return session.selectOne(NAMESPACE+"getSellFileDTO", fileDTO);
	}
	
	public int setItemUpdate(SellItemDTO itemDTO) throws Exception {
		return session.update(NAMESPACE+"setItemUpdate", itemDTO);
	}
	
	public int setItemDelete(SellItemDTO itemDTO) throws Exception {
		return session.delete(NAMESPACE+"setItemDelete", itemDTO);
	}
	
	public int setFileDelete(Long itemNum) throws Exception {
		return session.delete(NAMESPACE+"setFileDelete", itemNum);
	}
	
	public int setUpdateFileDelete(SellFileDTO fileDTO) throws Exception {
		return session.delete(NAMESPACE+"setUpdateFileDelete", fileDTO);
	}
	
	public int setCategoryDelete(Long itemNum) throws Exception {
		return session.delete(NAMESPACE+"setCategoryDelete", itemNum);
	}
	
	public List<SellItemDTO> getItems(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+"getItems", map);
	}
	
	public SellItemDTO getMap() throws Exception{
		return session.selectOne(NAMESPACE+"getMap");
	}
	
	public List<SellItemDTO> getPickStatus(MemberDTO memberDTO) throws Exception{
		return session.selectList(NAMESPACE+"getPickStatus",memberDTO);
	}
	
	public List<SellItemDTO> getShopCartStatus(MemberDTO memberDTO) throws Exception{
		return session.selectList(NAMESPACE+"getShopCartStatus",memberDTO);
	}
	
	//지도 매핑용 전체 상품 리스트
	public List<SellItemDTO> getAllItemList() throws Exception{
		return session.selectList(NAMESPACE+"getAllItemList");
	}
	
	public List<SellItemDTO> getPurchaseListtoMain() throws Exception {
		return session.selectList(NAMESPACE+"getPurchaseListtoMain");
	}
	
	public Long getSellerItemCount(SellPager pager) {
		return session.selectOne(NAMESPACE+"getSellerItemCount", pager);
	}
}
