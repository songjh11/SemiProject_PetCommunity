package com.pet.home.board.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import com.pet.home.util.Pager;

public interface BoardService {

	public List<BoardDTO> getList(Pager pager) throws Exception;
	
	public int setAdd(BoardDTO boardDTO, MultipartFile [] multipartFiles,ServletContext servletContext) throws Exception; 
	
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception;
	
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	
	public int setDelete(BoardDTO boardDTO) throws Exception;
	
	public int setFileDelete(BoardFileDTO boardFileDTO, ServletContext servletContext) throws Exception;
}
