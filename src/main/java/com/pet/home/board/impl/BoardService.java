package com.pet.home.board.impl;

import java.util.List;

import com.pet.home.util.Pager;

public interface BoardService {

	public List<BoardDTO> getList(Pager pager) throws Exception;
	
	public int setAdd(BoardDTO boardDTO) throws Exception; 
	
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception;
	
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	
	public int setDelete(BoardDTO boardDTO) throws Exception;
}
