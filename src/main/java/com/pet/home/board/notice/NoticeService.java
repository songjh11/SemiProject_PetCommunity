package com.pet.home.board.notice;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.impl.BoardFileDTO;
import com.pet.home.board.impl.BoardService;
import com.pet.home.util.FileManager;
import com.pet.home.util.Pager;

@Service
public class NoticeService implements BoardService {

	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int setFileDelete(BoardFileDTO boardFileDTO, ServletContext servletContext) throws Exception {
		// TODO Auto-generated method stub
		boardFileDTO = noticeDAO.getFileDetail(boardFileDTO);
		
		int result = noticeDAO.setFileDelete(boardFileDTO);
		
		String path = "resources/upload/notice";
		
		if(result > 0) {
			fileManager.deleteFile(servletContext, boardFileDTO, path);
		}
		
		return result;
	}
	
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.getRowNum();

		pager.getNum(noticeDAO.getCount(pager));

		return noticeDAO.getList(pager);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile [] multipartFiles, ServletContext servletContext) throws Exception {
		// TODO Auto-generated method stub
		
		// * 글 Add
		int result = noticeDAO.setAdd(boardDTO);
		
		//1. 저장될 폴더 설정
		String path = "resources/upload/notice";
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.saveFile(servletContext, path, multipartFile);
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			boardFileDTO.setNum(boardDTO.getNum());
			noticeDAO.setFileAdd(boardFileDTO);
		}
		
		return result;
	}
	
	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.getDetail(boardDTO);
	}
	
	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.setUpdate(boardDTO);
	}
	
	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.setDelete(boardDTO);
	}
	
	
}
