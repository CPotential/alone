package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.PagingBean;
import org.kosta.alone.model.vo.ReviewVO;

public interface ReviewDAO {
	
	public List<ReviewVO> reviewList(PagingBean pagingBean);
	
	public int getTotalContentCount();

	public List<ReviewVO> reviewTitleSearchList(String searchKeyWord);

	public List<ReviewVO> reviewWriterSearchList(String searchKeyWord);

	public void reviewBoardWrite(ReviewVO reviewVO);
	
	public void reviewWrite(ReviewVO reviewVO);

	public ReviewVO reviewDetail(String  boardNo);
	
	public void reviewBoardUpdate(ReviewVO reviewVO);
	
	public void reviewUpdate(ReviewVO reviewVO);
}