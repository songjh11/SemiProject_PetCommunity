package com.pet.home.sell;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.sell.file.SellFileDTO;

@Service
public class SellItemService {
	
	@Autowired
	private SellItemDAO itemDAO;
	
	public int setItemAdd(SellItemDTO itemDTO, MultipartFile [] mf, ServletContext servletContext) throws Exception {
		System.out.println("service");
		int result = itemDAO.setItemAdd(itemDTO);
		System.out.println(itemDTO.getItemNum());
		
		String realPath = servletContext.getRealPath("resources/upload/sellfile");
		
		File file = new File(realPath);
		
		if(mf.length>0) {
				if(!file.exists()) {
				file.mkdir();
			}
			
			for(MultipartFile m: mf) {
				if(m.isEmpty()) {
					continue;
				}
				
				String fileName = UUID.randomUUID().toString();
				fileName = fileName+"_"+m.getOriginalFilename();
				file = new File(file, fileName);
				
				System.out.println(realPath);
				System.out.println(fileName);
				
				m.transferTo(file);
				SellFileDTO fileDTO = new SellFileDTO();
				fileDTO.setFileName(fileName);
				fileDTO.setOriName(m.getOriginalFilename());
				fileDTO.setItemNum(itemDTO.getItemNum());
				itemDAO.setAddSellFile(fileDTO);
			}//for end
		}//if end
		
		return result;
	}
	
	public List<SellItemDTO> getItemList(String itemKind) throws Exception {
		return itemDAO.getItemList(itemKind);
	}
	
	public SellItemDTO getDetailOne(SellItemDTO dto) throws Exception{
		return itemDAO.getDetailOne(dto);
	}
	
	public int setItemUpdate(SellItemDTO itemDTO) throws Exception {
		return itemDAO.setItemUpdate(itemDTO);
	}
	
	public int setItemDelete(SellItemDTO itemDTO) throws Exception {
		return itemDAO.setItemDelete(itemDTO);
	}

	public SellItemDTO getItemOne(SellItemDTO dto) throws Exception {
		return itemDAO.getItemOne(dto);
	}
	

}
