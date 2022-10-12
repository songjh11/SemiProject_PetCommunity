package com.pet.home.board.event;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.impl.BoardFileDTO;
import com.pet.home.board.impl.BoardService;
import com.pet.home.util.FileManager;
import com.pet.home.util.Pager;

@Service
public class EventService implements BoardService {
	
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.getNum(eventDAO.getCount(pager));
		pager.getRowNum();
		
		return eventDAO.getList(pager);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] multipartFiles, ServletContext servletContext)
			throws Exception {
		// TODO Auto-generated method stub
		
		int result = eventDAO.setAdd(boardDTO);
		
		String path = "resources/upload/event";
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				continue;
			}
		
			String fileName = fileManager.saveFile(servletContext, path, multipartFile);
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			boardFileDTO.setNum(boardDTO.getNum());
			eventDAO.setFileAdd(boardFileDTO);
		}
		
		
		return result;
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return eventDAO.getDetail(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return eventDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return eventDAO.setDelete(boardDTO);
	}

	@Override
	public int setFileDelete(BoardFileDTO boardFileDTO, ServletContext servletContext) throws Exception {
		// TODO Auto-generated method stub
		boardFileDTO = eventDAO.getFileDetail(boardFileDTO);
		
		int result = eventDAO.setFileDelete(boardFileDTO);
		
		String path = "resources/upload/event";
		
		if(result>0) {
			fileManager.deleteFile(servletContext, boardFileDTO, path);
		}
		
		return result;
	}
	
	public int setCouponAdd(CouponDTO couponDTO) throws Exception{
		return eventDAO.setCouponAdd(couponDTO);
	}
	
	public CouponDTO getCouponDetail(CouponDTO couponDTO) throws Exception{
		return eventDAO.getCouponDetail(couponDTO);
	}
	
	public int setCouponSave(CouponDTO couponDTO) throws Exception{
		return eventDAO.setCouponSave(couponDTO);
	}

	@Override
	public int setUpdateHit(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return eventDAO.setUpdateHit(boardDTO);
	}
	
	
	
}
