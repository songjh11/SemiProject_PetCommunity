package com.pet.home.sell;

import java.io.File;
import java.nio.file.Files;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.sell.sellcategory.SellCategoryDTO;
import com.pet.home.util.Pager;

@Service
public class SellItemService {
	
	@Autowired
	private SellItemDAO itemDAO;
	@Autowired
	private PickDAO pickDAO;
	
	public int setItemAdd(SellItemDTO itemDTO, MultipartFile [] files, ServletContext servletContext) throws Exception {
		int result = itemDAO.setItemAdd(itemDTO);
		SellCategoryDTO categoryDTO = new SellCategoryDTO();
		categoryDTO.setItemNum(itemDTO.getItemNum());
		categoryDTO.setCategoryNum(itemDTO.getItemCatg());
		itemDAO.setCategory(categoryDTO);
		
			for(MultipartFile m: files) {
				if(m.isEmpty()) {
					continue;
				}				
				
				String realPath = servletContext.getRealPath("resources/upload/sellfile");
				
				File file = new File(realPath);
				
				if(!file.exists()) {
					file.mkdirs();
				}
				
				Calendar ca = Calendar.getInstance();
				Long l = ca.getTimeInMillis();
				String oriName = m.getOriginalFilename();
				String fileName = l+"_"+oriName;
				file = new File(file, fileName);
				
				System.out.println(realPath);
				System.out.println(fileName);
				
				m.transferTo(file);
				SellFileDTO fileDTO = new SellFileDTO();
				fileDTO.setFileName(fileName);
				fileDTO.setOriName(m.getOriginalFilename());
				fileDTO.setItemNum(itemDTO.getItemNum());
				itemDAO.setAddSellFile(fileDTO);
				System.out.println("저장");
			}//for end
			
		return result;
	}
	
	public List<SellItemDTO> getItemList(SellItemDTO dto) throws Exception {
		return itemDAO.getItemList(dto);
	}
	
	public CategoryDTO getCategory(Long itemCatg) throws Exception{
		return itemDAO.getCategory(itemCatg);
	}
	
	public SellItemDTO getDetailOne(SellItemDTO dto) throws Exception{
		return itemDAO.getDetailOne(dto);
	}
	
	public int setItemUpdate(SellItemDTO itemDTO, MultipartFile [] files, ServletContext servletContext) throws Exception {
		int result = itemDAO.setItemUpdate(itemDTO);
		
		for(MultipartFile m: files) {
			if(m.isEmpty()) {
				continue;
			}				
			
			String realPath = servletContext.getRealPath("resources/upload/sellfile");
			
			File file = new File(realPath);
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			Calendar ca = Calendar.getInstance();
			Long l = ca.getTimeInMillis();
			String oriName = m.getOriginalFilename();
			String fileName = l+"_"+oriName;
			file = new File(file, fileName);
			
			System.out.println(realPath);
			System.out.println(fileName);
			
			m.transferTo(file);
			SellFileDTO fileDTO = new SellFileDTO();
			fileDTO.setFileName(fileName);
			fileDTO.setOriName(m.getOriginalFilename());
			fileDTO.setItemNum(itemDTO.getItemNum());
			itemDAO.setAddSellFile(fileDTO);
			System.out.println("저장");
		}//for end
		
		return result;
	}
	
	public int setItemDelete(SellItemDTO itemDTO, ServletContext context) throws Exception {
			itemDTO = itemDAO.getDetailOne(itemDTO);
			List<SellFileDTO> files = itemDTO.getFileDTOs();
			itemDAO.setFileDelete(itemDTO.getItemNum());
		for(SellFileDTO m: files) {
			String path = context.getRealPath("resources/upload/sellfile");
			System.out.println(path);
			File file = new File(path, m.getFileName());
			file.delete();	
			}
		int result = itemDAO.setCategoryDelete(itemDTO.getItemNum());
		return itemDAO.setItemDelete(itemDTO);
	}
	
	public int setUpdateFileDelete(SellFileDTO fileDTO, ServletContext servletContext) throws Exception {
		fileDTO = itemDAO.getSellFileDTO(fileDTO);
		int result = itemDAO.setUpdateFileDelete(fileDTO);		
		String path = servletContext.getRealPath("resources/upload/sellfile");
		System.out.println(path);
		File file = new File(path, fileDTO.getFileName());
		file.delete();		
		return result;
	}

	public List<SellItemDTO> getItems(Map<String, Object> map) throws Exception {
		return itemDAO.getItems(map);
	}
	
	public int setPickAdd(PickDTO pickDTO) throws Exception{
		return pickDAO.setPickAdd(pickDTO);
	}
	
	public PickDTO getPickCheck(PickDTO pickDTO) throws Exception{
		return pickDAO.getPickCheck(pickDTO);
	}
	
	public int setPickDelete(PickDTO pickDTO) throws Exception{
		return pickDAO.setPickDelete(pickDTO);
	}
	
	public SellItemDTO getMap() throws Exception{
		return itemDAO.getMap();
	}
	

}
