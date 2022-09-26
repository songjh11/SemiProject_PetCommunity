package com.pet.home.board.qna;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.impl.BoardFileDTO;
import com.pet.home.board.impl.BoardService;
import com.pet.home.board.notice.NoticeDAO;
import com.pet.home.util.FileManager;
import com.pet.home.util.Pager;

@Service
public class QnaService implements BoardService {
	
	@Autowired
	private QnaDAO qnaDAO;
	private FileManager fileManager;
	
	public int setReply(QnaDTO qnaDTO) throws Exception{
		qnaDTO = (QnaDTO)qnaDAO.getDetail(qnaDTO);
		QnaDTO parent = qnaDTO;
		qnaDTO.setRef(parent.getRef());
		System.out.println(parent.getStep());
		qnaDTO.setStep(parent.getStep()+1L);
		qnaDTO.setDepth(parent.getDepth()+1L);
		
		qnaDAO.setStepUpdate(parent);
		int result = qnaDAO.setReplyAdd(qnaDTO);
		return result;
	}
	
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.getRowNum();
		pager.getNum(qnaDAO.getCount(pager));
		
		return qnaDAO.getList(pager) ;
	}

	@Override
	public int setAdd(BoardDTO boardDTO, MultipartFile[] multipartFiles, ServletContext servletContext)
			throws Exception {
		// TODO Auto-generated method stub
		
		int result = qnaDAO.setAdd(boardDTO);
		String path = "resources/upload/qna";
		for(MultipartFile multipartFile : multipartFiles) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.saveFile(servletContext, path, multipartFile);
			BoardFileDTO boardFileDTO = new BoardFileDTO();
			boardFileDTO.setFileName(fileName);
			boardFileDTO.setOriName(multipartFile.getOriginalFilename());
			boardFileDTO.setNum(boardDTO.getNum());
			qnaDAO.setFileAdd(boardFileDTO);
		}
		
		
		return result;
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.getDetail(boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setUpdate(boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.setDelete(boardDTO);
	}

	@Override
	public int setFileDelete(BoardFileDTO boardFileDTO, ServletContext servletContext) throws Exception {
		// TODO Auto-generated method stub
		boardFileDTO = qnaDAO.getFileDetail(boardFileDTO);
		
		int result = qnaDAO.setFileDelete(boardFileDTO);
		
		String path = "resources/upload/qna";
		
		if(result > 0) {
			fileManager.deleteFile(servletContext, boardFileDTO, path);
		}
		
		return result;
	}
	
	
	
}
