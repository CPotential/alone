package org.kosta.alone.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.BoardVO;
import org.kosta.alone.model.vo.PagingBean;
import org.kosta.alone.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ReviewVO> reviewList(PagingBean pagingBean) {
		System.out.println(sqlSessionTemplate.selectList("review.reviewList",pagingBean));
		return sqlSessionTemplate.selectList("review.reviewList",pagingBean);
	}
	
	public int getTotalContentCount(){
		return sqlSessionTemplate.selectOne("review.getTotalContentCount"); 
	}

	@Override
	public List<ReviewVO> reviewTitleSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("review.reviewTitleSearchList",map);
	}

	@Override
	public List<ReviewVO> reviewWriterSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("review.reviewWriterSearchList",map);
	}
	
	public void reviewBoardWrite(ReviewVO reviewVO){ 
		sqlSessionTemplate.insert("review.reviewBoardWrite",reviewVO);
	}
	
	public void reviewWrite(ReviewVO reviewVO){
		sqlSessionTemplate.insert("review.reviewWrite",reviewVO);
	}
	
	public ReviewVO reviewDetail(int boardNo){ 
		return sqlSessionTemplate.selectOne("review.reviewDetail", boardNo);
	}

	@Override
	public int getTitleSearchContentCount(String searchKeyWord) {
		return sqlSessionTemplate.selectOne("review.getTitleSearchContentCount",searchKeyWord); 
	}
	
	@Override
	public int getWriterSearchCount(String searchKeyWord) {
		return sqlSessionTemplate.selectOne("review.getWriterSearchCount",searchKeyWord); 
	}

	@Override
	public void updateHit(int boardNo) {
		sqlSessionTemplate.update("review.updateHitBoard",boardNo);
	}
	
	public void reviewUpdate(ReviewVO reviewVO){
		sqlSessionTemplate.update("review.reviewUpdate",reviewVO);
	}
	
	public void likeUp(BoardVO bvo){
		sqlSessionTemplate.update("review.likeup",bvo);
	}

	@Override
	public int likeCheckNumber(BoardVO bvo) {
		return sqlSessionTemplate.selectOne("review.likeChekcNumber",bvo);
	}

	@Override
	public void mileageInsert(HashMap<String, Object> map) {
		sqlSessionTemplate.insert("review.mileageInsert",map);	
	}

	@Override
	public void mileageUpdate(HashMap<String, Object> map) {
		sqlSessionTemplate.update("review.mileageUpdate",map);
	}
	
}
