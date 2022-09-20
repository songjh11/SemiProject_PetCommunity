package com.pet.home.board.impl;

import java.util.List;

import com.pet.home.util.Pager;

public interface BoardDAO {

	//글 목록 불러오기
	public List<BoardDTO> getList(Pager pager) throws Exception;
	//글 작성하기
	public int setAdd(BoardDTO boardDTO) throws Exception;
	//글 상세정보 불러오기
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception;
	//글 수정
	public int setUpdate(BoardDTO boardDTO) throws Exception;
	//글 삭제
	public int setDelete(BoardDTO boardDTO) throws Exception;
	//글 총 개수 불러오기
	public Long getCount(Pager pager) throws Exception;
	//파일 추가하기
	public int setFileAdd(BoardFileDTO boardFileDTO) throws Exception;
	//파일 삭제
	public int setFileDelete(BoardFileDTO boardFileDTO) throws Exception;
	//파일 세부정보 불러오기
	public BoardFileDTO getFileDetail(BoardFileDTO boardFileDTO) throws Exception;
	
}
