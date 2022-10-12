package com.pet.home.board.sharing;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.impl.BoardFileDTO;
import com.pet.home.board.impl.BoardService;
import com.pet.home.board.notice.NoticeDAO;
import com.pet.home.util.BoardCommentPager;
import com.pet.home.util.FileManager;
import com.pet.home.util.Pager;

@Service
public class SharingService implements BoardService {

	@Autowired
	private SharingDAO sharingDAO;
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.getNum(sharingDAO.getCount(pager));
		pager.getRowNum();

		return sharingDAO.getList(pager);
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] multipartFiles, ServletContext servletContext)
			throws Exception {
		// TODO Auto-generated method stub
		int result = sharingDAO.setAdd(boardDTO);

		String path = "resources/upload/sharing";
		for (MultipartFile multipartFile : multipartFiles) {
			if (multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.saveFile(servletContext, path, multipartFile);
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			boardFileDTO.setNum(boardDTO.getNum());
			sharingDAO.setFileAdd(boardFileDTO);
		}

		return result;
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.getDetail(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.setDelete(boardDTO);
	}

	@Override
	public int setFileDelete(BoardFileDTO boardFileDTO, ServletContext servletContext) throws Exception {
		// TODO Auto-generated method stub
		boardFileDTO = sharingDAO.getFileDetail(boardFileDTO);

		int result = sharingDAO.setFileDelete(boardFileDTO);

		String path = "resources/upload/sharing";

		if (result > 0) {
			fileManager.deleteFile(servletContext, boardFileDTO, path);
		}

		return result;
	}

	// 댓글 처리

	public List<ShCommentDTO> getCommentList(BoardCommentPager boardCommentPager) throws Exception {
		boardCommentPager.getRowNum();
		boardCommentPager.makePage(sharingDAO.getCommentListTotalCount(boardCommentPager));

		return sharingDAO.getCommentList(boardCommentPager);
	}

	public int setCommentAdd(ShCommentDTO shCommentDTO) throws Exception {
		return sharingDAO.setCommentAdd(shCommentDTO);
	}

	public int setCommentDelete(ShCommentDTO shCommentDTO) throws Exception {
		return sharingDAO.setCommentDelete(shCommentDTO);
	}

	public int setCommentUpdate(ShCommentDTO shCommentDTO) throws Exception {
		return sharingDAO.setCommentUpdate(shCommentDTO);
	}
	
	
	public List<BoardDTO> getListByHit() throws Exception{
		return sharingDAO.getListByHit();
	}

	@Override
	public int setUpdateHit(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.setUpdateHit(boardDTO);
	}
	
	
}
