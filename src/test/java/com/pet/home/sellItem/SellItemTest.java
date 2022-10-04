package com.pet.home.sellItem;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pet.home.MyAbstractTest;
import com.pet.home.sell.SellItemDAO;
import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.sellcategory.SellCategoryDTO;

public class SellItemTest extends MyAbstractTest {

	@Autowired
	private SellItemDAO sellItemDAO;

	@Test
	public void setItemAddTest() throws Exception {
		for (int i = 1; i < 50; i++) {

			SellItemDTO dto = new SellItemDTO();
			dto.setUserId("m1");
			dto.setItemPrice(20000L + i);
			dto.setItemName("호텔링" + i);
			dto.setItemContents("상품상세설명");
			dto.setItemZipCode(63534L);
			dto.setItemAddress("제주특별자치도 서귀포시 가가로 14 (상예동)");
			dto.setItemDeAddress("구디아카데미");
			dto.setItemCatg(1L);
			sellItemDAO.setItemAdd(dto);

			SellCategoryDTO categoryDTO = new SellCategoryDTO();
			categoryDTO.setItemNum(dto.getItemNum());
			categoryDTO.setCategoryNum(dto.getItemCatg());
			sellItemDAO.setCategory(categoryDTO);

			SellFileDTO fileDTO = new SellFileDTO();
			fileDTO.setFileName("이미지 수정 (" + i + ")" + ".png");
			fileDTO.setItemNum(dto.getItemNum());
			fileDTO.setOriName("이미지 수정 (" + i + ")" + ".png");
			sellItemDAO.setAddSellFile(fileDTO);
		}

	}

	@Test
	public void getDetailOne() throws Exception {
		SellItemDTO dto = new SellItemDTO();
		dto.setItemNum(461L);
		dto = sellItemDAO.getDetailOne(dto);

		System.out.println(dto.getFileDTOs().size());
		assertNotEquals(0, dto);

	}

}
