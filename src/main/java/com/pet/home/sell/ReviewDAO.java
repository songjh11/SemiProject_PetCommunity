package com.pet.home.sell;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.sell.file.RvFileDTO;
import com.pet.home.util.CommentPager;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.pet.home.sell.ReviewDAO.";

	public int setReivewAdd(ReviewDTO reviewDTO) throws Exception {
		return session.insert(NAMESPACE + "setReviewAdd", reviewDTO);
	}

	public int setAddReviewFile(RvFileDTO rvFileDTO) throws Exception {
		return session.insert(NAMESPACE + "setAddReviewFile", rvFileDTO);
	}

	public List<ReviewDTO> getReviewList(CommentPager commentPager) throws Exception {
		return session.selectList(NAMESPACE + "getReviewList", commentPager);
	}

	public Long getReviewListTotalCount(CommentPager commentPager) throws Exception {
		return session.selectOne(NAMESPACE + "getReviewListTotalCount", commentPager);
	}

	public ReviewDTO getReviewUpdate(ReviewDTO reviewDTO) throws Exception {
		return session.selectOne(NAMESPACE + "getReviewUpdate", reviewDTO);
	}

	public RvFileDTO getFileDetail(RvFileDTO rvFileDTO) throws Exception {
		return session.selectOne(NAMESPACE + "getFileDetail", rvFileDTO);
	}

	public int setFileDelete(RvFileDTO rvFileDTO) throws Exception {
		return session.delete(NAMESPACE + "setFileDelete", rvFileDTO);
	}

	public int setReviewUpdate(ReviewDTO reviewDTO) throws Exception {
		return session.update(NAMESPACE + "setReviewUpdate", reviewDTO);
	}

	public int setReviewDelete(ReviewDTO reviewDTO) throws Exception {
		return session.delete(NAMESPACE + "setReviewDelete", reviewDTO);
	}

}
