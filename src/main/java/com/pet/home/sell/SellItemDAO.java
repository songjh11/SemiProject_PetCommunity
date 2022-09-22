package com.pet.home.sell;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.sell.sellcategory.SellCategoryDTO;

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
	
	public List<SellItemDTO> getItemList(SellItemDTO dto) throws Exception{
		return session.selectList(NAMESPACE+"getItemList", dto);
	}
	
	public CategoryDTO getCategory(Long itemCatg) throws Exception{
		return session.selectOne(NAMESPACE+"getCategory", itemCatg);
	}
	
	public SellItemDTO getDetailOne(SellItemDTO dto) throws Exception{
		return session.selectOne(NAMESPACE+"getDetailOne", dto);
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
	
	public int setCategoryDelete(Long itemNum) throws Exception {
		return session.delete(NAMESPACE+"setCategoryDelete", itemNum);
	}
	
	public SellItemDTO getItemOne(SellItemDTO dto) throws Exception {
		return session.selectOne(NAMESPACE+"getItemOne", dto);
	}
	
	public SellItemDTO getMap() throws Exception{
		return session.selectOne(NAMESPACE+"getMap");
	}
	
}
