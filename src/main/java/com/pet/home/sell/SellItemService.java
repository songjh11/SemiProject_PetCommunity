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
import com.pet.home.sell.file.RvFileDTO;
import com.pet.home.sell.file.SellFileDTO;
import com.pet.home.sell.sellcategory.CategoryDTO;
import com.pet.home.sell.sellcategory.SellCategoryDTO;
import com.pet.home.util.FileManager;
import com.pet.home.util.Pager;
import com.pet.home.util.SellPager;

@Service
public class SellItemService {
	
	@Autowired
	private SellItemDAO itemDAO;
	@Autowired
	private PickDAO pickDAO;
	@Autowired
	private ShopCartDAO shopCartDAO;
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private RvCommentDAO rvCommentDAO;
	@Autowired
	private SellQnaDAO sellQnaDAO;
	@Autowired
	private SellQnaCommentDAO sellQnaCommentDAO;
	
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
	
	public List<SellItemDTO> getItemList(SellPager sellPager) throws Exception {
		sellPager.getRowNum();
		sellPager.getNum(itemDAO.getItemCount(sellPager));
		return itemDAO.getItemList(sellPager);
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
	
	public int setShopCartAdd(ShopCartDTO shopCartDTO) throws Exception{
		return shopCartDAO.setShopCartAdd(shopCartDTO);
	}
	
	public ShopCartDTO getShopCartCheck(ShopCartDTO shopCartDTO) throws Exception{
		return shopCartDAO.getShopCartCheck(shopCartDTO);
	}
	
	public int setShopCartDelete(ShopCartDTO shopCartDTO) throws Exception{
		return shopCartDAO.setShopCartDelete(shopCartDTO);
	}
	
	public int setShopCartUpdate(ShopCartDTO shopCartDTO) throws Exception{
		return shopCartDAO.setShopCartUpdate(shopCartDTO);
	}
	
	public int setReviewAdd(ReviewDTO reviewDTO, MultipartFile [] mf, ServletContext servletContext) throws Exception {
		System.out.println("service");
		int result = reviewDAO.setReivewAdd(reviewDTO);
		System.out.println(reviewDTO.getItemNum());
		
			for(MultipartFile m: mf) {
				if(m.isEmpty()) {
					continue;
				}				
				
				String realPath = servletContext.getRealPath("resources/upload/reviewfile");
				
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
				RvFileDTO rvFileDTO = new RvFileDTO();
				rvFileDTO.setFileName(fileName);
				rvFileDTO.setOriName(m.getOriginalFilename());
				rvFileDTO.setRvNum(reviewDTO.getRvNum());
				reviewDAO.setAddReviewFile(rvFileDTO);
				System.out.println("저장");
			}//for end
			
		return result;
	}
	
	public List<ReviewDTO> getReviewList(com.pet.home.util.CommentPager commentPager)throws Exception{
		commentPager.getRowNum();
		Long totalCount = reviewDAO.getReviewListTotalCount(commentPager);
		commentPager.makePage(totalCount);
		return reviewDAO.getReviewList(commentPager);
	}
	
	public SellItemDTO getMap() throws Exception{
		return itemDAO.getMap();
	}
	
	public ReviewDTO getReviewUpdate(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.getReviewUpdate(reviewDTO);
	}
	
	public int setFileDelete(RvFileDTO rvFileDTO,ServletContext servletContext) throws Exception{
		rvFileDTO = reviewDAO.getFileDetail(rvFileDTO);
		int result = reviewDAO.setFileDelete(rvFileDTO);
		String path = "resources/upload/reviewfile";
		
		if(result > 0) {
			fileManager.deleteFile(servletContext, rvFileDTO, path);
		}
		
		return result;
	}
	
	public int setReviewUpdate(ReviewDTO reviewDTO, MultipartFile [] mf, ServletContext servletContext) throws Exception{
		int result = reviewDAO.setReviewUpdate(reviewDTO);
		for(MultipartFile m: mf) {
			if(m.isEmpty()) {
				continue;
			}				
			
			String realPath = servletContext.getRealPath("resources/upload/reviewfile");
			
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
			RvFileDTO rvFileDTO = new RvFileDTO();
			rvFileDTO.setFileName(fileName);
			rvFileDTO.setOriName(m.getOriginalFilename());
			rvFileDTO.setRvNum(reviewDTO.getRvNum());
			reviewDAO.setAddReviewFile(rvFileDTO);
			System.out.println("저장");
		}//for end
		
		return result;
	}
	
	public int setReviewDelete(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.setReviewDelete(reviewDTO);
	}
	
	public int setReviewCommentAllDelete(RvCommentDTO rvCommentDTO) throws Exception{
		return rvCommentDAO.setReviewCommentAllDelete(rvCommentDTO);
	}
	
	public int setReviewCommentDelete(RvCommentDTO rvCommentDTO) throws Exception{
		return rvCommentDAO.setReviewCommentDelete(rvCommentDTO);
	}
	
	public int setReviewCommentAdd(RvCommentDTO rvCommentDTO) throws Exception{
		return rvCommentDAO.setReviewCommentAdd(rvCommentDTO);
	}
	
	public int setReviewCommentUpdate(RvCommentDTO rvCommentDTO) throws Exception{
		return rvCommentDAO.setReviewCommentUpdate(rvCommentDTO);
	}
	
	
	
	
	
	
	
	
	public int setSellQnaAdd(SellQnaDTO sellQnaDTO) throws Exception {
		System.out.println("service");
		int result = sellQnaDAO.setSellQnaAdd(sellQnaDTO);
		return result;
	}
	
	public List<SellQnaDTO> getSellQnaList(com.pet.home.util.CommentPager commentPager)throws Exception{
		commentPager.getRowNum();
		Long totalCount = sellQnaDAO.getSellQnaListTotalCount(commentPager);
		commentPager.makePage(totalCount);
		return sellQnaDAO.getSellQnaList(commentPager);
	}
	
	public SellQnaDTO getSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception{
		return sellQnaDAO.getSellQnaUpdate(sellQnaDTO);
	}

	
	public int setSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception{
		int result = sellQnaDAO.setSellQnaUpdate(sellQnaDTO);
		return result;
	}
	
	public int setSellQnaDelete(SellQnaDTO sellQnaDTO) throws Exception{
		return sellQnaDAO.setSellQnaDelete(sellQnaDTO);
	}
	
	public int setSellQnaCommentAllDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return sellQnaCommentDAO.setSellQnaCommentAllDelete(sellQnaCommentDTO);
	}
	
	public int setSellQnaCommentDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return sellQnaCommentDAO.setSellQnaCommentDelete(sellQnaCommentDTO);
	}
	
	public int setSellQnaCommentAdd(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return sellQnaCommentDAO.setSellQnaCommentAdd(sellQnaCommentDTO);
	}
	
	public int setSellQnaCommentUpdate(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return sellQnaCommentDAO.setSellQnaCommentUpdate(sellQnaCommentDTO);
	}
	
	
	//지도 매핑용
	public List<SellItemDTO> getAllItemList() throws Exception{
		return itemDAO.getAllItemList();
	}

}
