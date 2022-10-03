package com.pet.home.sell;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.sell.file.RvFileDTO;
import com.pet.home.util.CommentPager;

@Repository
public class SellQnaDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.pet.home.sell.SellQnaDAO.";
	
	public int setSellQnaAdd(SellQnaDTO sellQnaDTO) throws Exception{
		return session.insert(NAMESPACE+"setSellQnaAdd", sellQnaDTO);
	}
	
	public List<SellQnaDTO> getSellQnaList(CommentPager commentPager) throws Exception{
		return session.selectList(NAMESPACE+"getSellQnaList", commentPager);
	}
	
	public Long getSellQnaListTotalCount(CommentPager commentPager) throws Exception{
		return session.selectOne(NAMESPACE+"getSellQnaListTotalCount", commentPager);
	}
	
	public SellQnaDTO getSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception{
		return session.selectOne(NAMESPACE+"getSellQnaUpdate", sellQnaDTO);
	}
	
	public int setSellQnaUpdate(SellQnaDTO sellQnaDTO) throws Exception{
		return session.update(NAMESPACE+"setSellQnaUpdate", sellQnaDTO);
	}
	
	public int setSellQnaDelete(SellQnaDTO sellQnaDTO) throws Exception{
		return session.delete(NAMESPACE+"setSellQnaDelete", sellQnaDTO);
	}
}
