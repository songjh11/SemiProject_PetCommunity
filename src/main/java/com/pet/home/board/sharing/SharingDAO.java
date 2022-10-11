package com.pet.home.board.sharing;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.board.impl.BoardDAO;
import com.pet.home.board.impl.BoardDTO;
import com.pet.home.board.impl.BoardFileDTO;
import com.pet.home.util.BoardCommentPager;
import com.pet.home.util.Pager;

@Repository
public class SharingDAO implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.board.sharing.sharingDAO.";
	
	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return 	sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setAdd", boardDTO);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getDetail", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setUpdate", boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setDelete", boardDTO);
	}

	@Override
	public Long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}

	@Override
	public int setFileAdd(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setFileAdd", boardFileDTO);
	}

	@Override
	public int setFileDelete(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setFileDelete", boardFileDTO);
	}

	@Override
	public BoardFileDTO getFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getFileDetail", boardFileDTO);
	}
	
	// Comment 처리
	
	public List<ShCommentDTO> getCommentList(BoardCommentPager boardCommentPager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCommentList", boardCommentPager);
	}
	
	public int setCommentAdd(ShCommentDTO shCommentDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCommentAdd", shCommentDTO);
	}
	
	public Long getCommentListTotalCount(BoardCommentPager boardCommentPager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCommentListTotalCount", boardCommentPager);
	}
	
	public int setCommentDelete(ShCommentDTO shCommentDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCommentDelete", shCommentDTO);
	}
	
	public int setCommentUpdate(ShCommentDTO shCommentDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setCommentUpdate", shCommentDTO);
	}

	@Override
	public int setUpdateHit(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setUpdateHit", boardDTO);
	}
	
	public List<BoardDTO> getListByHit() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getListByHit");
	}
	
	
}
