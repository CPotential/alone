package org.kosta.alone.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.PagingBean;
import org.kosta.alone.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<ReviewVO> reviewList(PagingBean pagingBean) {
		return template.selectList("review.reviewList",pagingBean);
	}
	
	public int getTotalContentCount(){
		return template.selectOne("review.getTotalContentCount"); 
	}

	@Override
	public List<ReviewVO> reviewTitleSearchList(Map<String, Object> map) {
		return template.selectList("review.reviewTitleSearchList",map);
	}

	@Override
	public List<ReviewVO> reviewWriterSearchList(Map<String, Object> map) {
		return template.selectList("review.reviewWriterSearchList",map);
	}
	
	public void reviewBoardWrite(ReviewVO reviewVO){ 
		template.insert("review.reviewBoardWrite",reviewVO);
	}
	
	public void reviewWrite(ReviewVO reviewVO){
		template.insert("review.reviewWrite",reviewVO);
	}
	
	public ReviewVO reviewDetail(int boardNo){ 
		return template.selectOne("review.reviewDetail", boardNo);
	}



	@Override
	public int getTitleSearchContentCount(String searchKeyWord) {
		return template.selectOne("review.getTotalContentCount",searchKeyWord); 
	}

	@Override
	public int getWriterSearchCount(String searchKeyWord) {
		return template.selectOne("review.getWriterSearchCount",searchKeyWord); 
	}

	@Override
	public void updateHit(int boardNo) {
		template.update("review.updateHitBoard",boardNo);
	}
	
	public void reviewUpdate(ReviewVO reviewVO){
		template.update("review.reviewUpdate",reviewVO);
	}
}
